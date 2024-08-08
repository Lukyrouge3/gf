--
-- PostgreSQL database dump
--

-- Dumped from database version 13.9 (Ubuntu 13.9-1.pgdg22.04+1)
-- Dumped by pg_dump version 13.9 (Ubuntu 13.9-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: dblink_pkey_results; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.dblink_pkey_results AS (
	"position" integer,
	colname text
);


ALTER TYPE public.dblink_pkey_results OWNER TO postgres;

--
-- Name: res_set; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.res_set AS (
	pidnum integer,
	nret smallint
);


ALTER TYPE public.res_set OWNER TO postgres;

--
-- Name: account_login(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.account_login(character varying, character varying, character varying) RETURNS public.res_set
    LANGUAGE plpgsql
    AS $_$declare
ppAccountID ALIAS FOR $1;
pPassword ALIAS FOR $2;
pClientIP ALIAS FOR $3;
pAccountID varchar(20);
pcount int;
pPwd char(32) default null;
pBAuthority int2 default 0;
pGMIP varchar(15) default null;

res res_set;

BEGIN
pAccountID = lower(ppAccountID);
res.nRet=-1;

SELECT INTO pcount count(mid) FROM "tb_user" WHERE mid=pAccountID;
IF pcount =0 THEN --This Account is not exist
res.pIdNum= -1;
res.nRet = 2;
RETURN res;
END IF;

SELECT INTO pPwd,pBAuthority,res.pIdNum pwd,byAuthority,idnum FROM "tb_user" WHERE mid=pAccountID;

IF pPwd IS null THEN
res.nRet = 2;
RETURN res;
ELSEIF pPwd <> pPassword THEN
res.nRet = 3;
RETURN res;
END IF;

IF pBAuthority = 255 THEN   --This Account was locked
res.nRet = 5;
RETURN res;
END IF;

--IF pBAuthority = 1 THEN   --gmAccount  Check ip (0-->User, 1-->GM, 255-->Locked)
--SELECT INTO pGMIP ip FROM gmip WHERE ip=pClientIP;
--IF pGMIP IS NULL THEN
--res.nRet = 4;
--RETURN res;
--END IF;
--END IF;

res.nRet = 1;
RETURN res;
END;
$_$;


ALTER FUNCTION public.account_login(character varying, character varying, character varying) OWNER TO postgres;

--
-- Name: account_logoutx(character varying, character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.account_logoutx(character varying, character varying, character varying, character varying, integer) RETURNS smallint
    LANGUAGE plpgsql
    AS $_$DECLARE
ppAccountID ALIAS FOR $1;
pCharID_var ALIAS FOR $2;
pServerIP_var ALIAS FOR $3;
pClientIP_var ALIAS FOR $4;
pServerID_var ALIAS FOR $5;
pAccountID varchar(21);

-- update billing data when logout
pServerID int2;
pCharID integer;
pServerIP varchar(15);
pClientIP varchar(15);
pstrCharID varchar(32);
pPValue int2;
pExpireDate timestamp;
pBillingRule int2;
pFree bit;
pDeduction int2;
pAddTime int2;
pTimeFormat char(2);
pMID char(20);
pVPS int2;
pUnits real;

pTotalVPS int4 default 0;
pTimeLogin timestamp;
pDuring int4;
pTimeLogout timestamp;
pBrule int2;
pOriServerID int2;
pOriServerIP varchar(15);


integer_var integer;

BEGIN
pAccountID = ppAccountID;  
SELECT INTO pMID mid FROM tb_user where mid=pAccountID;
GET DIAGNOSTICS integer_var = ROW_COUNT;

IF(integer_var > 0) THEN

SELECT INTO pTimeLogin,  pServerID, pServerIP,pClientIP,pstrCharID,pCharID  logindate, serverid, serverip,clientip,strcharid,char_id FROM currentuser WHERE mid=pAccountID;


pDuring = CAST(EXTRACT(EPOCH FROM now()) - EXTRACT(EPOCH FROM pTimeLogin) as int4) / 60;

UPDATE tb_user SET status=0,clientip=pClientIP WHERE mid=pAccountID;

--


INSERT INTO game_log (mid,strcharid,logindate,logoutdate,nduring,serverid,serverip,clientip,char_id)
VALUES (pAccountID,pstrCharID,pTimeLogin,now(),pDuring,pServerID,pServerIP,pClientIP,pCharID);

DELETE FROM currentuser WHERE mid=pAccountID;

-- Update user_aggregate - dsell@aeriagames.com
--PERFORM age_createorupdate_accountactivity(pAccountID,CURRENT_TIMESTAMP);

return 1;
END IF;

return 1;
END;
$_$;


ALTER FUNCTION public.account_logoutx(character varying, character varying, character varying, character varying, integer) OWNER TO postgres;

--
-- Name: age_create_gfaccount(character varying, integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.age_create_gfaccount(p_name character varying, p_uid integer, p_passwd character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN                                      

    INSERT INTO tb_user (mid, pwd, idnum, byauthority, regdate) VALUES
(lower(p_name), p_passwd, p_uid, 0, now());
    RETURN 0;

END; 
$$;


ALTER FUNCTION public.age_create_gfaccount(p_name character varying, p_uid integer, p_passwd character varying) OWNER TO postgres;

--
-- Name: age_createorupdate_accountactivity(character varying, timestamp with time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.age_createorupdate_accountactivity(p_name character varying, p_logtime timestamp with time zone) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE 
  v_uid INT;
  v_count INT;
BEGIN
  SELECT INTO v_uid idnum FROM tb_user WHERE mid = p_name;
  
  IF NOT FOUND THEN
    return 0;
  END IF;
  
  SELECT INTO v_count COUNT(*) FROM age_user_aggregate WHERE uid = v_uid;
  IF v_count = 0 THEN
    INSERT INTO age_user_aggregate (uid, first_activity, last_activity) VALUES (v_uid, p_logtime, p_logtime);
  ELSE
    UPDATE age_user_aggregate SET last_activity = p_logtime WHERE uid = v_uid AND p_logtime > last_activity;
  END IF;
  
  return 0;
END;
$$;


ALTER FUNCTION public.age_createorupdate_accountactivity(p_name character varying, p_logtime timestamp with time zone) OWNER TO postgres;

--
-- Name: age_createorupdate_gfaccount(character varying, integer, character varying, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.age_createorupdate_gfaccount(p_name character varying, p_uid integer, p_passwd character varying, p_updatetime timestamp without time zone) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE 
    v_curuid INT;
    v_curPasswd VARCHAR(32);
    v_curUpdateTime timestamp; 

BEGIN

    v_curuid := -1;

    SELECT INTO v_curuid, v_curPasswd, v_curUpdateTime idnum, pwd, updatetime
FROM tb_user WHERE idnum = p_uid;

    IF (v_curuid = -1 OR v_curuid IS NULL) THEN
        -- create the user
        RETURN age_Create_GFAccount (p_name, p_uid, p_passwd);
    END IF;

    IF (v_curuid IS NOT NULL AND v_curPasswd <> p_passwd AND v_curUpdateTime <
p_updateTime) THEN
        -- update the user
        RETURN age_Update_GFAccount (p_uid, p_passwd, p_updateTime);
    END IF;
    
    RETURN 0;
END;
$$;


ALTER FUNCTION public.age_createorupdate_gfaccount(p_name character varying, p_uid integer, p_passwd character varying, p_updatetime timestamp without time zone) OWNER TO postgres;

--
-- Name: age_fantasiaiteminsertable(integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.age_fantasiaiteminsertable(p_uid integer, p_name character varying, p_count integer, OUT result integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  account_name varchar(16);
  
BEGIN
  SELECT INTO account_name mid FROM tb_user WHERE mid = p_name;
  IF (account_name is null) THEN
   	Result := p_count - 1;
  ELSE
    result := p_count + 1;
  END IF;
END;
$$;


ALTER FUNCTION public.age_fantasiaiteminsertable(p_uid integer, p_name character varying, p_count integer, OUT result integer) OWNER TO postgres;

--
-- Name: age_insertedeneternalitem(integer, character varying, integer, integer, integer, integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.age_insertedeneternalitem(p_uid integer, p_name character varying, p_itemid integer, p_count integer, p_point integer, p_type integer, p_txn character varying, OUT result integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$

DECLARE 
  v_numTxn INT;
  return_value INT;

BEGIN
  Result := 1;
  v_numTxn := 0;
  
  SELECT INTO v_numTxn COUNT(1) FROM public.age_ItemInsert_TxnLog WHERE uid=p_uid AND txnID=p_txn;

  IF (v_numTxn IS NULL OR v_numTxn <= 0) THEN
    BEGIN
	  SELECT INTO return_value insertmallitem(p_name, p_itemID, p_count, p_point, p_type);
	  	
      IF (return_value = 0) THEN 
	INSERT INTO public.age_ItemInsert_TxnLog (uid, txnID, updateTime) VALUES (p_uid, p_txn, now());
      End IF;

      Result := return_value;
    END;

  END IF;

END;
$$;


ALTER FUNCTION public.age_insertedeneternalitem(p_uid integer, p_name character varying, p_itemid integer, p_count integer, p_point integer, p_type integer, p_txn character varying, OUT result integer) OWNER TO postgres;

--
-- Name: age_insertitem(integer, character varying, integer, integer, integer, integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.age_insertitem(p_uid integer, p_name character varying, p_itemid integer, p_count integer, p_point integer, p_type integer, p_txn character varying, OUT result integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$

DECLARE 
  v_numTxn INT;
  return_value INT;

BEGIN
  Result := 1;
  v_numTxn := 0;
  
  SELECT INTO v_numTxn COUNT(1) FROM public.age_ItemInsert_TxnLog WHERE uid=p_uid AND txnID=p_txn;

  IF (v_numTxn IS NULL OR v_numTxn <= 0) THEN
    BEGIN
	  SELECT INTO return_value insertmallitem(p_name, p_itemID, p_count, p_point, p_type);
	  	
      IF (return_value = 0) THEN 
        INSERT INTO public.age_ItemInsert_TxnLog (uid, txnID, updateTime) VALUES (p_uid, p_txn, now());
      END IF;
      
      Result := return_value;
    END;

  END IF;

END;
$$;


ALTER FUNCTION public.age_insertitem(p_uid integer, p_name character varying, p_itemid integer, p_count integer, p_point integer, p_type integer, p_txn character varying, OUT result integer) OWNER TO postgres;

--
-- Name: age_iteminsertable(character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.age_iteminsertable(p_name character varying, p_count integer, OUT result integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  account_name varchar(16);
  
BEGIN
  SELECT INTO account_name mid FROM tb_user WHERE mid = p_name;
  IF (account_name is null) THEN
   	Result := p_count - 1;
  ELSE
    result := p_count + 1;
  END IF;
END;
$$;


ALTER FUNCTION public.age_iteminsertable(p_name character varying, p_count integer, OUT result integer) OWNER TO postgres;

--
-- Name: age_update_gfaccount(integer, character varying, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.age_update_gfaccount(p_uid integer, p_passwd character varying, p_updatetime timestamp without time zone) RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN      

    UPDATE tb_user SET pwd = TRIM(p_passwd), updatetime = p_updateTime WHERE
idnum = p_uid AND updatetime < p_updateTime;
    RETURN 0;

END; 
$$;


ALTER FUNCTION public.age_update_gfaccount(p_uid integer, p_passwd character varying, p_updatetime timestamp without time zone) OWNER TO postgres;

--
-- Name: char_login(character varying, integer, character varying, character varying, integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.char_login(character varying, integer, character varying, character varying, integer, character varying) RETURNS smallint
    LANGUAGE plpgsql
    AS $_$DECLARE
ppAccountID ALIAS FOR $1;
nWorldID ALIAS FOR $2;
pServerIP  ALIAS FOR $3;
pClientIP  ALIAS FOR $4;
nCharID ALIAS FOR $5;
pCharName  ALIAS FOR $6;
v_uid INT;
pMID char(32);
pExpiredate timestamp;
pAccountID varchar(32);
integer_var integer;

BEGIN
--pAccountID = lower(ppAccountID);
pAccountID = ppAccountID;
DELETE FROM currentuser WHERE mid=pAccountID;
INSERT INTO currentuser (mid,serverid,serverip,clientip,char_id,strcharid) VALUES (pAccountID,nWorldID,pServerIP,pClientIP,nCharID,pCharName);
SELECT INTO pMID,pExpiredate mid,firstlogindate FROM tb_user WHERE mid=pAccountID;
GET DIAGNOSTICS integer_var = ROW_COUNT;

IF(integer_var > 0) THEN
        UPDATE tb_user SET Status=1, lastlogindate=now() Where mid=pAccountID;
        return 0;
ELSE
        SELECT INTO v_uid id FROM id_actname WHERE username = pAccountID;
        INSERT INTO tb_user (mid, idnum,firstlogindate, lastlogindate,clientip) VALUES (pAccountID,v_uid,now(),now(),pClientIP);
        return 0;
END IF;   
END;



$_$;


ALTER FUNCTION public.char_login(character varying, integer, character varying, character varying, integer, character varying) OWNER TO postgres;

--
-- Name: char_login_v4(character varying, integer, character varying, character varying, integer, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.char_login_v4(character varying, integer, character varying, character varying, integer, character varying, character varying, integer) RETURNS record
    LANGUAGE plpgsql
    AS $_$DECLARE
ppAccountID ALIAS FOR $1;
nWorldID ALIAS FOR $2;
pServerIP  ALIAS FOR $3;
pClientIP  ALIAS FOR $4;
nCharID ALIAS FOR $5;
pCharName  ALIAS FOR $6;
pMacAddress ALIAS FOR $7;
pGold ALIAS FOR $8;
nBuffer record; --  (positive buffID ,Negative buffID);
v_uid INT;
pMID char(50);
pFirstLoginDate timestamp;
pAccountID varchar(50);
pidnum integer;
integer_var integer;
check_netcaffee integer;

BEGIN
--pAccountID = lower(ppAccountID);
pAccountID = ppAccountID;
DELETE FROM currentuser WHERE mid=pAccountID;
INSERT INTO currentuser (mid,serverid,serverip,clientip,char_id,strcharid,mac_address,gold) VALUES (pAccountID,nWorldID,pServerIP,pClientIP,nCharID,pCharName,pMacAddress,pGold);
SELECT INTO pMID,pFirstLoginDate,pidnum mid,firstlogindate,idnum FROM tb_user WHERE mid=pAccountID;
GET DIAGNOSTICS integer_var = ROW_COUNT;
IF(integer_var > 0) THEN
        IF pFirstLoginDate is null THEN
                UPDATE tb_user SET firstlogindate=now(),clientip=pClientIP,char_id=nCharID Where mid=pAccountID;
        END IF;
        UPDATE tb_user SET Status=1,lastlogindate=now(),char_id=nCharID Where mid=pAccountID;
ELSE
        SELECT INTO v_uid id FROM id_actname WHERE username = pAccountID;
        INSERT INTO tb_user (mid,idnum,firstlogindate,lastlogindate,clientip,char_id,sel_chk) VALUES (pAccountID,v_uid,now(),now(),pClientIP,nCharID,1);
END IF;

--check netcafee
--SELECT COUNT(clientip) INTO check_netcaffee FROM netcaffee_ip WHERE clientip=pClientIP;
--IF(check_netcaffee > 0) THEN
--        nBuffer := (0,0);
--ELSE
--        nBuffer := (-1,0);
--END IF;

nBuffer := (-1,0);
return nBuffer;

END;

$_$;


ALTER FUNCTION public.char_login_v4(character varying, integer, character varying, character varying, integer, character varying, character varying, integer) OWNER TO postgres;

--
-- Name: char_logout(character varying, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.char_logout(character varying, integer, integer) RETURNS smallint
    LANGUAGE plpgsql
    AS $_$DECLARE
ppAccountID ALIAS FOR $1;
nNodeID ALIAS FOR $2;
nLevel ALIAS FOR $3;

-- update billing data when logout
pAccountID varchar(32);

pTimeLogin timestamp;
pDuring integer;
pServerID int2;
pServerIP varchar(15);
pClientIP varchar(15);
pstrCharID varchar(32);
pCharID integer;


integer_var integer;
BEGIN
pAccountID = ppAccountID;
SELECT INTO pTimeLogin,  pServerID, pServerIP,pClientIP,pstrCharID,pCharID  logindate, serverid, serverip,clientip,strcharid,char_id FROM currentuser WHERE mid=pAccountID;
GET DIAGNOSTICS integer_var = ROW_COUNT;
RAISE NOTICE 'Variable an_integer was changed. %  and  % and %' ,pAccountID,pServerID, pClientIP;
IF(integer_var > 0) THEN


pDuring = CAST(EXTRACT(EPOCH FROM now()) - EXTRACT(EPOCH FROM pTimeLogin) as int4) / 60;

UPDATE tb_user SET status=0,clientip=pClientIP WHERE mid=pAccountID;

-- 
INSERT INTO game_log (mid,strcharid,logindate,logoutdate,nduring,serverid,serverip,clientip,char_id,node_id,char_level)
VALUES (pAccountID,pstrCharID,pTimeLogin,now(),pDuring,pServerID,pServerIP,pClientIP,pCharID,nNodeID,nLevel);

--INSERT INTO game_log (mid,strcharid,logindate,logoutdate,nduring,serverid,serverip,clientip)
--VALUES (pAccountID,pstrCharID,pTimeLogin,now(),pDuring,pServerID,pServerIP,pClientIP);

DELETE FROM currentuser WHERE mid=pAccountID;

return 1;

END IF;

return 1;
END;

$_$;


ALTER FUNCTION public.char_logout(character varying, integer, integer) OWNER TO postgres;

--
-- Name: char_logout_v4(character varying, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.char_logout_v4(character varying, integer, integer, integer) RETURNS smallint
    LANGUAGE plpgsql
    AS $_$DECLARE
pAccountID ALIAS FOR $1;
nNodeID ALIAS FOR $2;
nLevel ALIAS FOR $3;
nOutGold ALIAS FOR $4;


-- update billing data when logout

pTimeLogin timestamp with time zone;
pDuring integer;
pServerID int2;
pServerIP varchar(15);
pClientIP varchar(15);
pstrCharID text;
pCharID integer;
pgold integer;
pDifference integer;
integer_var integer;

BEGIN
SELECT INTO pTimeLogin,  pServerID, pServerIP,pClientIP,pstrCharID,pCharID,pgold  logindate, serverid, serverip,clientip,strcharid,char_id,gold FROM currentuser WHERE mid=pAccountID;
GET DIAGNOSTICS integer_var = ROW_COUNT;
--RAISE NOTICE 'Variable an_integer was changed. %  and  % and %' ,pAccountID,pServerID, pClientIP;
pDifference=nOutGold-pgold;
IF(integer_var > 0) THEN
   pDuring = CAST(EXTRACT(EPOCH FROM now()) - EXTRACT(EPOCH FROM pTimeLogin) as int4) / 60;
   --pDuring = EXTRACT(epoch FROM age(now(),pTimeLogin))::int/60;
   UPDATE tb_user SET status=0,clientip=pClientIP WHERE mid=pAccountID;
   --
   INSERT INTO game_log (mid,strcharid,logindate,logoutdate,nduring,serverid,serverip,clientip,char_id,node_id,char_level,gold,gold_diff)
      VALUES (pAccountID,pstrCharID,pTimeLogin,now(),pDuring,pServerID,pServerIP,pClientIP,pCharID,nNodeID,nLevel,nOutGold,pDifference);
   --
   DELETE FROM currentuser WHERE mid=pAccountID;
   return 1;
END IF;

return 1;
END;

$_$;


ALTER FUNCTION public.char_logout_v4(character varying, integer, integer, integer) OWNER TO postgres;

--
-- Name: compensation_error_item(character varying, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.compensation_error_item(character varying, integer, integer, integer) RETURNS smallint
    LANGUAGE plpgsql
    AS $_$

DECLARE
raccount_name ALIAS FOR $1;
ritem_id ALIAS FOR $2;
ritem_quantity ALIAS FOR $3;
ritem_totalpoint ALIAS FOR $4;
account_name_check varchar(32);
receivable_totalpoint int;
webitemmall_totalpoint int;
mail_name_message varchar(32);

BEGIN

--SELECT INTO account_name_check mid FROM tb_user WHERE mid = raccount_name;
-- RAISE NOTICE 'The ritem_id = % \n', ritem_id;
-- GET DIAGNOSTICS item_exist = ROW_COUNT;
--IF (account_name_check is null) THEN
--   RETURN -1;
--END IF;

IF (ritem_id < 0) THEN
   RETURN -2;
END IF;

IF (ritem_quantity < 1) THEN
   RETURN -3;
END IF;

IF (ritem_totalpoint < 0) THEN
   RETURN -4;
END IF;

receivable_totalpoint := (-1) * ritem_totalpoint;
webitemmall_totalpoint := ritem_totalpoint;
mail_name_message := 'compensation_error_item';

PERFORM dblink_connect_u('dbname=FFAccount');
PERFORM dblink_exec('INSERT INTO item_receivable (account_name, item_id, item_quantity, point, mail_name) VALUES ('''|| raccount_name ||''','|| ritem_id ||','|| ritem_quantity ||','|| receivable_totalpoint ||','''|| mail_name_message ||''');');
PERFORM dblink_disconnect();
INSERT INTO web_itemmall_log (straccountid, serverno, itemid, itemcount, buytotal) VALUES (raccount_name, 999, ritem_id, ritem_quantity, webitemmall_totalpoint);

RETURN 0;

END;

$_$;


ALTER FUNCTION public.compensation_error_item(character varying, integer, integer, integer) OWNER TO postgres;

--
-- Name: datediff(character varying, date, date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.datediff(p_interval character varying, p_datefrom date, p_dateto date) RETURNS integer
    LANGUAGE plpgsql
    AS $$




BEGIN
if p_Interval = 'm' then
return ((date_part('y',p_DateTo) * 12) + date_part('month',p_DateTo))
- ((date_part('y',p_DateFrom) * 12) + date_part('month',p_DateFrom));
elseif p_Interval = 'y' then
return date_part('y',p_DateTo) - date_part('y',p_DateFrom);
else
raise exception 'Datediff: Interval not supported';
return 0;
end if;
END;
$$;


ALTER FUNCTION public.datediff(p_interval character varying, p_datefrom date, p_dateto date) OWNER TO postgres;

--
-- Name: dblink(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink(text) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_record';


ALTER FUNCTION public.dblink(text) OWNER TO postgres;

--
-- Name: dblink(text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink(text, boolean) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_record';


ALTER FUNCTION public.dblink(text, boolean) OWNER TO postgres;

--
-- Name: dblink(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink(text, text) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_record';


ALTER FUNCTION public.dblink(text, text) OWNER TO postgres;

--
-- Name: dblink(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink(text, text, boolean) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_record';


ALTER FUNCTION public.dblink(text, text, boolean) OWNER TO postgres;

--
-- Name: dblink_build_sql_delete(text, int2vector, integer, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_build_sql_delete(text, int2vector, integer, text[]) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_build_sql_delete';


ALTER FUNCTION public.dblink_build_sql_delete(text, int2vector, integer, text[]) OWNER TO postgres;

--
-- Name: dblink_build_sql_insert(text, int2vector, integer, text[], text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_build_sql_insert(text, int2vector, integer, text[], text[]) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_build_sql_insert';


ALTER FUNCTION public.dblink_build_sql_insert(text, int2vector, integer, text[], text[]) OWNER TO postgres;

--
-- Name: dblink_build_sql_update(text, int2vector, integer, text[], text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_build_sql_update(text, int2vector, integer, text[], text[]) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_build_sql_update';


ALTER FUNCTION public.dblink_build_sql_update(text, int2vector, integer, text[], text[]) OWNER TO postgres;

--
-- Name: dblink_cancel_query(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_cancel_query(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_cancel_query';


ALTER FUNCTION public.dblink_cancel_query(text) OWNER TO postgres;

--
-- Name: dblink_close(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_close(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_close';


ALTER FUNCTION public.dblink_close(text) OWNER TO postgres;

--
-- Name: dblink_close(text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_close(text, boolean) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_close';


ALTER FUNCTION public.dblink_close(text, boolean) OWNER TO postgres;

--
-- Name: dblink_close(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_close(text, text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_close';


ALTER FUNCTION public.dblink_close(text, text) OWNER TO postgres;

--
-- Name: dblink_close(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_close(text, text, boolean) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_close';


ALTER FUNCTION public.dblink_close(text, text, boolean) OWNER TO postgres;

--
-- Name: dblink_connect(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_connect(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_connect';


ALTER FUNCTION public.dblink_connect(text) OWNER TO postgres;

--
-- Name: dblink_connect(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_connect(text, text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_connect';


ALTER FUNCTION public.dblink_connect(text, text) OWNER TO postgres;

--
-- Name: dblink_connect_u(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_connect_u(text) RETURNS text
    LANGUAGE c STRICT SECURITY DEFINER
    AS '$libdir/dblink', 'dblink_connect';


ALTER FUNCTION public.dblink_connect_u(text) OWNER TO postgres;

--
-- Name: dblink_connect_u(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_connect_u(text, text) RETURNS text
    LANGUAGE c STRICT SECURITY DEFINER
    AS '$libdir/dblink', 'dblink_connect';


ALTER FUNCTION public.dblink_connect_u(text, text) OWNER TO postgres;

--
-- Name: dblink_current_query(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_current_query() RETURNS text
    LANGUAGE c
    AS '$libdir/dblink', 'dblink_current_query';


ALTER FUNCTION public.dblink_current_query() OWNER TO postgres;

--
-- Name: dblink_disconnect(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_disconnect() RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_disconnect';


ALTER FUNCTION public.dblink_disconnect() OWNER TO postgres;

--
-- Name: dblink_disconnect(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_disconnect(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_disconnect';


ALTER FUNCTION public.dblink_disconnect(text) OWNER TO postgres;

--
-- Name: dblink_error_message(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_error_message(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_error_message';


ALTER FUNCTION public.dblink_error_message(text) OWNER TO postgres;

--
-- Name: dblink_exec(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_exec(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_exec';


ALTER FUNCTION public.dblink_exec(text) OWNER TO postgres;

--
-- Name: dblink_exec(text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_exec(text, boolean) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_exec';


ALTER FUNCTION public.dblink_exec(text, boolean) OWNER TO postgres;

--
-- Name: dblink_exec(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_exec(text, text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_exec';


ALTER FUNCTION public.dblink_exec(text, text) OWNER TO postgres;

--
-- Name: dblink_exec(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_exec(text, text, boolean) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_exec';


ALTER FUNCTION public.dblink_exec(text, text, boolean) OWNER TO postgres;

--
-- Name: dblink_fetch(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_fetch(text, integer) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_fetch';


ALTER FUNCTION public.dblink_fetch(text, integer) OWNER TO postgres;

--
-- Name: dblink_fetch(text, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_fetch(text, integer, boolean) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_fetch';


ALTER FUNCTION public.dblink_fetch(text, integer, boolean) OWNER TO postgres;

--
-- Name: dblink_fetch(text, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_fetch(text, text, integer) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_fetch';


ALTER FUNCTION public.dblink_fetch(text, text, integer) OWNER TO postgres;

--
-- Name: dblink_fetch(text, text, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_fetch(text, text, integer, boolean) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_fetch';


ALTER FUNCTION public.dblink_fetch(text, text, integer, boolean) OWNER TO postgres;

--
-- Name: dblink_get_connections(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_get_connections() RETURNS text[]
    LANGUAGE c
    AS '$libdir/dblink', 'dblink_get_connections';


ALTER FUNCTION public.dblink_get_connections() OWNER TO postgres;

--
-- Name: dblink_get_pkey(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_get_pkey(text) RETURNS SETOF public.dblink_pkey_results
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_get_pkey';


ALTER FUNCTION public.dblink_get_pkey(text) OWNER TO postgres;

--
-- Name: dblink_get_result(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_get_result(text) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_get_result';


ALTER FUNCTION public.dblink_get_result(text) OWNER TO postgres;

--
-- Name: dblink_get_result(text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_get_result(text, boolean) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_get_result';


ALTER FUNCTION public.dblink_get_result(text, boolean) OWNER TO postgres;

--
-- Name: dblink_is_busy(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_is_busy(text) RETURNS integer
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_is_busy';


ALTER FUNCTION public.dblink_is_busy(text) OWNER TO postgres;

--
-- Name: dblink_open(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_open(text, text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_open';


ALTER FUNCTION public.dblink_open(text, text) OWNER TO postgres;

--
-- Name: dblink_open(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_open(text, text, boolean) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_open';


ALTER FUNCTION public.dblink_open(text, text, boolean) OWNER TO postgres;

--
-- Name: dblink_open(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_open(text, text, text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_open';


ALTER FUNCTION public.dblink_open(text, text, text) OWNER TO postgres;

--
-- Name: dblink_open(text, text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_open(text, text, text, boolean) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_open';


ALTER FUNCTION public.dblink_open(text, text, text, boolean) OWNER TO postgres;

--
-- Name: dblink_send_query(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_send_query(text, text) RETURNS integer
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_send_query';


ALTER FUNCTION public.dblink_send_query(text, text) OWNER TO postgres;

--
-- Name: game_login(character varying, integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.game_login(character varying, integer, character varying) RETURNS smallint
    LANGUAGE plpgsql
    AS $_$DECLARE
ppAccountID ALIAS FOR $1;
pServerID ALIAS FOR $2;
pServerIP ALIAS FOR $3;
pAccountID varchar(20);

pPValue int2;
pExpireDate timestamp;
pBillingRule int2;
pFree bit;
pDeduction int2;
pAddTime int2;
pTimeFormat char(2);
pMID char(20);
integer_var integer;
BEGIN
pAccountID = lower(ppAccountID);

DELETE FROM currentuser WHERE mid=pAccountID;

SELECT INTO pMID,pExpireDate mid,expiredate FROM tb_user WHERE mid=pAccountID;
GET DIAGNOSTICS integer_var = ROW_COUNT;

IF(integer_var > 0) THEN
INSERT INTO currentuser (mid,billingrule,serverid,serverip) VALUES (pAccountID,1,pServerID,pServerIP);
UPDATE tb_user SET Status=1, lastlogindate=now() Where mid=pAccountID;
   IF pExpireDate is null then 
          UPDATE tb_user SET expiredate=now() Where mid=pAccountID;
   END IF; 
-- Update user_aggregate - dsell@aeriagames.com
PERFORM age_createorupdate_accountactivity(pAccountID,CURRENT_TIMESTAMP);
return 1;   --ok
ELSE
return 4;
END IF;
END;
$_$;


ALTER FUNCTION public.game_login(character varying, integer, character varying) OWNER TO postgres;

--
-- Name: get_point_info(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_point_info(character varying) RETURNS record
    LANGUAGE plpgsql
    AS $_$DECLARE
ppAccountID ALIAS FOR $1;
pAccountID varchar(20);
nPValues int;
nBonus int;
integer_var int;
nPoints record; --(nPValues,nBonus);
BEGIN
pAccountID = lower(ppAccountID);

SELECT INTO nPValues,nBonus pvalues,bonus FROM tb_user WHERE mid=pAccountID;
GET DIAGNOSTICS integer_var = ROW_COUNT;

IF(integer_var > 0) THEN
nPoints :=(nPValues,nBonus);
return nPoints;   --ok
ELSE
nPoints :=(0,0);
return nPoints; --false There is no Account.
END IF;
END;$_$;


ALTER FUNCTION public.get_point_info(character varying) OWNER TO postgres;

--
-- Name: insertmallitem(character varying, integer, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.insertmallitem(character varying, integer, integer, integer, integer) RETURNS smallint
    LANGUAGE plpgsql
    AS $_$

DECLARE
raccount_name ALIAS FOR $1;
ritem_id ALIAS FOR $2;
ritem_quantity ALIAS FOR $3;
ritem_totalpoint ALIAS FOR $4;
ritem_sendmethod ALIAS FOR $5;
account_name_check varchar(32);
receivable_totalpoint int;
webitemmall_totalpoint int;

BEGIN

--SELECT INTO account_name_check mid FROM tb_user WHERE mid = raccount_name;
-- RAISE NOTICE 'The ritem_id = % \n', ritem_id;
-- GET DIAGNOSTICS item_exist = ROW_COUNT;
--IF (account_name_check is null) THEN
--   RETURN -1;
--END IF;

IF (ritem_id < 0) THEN
   RETURN -2;
END IF;

IF (ritem_quantity < 1) THEN
   RETURN -3;
END IF;

IF (ritem_totalpoint < 0) THEN
   RETURN -4;
END IF;

IF (ritem_sendmethod = 1) THEN
        receivable_totalpoint := (-1) * ritem_totalpoint;
        webitemmall_totalpoint := ritem_totalpoint;
ELSIF (ritem_sendmethod = 2) THEN
        receivable_totalpoint := 0;
        webitemmall_totalpoint := 0;
ELSE
   RETURN -5;
END IF;

PERFORM dblink_connect_u('dbname=FFAccount');
PERFORM dblink_exec('INSERT INTO item_receivable (account_name, item_id, item_quantity, point) VALUES ('''|| raccount_name ||''','|| ritem_id ||','|| ritem_quantity ||','|| receivable_totalpoint ||');');
PERFORM dblink_disconnect();
INSERT INTO web_itemmall_log (straccountid, serverno, itemid, itemcount, buytotal) VALUES (raccount_name, 99, ritem_id, ritem_quantity, webitemmall_totalpoint);

RETURN 0;

END;

$_$;


ALTER FUNCTION public.insertmallitem(character varying, integer, integer, integer, integer) OWNER TO postgres;

--
-- Name: insertmallitem(character varying, integer, integer, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.insertmallitem(character varying, integer, integer, integer, integer, integer) RETURNS smallint
    LANGUAGE plpgsql
    AS $_$

DECLARE
raccount_name ALIAS FOR $1;
ritem_id ALIAS FOR $2;
ritem_quantity ALIAS FOR $3;
ritem_totalpoint ALIAS FOR $4;
ritem_sendmethod ALIAS FOR $5;
ritem_buytype ALIAS FOR $6;
account_name_check varchar(32);
receivable_totalpoint int;
webitemmall_totalpoint int;
buy_type int;

BEGIN

--SELECT INTO account_name_check mid FROM tb_user WHERE mid = raccount_name;
-- RAISE NOTICE 'The ritem_id = % \n', ritem_id;
-- GET DIAGNOSTICS item_exist = ROW_COUNT;
--IF (account_name_check is null) THEN
--   RETURN -1;
--END IF;

IF (ritem_id < 0) THEN
   RETURN -2;
END IF;

IF (ritem_quantity < 1) THEN
   RETURN -3;
END IF;

IF (ritem_totalpoint < 0) THEN
   RETURN -4;
END IF;

IF (ritem_sendmethod = 1) THEN
        receivable_totalpoint := (-1) * ritem_totalpoint;
        webitemmall_totalpoint := ritem_totalpoint;
ELSIF (ritem_sendmethod = 2) THEN
        receivable_totalpoint := 0;
        webitemmall_totalpoint := 0;
ELSE
   RETURN -5;
END IF;

IF (ritem_buytype = 1) THEN
	buy_type := 1;
ELSIF (ritem_buytype = 2) THEN
	buy_type := 2;
        receivable_totalpoint := 0;
        webitemmall_totalpoint := ritem_totalpoint;
ELSE
	RETURN -6;
END IF;

PERFORM dblink_connect_u('dbname=FFAccount');
PERFORM dblink_exec('INSERT INTO item_receivable (account_name, item_id, item_quantity, point) VALUES ('''|| raccount_name ||''','|| ritem_id ||','|| ritem_quantity ||','|| receivable_totalpoint ||');');
PERFORM dblink_disconnect();
INSERT INTO web_itemmall_log (straccountid, serverno, itemid, itemcount, buytotal, buytype) VALUES (raccount_name, 99, ritem_id, ritem_quantity, webitemmall_totalpoint, buy_type);

RETURN 0;

END;

$_$;


ALTER FUNCTION public.insertmallitem(character varying, integer, integer, integer, integer, integer) OWNER TO postgres;

--
-- Name: oauth2_update(character varying, character varying, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.oauth2_update(character varying, character varying, integer, character varying, integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
declare
a_key ALIAS FOR $1;
r_key ALIAS FOR $2;
ppuid  ALIAS FOR $3;
ppmid  ALIAS FOR $4;
ptype  ALIAS FOR $5;

pMID character varying(50);
ot_pw character varying(36);
pcount integer;
pBAuthority integer;
pGMIP varchar(15) default null;
myrec RECORD;
use_sql TEXT;
BEGIN

pMID = lower(ppmid);

IF ( ppuid = 0 ) THEN
        RETURN 'ERR1';
END IF;

--SELECT INTO pcount count(mid) FROM "tb_user" WHERE mid=pMID;
--IF pcount =0 THEN --This Account is not exist
SELECT INTO pcount,pBAuthority count(mid),byauthority FROM "tb_user" WHERE mid=pMID group by mid, byauthority;
IF pcount is null THEN --This Account is not exist

INSERT INTO tb_user (mid, pwd, idnum, byauthority, regdate ) VALUES (pMID, '', ppuid, 0, now());

END IF;

IF pBAuthority = 255 THEN --This Account was locked
	RETURN 5;
END IF;

IF pBAuthority = 1 THEN --gmAccount  Check ip (0-->User, 1-->GM, 255-->Locked)
	SELECT INTO pGMIP ip FROM gmip WHERE ip=pClientIP;
	IF pGMIP IS NULL THEN
		RETURN 4;
	END IF;
END IF;

use_sql ='select username FROM oauth2_mapping WHERE uid=' || ppuid;
for myrec IN EXECUTE use_sql LOOP

IF ( myrec.username = pMID  ) THEN


     --    ot_pw=cast( CAST(md5(current_database()|| user ||current_timestamp ||random()) as uuid) as character varying(36) );
         update oauth2_mapping set access_token=a_key,refresh_token=r_key,pwd_ot=ot_pw,updatetime=now() where uid=ppuid;
     --    if (ptype =1) then
     --    UPDATE "tb_user" set pwd_ot=ot_pw,pwd_ot_expire=now()+cast('2 minute ' as interval) WHERE mid=pMID;
     --    end if;
RETURN 101;
--RETURN 13;
END IF;
END LOOP;

IF myrec IS NULL THEN
       -- ot_pw=cast( CAST(md5(current_database()|| user ||current_timestamp ||random()) as uuid) as character varying(36) );
        INSERT INTO oauth2_mapping (uid,username,access_token,refresh_token,pwd_ot,updatetime) VALUES (ppuid,pMID,a_key,r_key,ot_pw,now());
     --   UPDATE "tb_user" set pwd_ot=ot_pw,pwd_ot_expire=now()+cast('2 minute ' as interval) WHERE mid=pMID;
        RETURN 101;
END IF;

RETURN 13;

END;$_$;


ALTER FUNCTION public.oauth2_update(character varying, character varying, integer, character varying, integer) OWNER TO postgres;

--
-- Name: oauth2_update(character varying, character varying, integer, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.oauth2_update(character varying, character varying, integer, character varying, character varying, integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
declare
a_key ALIAS FOR $1;
r_key ALIAS FOR $2;
ppuid ALIAS FOR $3;
ppmid ALIAS FOR $4;
pClientIP ALIAS FOR $5;
ptype ALIAS FOR $6;

pMID character varying(50);
ot_pw character varying(36);
pcount integer;
pBAuthority integer;
pGMIP varchar(15) default null;
myrec RECORD;
use_sql TEXT;
BEGIN

pMID = lower(ppmid);

IF ( ppuid = 0 ) THEN
        RETURN 'ERR1';
END IF;

--SELECT INTO pcount count(mid) FROM "tb_user" WHERE mid=pMID;
--IF pcount =0 THEN --This Account is not exist
SELECT INTO pcount,pBAuthority count(mid),byauthority FROM "tb_user" WHERE mid=pMID group by mid, byauthority;
IF pcount is null THEN --This Account is not exist

INSERT INTO tb_user (mid, pwd, idnum, byauthority, regdate ) VALUES (pMID, '', ppuid, 0, now());

END IF;

IF pBAuthority = 255 THEN --This Account was locked
        RETURN 5;
ELSIF pBAuthority = 1 THEN --gmAccount  Check ip (0-->User, 1-->GM, 255-->Locked)
	SELECT INTO pGMIP ip FROM gmip WHERE ip=pClientIP;
	IF pGMIP IS NULL THEN
		RETURN 4;
	END IF;
END IF;

--IF pBAuthority = 1 THEN --gmAccount  Check ip (0-->User, 1-->GM, 255-->Locked)
--        SELECT INTO pGMIP ip FROM gmip WHERE ip=pClientIP;
--        IF pGMIP IS NULL THEN
--                RETURN 4;
--        END IF;
--END IF;

use_sql ='select username FROM oauth2_mapping WHERE uid=' || ppuid;
for myrec IN EXECUTE use_sql LOOP

IF ( myrec.username = pMID  ) THEN


     --    ot_pw=cast( CAST(md5(current_database()|| user ||current_timestamp ||random()) as uuid) as character varying(36) );
         update oauth2_mapping set access_token=a_key,refresh_token=r_key,pwd_ot=ot_pw,updatetime=now(),clientip=pClientIP where uid=ppuid;
     --    if (ptype =1) then
     --    UPDATE "tb_user" set pwd_ot=ot_pw,pwd_ot_expire=now()+cast('2 minute ' as interval) WHERE mid=pMID;
     --    end if;
RETURN 101;
--RETURN 13;
END IF;
END LOOP;

IF myrec IS NULL THEN
       -- ot_pw=cast( CAST(md5(current_database()|| user ||current_timestamp ||random()) as uuid) as character varying(36) );
        INSERT INTO oauth2_mapping (uid,username,access_token,refresh_token,pwd_ot,updatetime,clientip) VALUES (ppuid,pMID,a_key,r_key,ot_pw,now(),pClientIP);
     --   UPDATE "tb_user" set pwd_ot=ot_pw,pwd_ot_expire=now()+cast('2 minute ' as interval) WHERE mid=pMID;
        RETURN 101;
END IF;

RETURN 13;

END;$_$;


ALTER FUNCTION public.oauth2_update(character varying, character varying, integer, character varying, character varying, integer) OWNER TO postgres;

--
-- Name: player_characters_select(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.player_characters_select(OUT serverid integer, OUT id integer, OUT account_id integer, OUT account_name text, OUT given_name text, OUT level integer, OUT privilege integer, OUT last_saving_time integer, OUT create_time timestamp without time zone, OUT quit integer, OUT node_id integer, OUT class_id integer, OUT family_id integer, OUT appellation integer, OUT login_time_limit timestamp without time zone, OUT channel_limit integer, OUT gold integer) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$

DECLARE
        SERVERINFO record;
        dblink_string TEXT;
BEGIN
--SELECT INTO vdbip,vdbname,vdbuser,vdbpasswd dbip,dbname,dbuser,dbpasswd FROM gameserver WHERE dbid=SERVERID and flag=1;
FOR SERVERINFO IN SELECT dbid,dbip,dbname,dbuser,dbpasswd FROM gameserver WHERE flag=1
LOOP
dblink_string := 'host=' || SERVERINFO.dbip || ' user=' || SERVERINFO.dbuser || ' password=' ||SERVERINFO.dbpasswd || ' dbname=' || SERVERINFO.dbname;
--raise notice 'vdbpasswd is: %', dblink_string;
RETURN QUERY  SELECT SERVERINFO.dbid,*
   FROM dblink(dblink_string::text, 'select id,account_id,account_name, given_name, level,privilege,last_saving_time,create_time,quit,node_id,class_id,family_id,appellation,login_time_limit,channel_limit,gold from player_characters'::text)
   t1(id integer, account_id integer, account_name text, given_name text, level integer, privilege integer, last_saving_time integer,create_time timestamp without time zone,quit integer,node_id integer,class_id integer,family_id integer,appellation integer,login_time_limit timestamp without time zone,channel_limit integer,gold int);
END LOOP;
END
$$;


ALTER FUNCTION public.player_characters_select(OUT serverid integer, OUT id integer, OUT account_id integer, OUT account_name text, OUT given_name text, OUT level integer, OUT privilege integer, OUT last_saving_time integer, OUT create_time timestamp without time zone, OUT quit integer, OUT node_id integer, OUT class_id integer, OUT family_id integer, OUT appellation integer, OUT login_time_limit timestamp without time zone, OUT channel_limit integer, OUT gold integer) OWNER TO postgres;

--
-- Name: req_buy_item(character varying, character varying, integer, character varying, integer, character varying, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.req_buy_item(character varying, character varying, integer, character varying, integer, character varying, integer, integer) RETURNS record
    LANGUAGE plpgsql
    AS $_$DECLARE
ppAccountID ALIAS FOR $1;
pServerIP ALIAS FOR $2;
pItemID ALIAS FOR $3;
pCharName ALIAS FOR $4;
pBuyPoint ALIAS FOR $5;
pClientIP ALIAS FOR $6;
pBuyType ALIAS FOR $7;
pAmount ALIAS FOR $8;
pAccountID varchar(20);
integer_var int;
BonusRate smallint;
nPValues int;
nBonus int;
nPoints record; --(nPValues,nBonus); input values only use two type.

BEGIN
pAccountID = lower(ppAccountID);
BonusRate=5;
SELECT INTO nPValues,nBonus pvalues,bonus FROM tb_user WHERE mid=pAccountID;
GET DIAGNOSTICS integer_var = ROW_COUNT;

IF(integer_var > 0) THEN
--Type 1 model
IF (pBuyType=1 and nPValues >= pBuyPoint) THEN
nBonus=nBonus+floor(pBuyPoint/BonusRate);
nPValues=nPValues-pBuyPoint;
INSERT INTO web_itemmall_log (straccountid,strcharid,serverno,itemid,itemcount,buyprice,clientip,buytype,bonus,buytotal) Values (pAccountID,pCharName,pServerIP,pItemID,pAmount,pBuyPoint,pClientIP,pBuyType,floor(pBuyPoint/BonusRate),pBuyPoint);

update tb_user set pvalues = nPValues, bonus= nBonus where mid=pAccountID;
nPoints :=(nPvalues,nBonus);
return nPoints;   --Type 1 ok
--Type 2 model
ElSEIF (pBuyType=2 and nBonus >= pBuyPoint) THEN
nBonus=nBonus-(pBuyPoint);
INSERT INTO web_itemmall_log (straccountid,strcharid,serverno,itemid,itemcount,buyprice,clientip,buytype,bonus,buytotal) Values (pAccountID,pCharName,pServerIP,pItemID,pAmount,pBuyPoint,pClientIP,pBuyType,0,pBuyPoint);

update tb_user set bonus = nBonus where mid=pAccountID;
nPoints :=(nPvalues,nBonus);
return nPoints;    --Type 2 ok
ELSE
nPValues= -103;
nBonus= -103;
nPoints :=(nPvalues,nBonus);
return nPoints; 
END IF;
END IF;
nPValues= -101;
nBonus= -101;
nPoints :=(nPvalues,nBonus);
return nPoints; 
END;

$_$;


ALTER FUNCTION public.req_buy_item(character varying, character varying, integer, character varying, integer, character varying, integer, integer) OWNER TO postgres;

--
-- Name: req_buy_item(character varying, character varying, integer, character varying, integer, character varying, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.req_buy_item(character varying, character varying, integer, character varying, integer, character varying, integer, integer, integer) RETURNS record
    LANGUAGE plpgsql
    AS $_$DECLARE
ppAccountID ALIAS FOR $1;
pServerIP ALIAS FOR $2;
pItemID ALIAS FOR $3;
pCharName ALIAS FOR $4;
pBuyPoint ALIAS FOR $5;
pClientIP ALIAS FOR $6;
pBuyType ALIAS FOR $7;
pAmount ALIAS FOR $8;
pRemaain_cash ALIAS FOR $9;
pAccountID varchar(20);
integer_var int;
BonusRate smallint;
nPValues int;
nBonus int;
nPoints record; --(nPValues,nBonus); input values only use two type.

BEGIN
pAccountID = lower(ppAccountID);
BonusRate=1;
nBonus=0;
SELECT INTO nPValues,nBonus pvalues,bonus FROM tb_user WHERE mid=pAccountID;
GET DIAGNOSTICS integer_var = ROW_COUNT;

IF(integer_var > 0) THEN
--Type 1 model
IF (pBuyType=1 ) THEN
INSERT INTO web_itemmall_log (straccountid,strcharid,serverno,itemid,itemcount,buyprice,clientip,buytype,bonus,buytotal,remain_point) Values (pAccountID,pCharName,pServerIP,pItemID,pAmount,pBuyPoint,pClientIP,pBuyType,floor(pBuyPoint/BonusRate),pBuyPoint,pRemaain_cash);

nPoints :=(nPvalues,nBonus);
return nPoints;   --Type 1 ok
--Type 2 model
ElSEIF (pBuyType=2 and nBonus >= pBuyPoint) THEN

INSERT INTO web_itemmall_log (straccountid,strcharid,serverno,itemid,itemcount,buyprice,clientip,buytype,bonus,buytotal) Values (pAccountID,pCharName,pServerIP,pItemID,pAmount,pBuyPoint,pClientIP,pBuyType,0,pBuyPoint);
nPoints :=(nPvalues,nBonus);
return nPoints;    --Type 2 ok
ELSE
nPValues= -103;
nBonus= -103;
nPoints :=(nPvalues,nBonus);
return nPoints;
END IF;
END IF;
nPValues= -101;
nBonus= -101;
nPoints :=(nPvalues,nBonus);
return nPoints;
END;

$_$;


ALTER FUNCTION public.req_buy_item(character varying, character varying, integer, character varying, integer, character varying, integer, integer, integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: age_iteminsert_txnlog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.age_iteminsert_txnlog (
    tid integer NOT NULL,
    uid integer NOT NULL,
    txnid character varying(32) NOT NULL,
    updatetime timestamp without time zone NOT NULL
);


ALTER TABLE public.age_iteminsert_txnlog OWNER TO postgres;

--
-- Name: age_iteminsert_txnlog_tid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.age_iteminsert_txnlog_tid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.age_iteminsert_txnlog_tid_seq OWNER TO postgres;

--
-- Name: age_iteminsert_txnlog_tid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.age_iteminsert_txnlog_tid_seq OWNED BY public.age_iteminsert_txnlog.tid;


--
-- Name: age_user_aggregate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.age_user_aggregate (
    uid integer NOT NULL,
    first_activity timestamp with time zone DEFAULT now() NOT NULL,
    last_activity timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.age_user_aggregate OWNER TO postgres;

--
-- Name: currentuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currentuser (
    mid character varying(20) NOT NULL,
    strcharid character varying(32),
    serverip character varying(15),
    clientip character varying(15),
    logindate timestamp with time zone DEFAULT now() NOT NULL,
    billingrule smallint,
    nduring integer,
    vps integer,
    serverid smallint,
    char_id integer,
    mac_address text,
    gold integer
);


ALTER TABLE public.currentuser OWNER TO postgres;

--
-- Name: game_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game_log (
    id integer NOT NULL,
    mid character varying(20) NOT NULL,
    strcharid character varying(32),
    logindate timestamp with time zone DEFAULT now(),
    logoutdate timestamp with time zone DEFAULT now(),
    nduring integer,
    vps integer,
    serverid smallint,
    clientip character varying(15),
    serverip character varying(15),
    char_id integer,
    node_id integer,
    char_level integer,
    gold integer,
    gold_diff integer
);


ALTER TABLE public.game_log OWNER TO postgres;

--
-- Name: game_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.game_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_log_id_seq OWNER TO postgres;

--
-- Name: game_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.game_log_id_seq OWNED BY public.game_log.id;


--
-- Name: gmip; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gmip (
    ip character varying(15) NOT NULL,
    description character varying(50)
);


ALTER TABLE public.gmip OWNER TO postgres;

--
-- Name: gmtool_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gmtool_log (
    gameaccount character varying(32),
    gameserver character varying(32),
    itemid character varying(10),
    itemname character varying(50),
    itemcount integer,
    byuser character varying(20),
    regdate date DEFAULT now()
);


ALTER TABLE public.gmtool_log OWNER TO postgres;

--
-- Name: id_actname; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.id_actname AS
 SELECT t1.id,
    t1.username
   FROM public.dblink('user=postgres dbname=FFAccount'::text, 'select id,username from accounts'::text) t1(id integer, username text);


ALTER TABLE public.id_actname OWNER TO postgres;

--
-- Name: oauth2_error_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_error_log (
    straccountid character varying(32) NOT NULL,
    itemid integer NOT NULL,
    itemcount smallint DEFAULT 1,
    buytime timestamp with time zone DEFAULT now() NOT NULL,
    buyprice integer,
    clientip character(20),
    buytype smallint DEFAULT 1 NOT NULL,
    bonus integer DEFAULT 0 NOT NULL,
    buytotal integer DEFAULT 0 NOT NULL,
    note text
);


ALTER TABLE public.oauth2_error_log OWNER TO postgres;

--
-- Name: oauth2_itemmall_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_itemmall_log (
    idx integer NOT NULL,
    straccountid character varying(32) NOT NULL,
    strcharid character varying(32),
    itemid integer NOT NULL,
    itemcount smallint DEFAULT 1,
    buytime timestamp with time zone DEFAULT now() NOT NULL,
    buyprice integer,
    clientip character(20),
    buytype smallint DEFAULT 1 NOT NULL,
    bonus integer DEFAULT 0 NOT NULL,
    buytotal integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.oauth2_itemmall_log OWNER TO postgres;

--
-- Name: oauth2_itemmall_log_idx_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_itemmall_log_idx_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_itemmall_log_idx_seq OWNER TO postgres;

--
-- Name: oauth2_itemmall_log_idx_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth2_itemmall_log_idx_seq OWNED BY public.oauth2_itemmall_log.idx;


--
-- Name: oauth2_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_mapping (
    uid integer NOT NULL,
    username character varying(32) DEFAULT ''::character varying,
    access_token character varying(64) DEFAULT ''::character varying,
    refresh_token character varying(64) DEFAULT ''::character varying,
    pwd_ot character varying(36) DEFAULT ''::character varying,
    updatetime timestamp without time zone DEFAULT now(),
    clientip character varying(20)
);


ALTER TABLE public.oauth2_mapping OWNER TO postgres;

--
-- Name: powerupitem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.powerupitem (
    item_id integer,
    note text,
    itemname text,
    itemmall boolean
);


ALTER TABLE public.powerupitem OWNER TO postgres;

--
-- Name: pus_avg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pus_avg (
    buydate date DEFAULT now() NOT NULL,
    buyprice integer DEFAULT 0,
    buynum integer DEFAULT 0,
    buyavg integer DEFAULT 0
);


ALTER TABLE public.pus_avg OWNER TO postgres;

--
-- Name: tb_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_user (
    mid character varying(20) NOT NULL,
    password character varying(32),
    pwd character varying(32),
    idnum integer NOT NULL,
    byauthority smallint DEFAULT 0,
    pvalues integer DEFAULT 0,
    firstlogindate timestamp without time zone,
    billingrule smallint DEFAULT 0,
    status smallint DEFAULT 0,
    regdate timestamp with time zone DEFAULT now(),
    lastlogindate timestamp with time zone,
    memberid character varying(20),
    clientip character varying(20),
    updatetime timestamp without time zone DEFAULT now(),
    bonus integer DEFAULT 0 NOT NULL,
    char_id integer,
    sel_chk integer
);


ALTER TABLE public.tb_user OWNER TO postgres;

--
-- Name: tb_user_idnum_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_user_idnum_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_user_idnum_seq OWNER TO postgres;

--
-- Name: tb_user_idnum_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_user_idnum_seq OWNED BY public.tb_user.idnum;


--
-- Name: two_pass; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.two_pass (
    "time" text,
    aid integer
);


ALTER TABLE public.two_pass OWNER TO postgres;

--
-- Name: web_itemmall_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.web_itemmall_log (
    idx integer NOT NULL,
    straccountid character varying(32) NOT NULL,
    strcharid character varying(32),
    serverno character(16) NOT NULL,
    itemid integer NOT NULL,
    itemcount smallint DEFAULT 1,
    buytime timestamp with time zone DEFAULT now() NOT NULL,
    buyprice smallint,
    clientip character(20),
    buytype smallint DEFAULT 1 NOT NULL,
    bonus integer DEFAULT 0 NOT NULL,
    serverid character varying,
    buytotal integer DEFAULT 0 NOT NULL,
    remain_point integer DEFAULT 0
);


ALTER TABLE public.web_itemmall_log OWNER TO postgres;

--
-- Name: web_itemmall_log_idx_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.web_itemmall_log_idx_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_itemmall_log_idx_seq OWNER TO postgres;

--
-- Name: web_itemmall_log_idx_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.web_itemmall_log_idx_seq OWNED BY public.web_itemmall_log.idx;


--
-- Name: age_iteminsert_txnlog tid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.age_iteminsert_txnlog ALTER COLUMN tid SET DEFAULT nextval('public.age_iteminsert_txnlog_tid_seq'::regclass);


--
-- Name: game_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_log ALTER COLUMN id SET DEFAULT nextval('public.game_log_id_seq'::regclass);


--
-- Name: oauth2_itemmall_log idx; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_itemmall_log ALTER COLUMN idx SET DEFAULT nextval('public.oauth2_itemmall_log_idx_seq'::regclass);


--
-- Name: tb_user idnum; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_user ALTER COLUMN idnum SET DEFAULT nextval('public.tb_user_idnum_seq'::regclass);


--
-- Name: web_itemmall_log idx; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.web_itemmall_log ALTER COLUMN idx SET DEFAULT nextval('public.web_itemmall_log_idx_seq'::regclass);


--
-- Data for Name: age_iteminsert_txnlog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.age_iteminsert_txnlog (tid, uid, txnid, updatetime) FROM stdin;
\.


--
-- Data for Name: age_user_aggregate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.age_user_aggregate (uid, first_activity, last_activity) FROM stdin;
\.


--
-- Data for Name: currentuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currentuser (mid, strcharid, serverip, clientip, logindate, billingrule, nduring, vps, serverid, char_id, mac_address, gold) FROM stdin;
\.


--
-- Data for Name: game_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.game_log (id, mid, strcharid, logindate, logoutdate, nduring, vps, serverid, clientip, serverip, char_id, node_id, char_level, gold, gold_diff) FROM stdin;
\.


--
-- Data for Name: gmip; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gmip (ip, description) FROM stdin;
\.


--
-- Data for Name: gmtool_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gmtool_log (gameaccount, gameserver, itemid, itemname, itemcount, byuser, regdate) FROM stdin;
\.


--
-- Data for Name: oauth2_error_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_error_log (straccountid, itemid, itemcount, buytime, buyprice, clientip, buytype, bonus, buytotal, note) FROM stdin;
\.


--
-- Data for Name: oauth2_itemmall_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_itemmall_log (idx, straccountid, strcharid, itemid, itemcount, buytime, buyprice, clientip, buytype, bonus, buytotal) FROM stdin;
\.


--
-- Data for Name: oauth2_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_mapping (uid, username, access_token, refresh_token, pwd_ot, updatetime, clientip) FROM stdin;
\.


--
-- Data for Name: powerupitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.powerupitem (item_id, note, itemname, itemmall) FROM stdin;
\.


--
-- Data for Name: pus_avg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pus_avg (buydate, buyprice, buynum, buyavg) FROM stdin;
\.


--
-- Data for Name: tb_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_user (mid, password, pwd, idnum, byauthority, pvalues, firstlogindate, billingrule, status, regdate, lastlogindate, memberid, clientip, updatetime, bonus, char_id, sel_chk) FROM stdin;
\.


--
-- Data for Name: two_pass; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.two_pass ("time", aid) FROM stdin;
\.


--
-- Data for Name: web_itemmall_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.web_itemmall_log (idx, straccountid, strcharid, serverno, itemid, itemcount, buytime, buyprice, clientip, buytype, bonus, serverid, buytotal, remain_point) FROM stdin;
\.


--
-- Name: age_iteminsert_txnlog_tid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.age_iteminsert_txnlog_tid_seq', 1364, true);


--
-- Name: game_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.game_log_id_seq', 5994, true);


--
-- Name: oauth2_itemmall_log_idx_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_itemmall_log_idx_seq', 596, true);


--
-- Name: tb_user_idnum_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_user_idnum_seq', 2417, true);


--
-- Name: web_itemmall_log_idx_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.web_itemmall_log_idx_seq', 106488, true);


--
-- Name: age_iteminsert_txnlog age_iteminsert_txnlog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.age_iteminsert_txnlog
    ADD CONSTRAINT age_iteminsert_txnlog_pkey PRIMARY KEY (tid);


--
-- Name: currentuser ccu_mid_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currentuser
    ADD CONSTRAINT ccu_mid_pkey PRIMARY KEY (mid);


--
-- Name: game_log gamelog_id_mid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_log
    ADD CONSTRAINT gamelog_id_mid PRIMARY KEY (id, mid);


--
-- Name: oauth2_mapping oauth2_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_mapping
    ADD CONSTRAINT oauth2_mapping_pkey PRIMARY KEY (uid);


--
-- Name: gmip pk_gmip; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gmip
    ADD CONSTRAINT pk_gmip PRIMARY KEY (ip);


--
-- Name: age_user_aggregate pk_uid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.age_user_aggregate
    ADD CONSTRAINT pk_uid PRIMARY KEY (uid);


--
-- Name: pus_avg pus_avg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pus_avg
    ADD CONSTRAINT pus_avg_pkey PRIMARY KEY (buydate);


--
-- Name: tb_user tb_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_user
    ADD CONSTRAINT tb_user_pkey PRIMARY KEY (mid);


--
-- Name: web_itemmall_log web_itemmall_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.web_itemmall_log
    ADD CONSTRAINT web_itemmall_log_pkey PRIMARY KEY (idx, straccountid, itemid, buytime);


--
-- Name: game_log_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX game_log_index ON public.game_log USING btree (logindate, logoutdate, serverid, clientip);


--
-- Name: index_tb_user_idnum; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_tb_user_idnum ON public.tb_user USING btree (idnum);


--
-- Name: ix_last_activity; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_last_activity ON public.age_user_aggregate USING btree (last_activity);


--
-- Name: tb_user_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tb_user_index ON public.tb_user USING btree (regdate, lastlogindate, firstlogindate);


--
-- Name: uid_txn; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uid_txn ON public.age_iteminsert_txnlog USING btree (uid, txnid);


--
-- Name: TABLE powerupitem; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.powerupitem TO PUBLIC;


--
-- PostgreSQL database dump complete
--

