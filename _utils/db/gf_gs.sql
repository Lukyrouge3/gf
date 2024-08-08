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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account_shared; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_shared (
    account_id integer NOT NULL,
    beaststower_enter_count integer DEFAULT 0,
    daily_update_time integer DEFAULT 0,
    rainbowroad_enter_count integer DEFAULT 0
);


ALTER TABLE public.account_shared OWNER TO postgres;

--
-- Name: advanced_ability; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.advanced_ability (
    player_id integer NOT NULL,
    effect_id integer NOT NULL,
    point integer DEFAULT 0
);


ALTER TABLE public.advanced_ability OWNER TO postgres;

--
-- Name: auction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auction (
    id integer NOT NULL,
    item_id integer NOT NULL,
    durability integer NOT NULL,
    maker character varying(32) DEFAULT ''::character varying,
    rank integer DEFAULT 0,
    identify smallint DEFAULT 1,
    magic smallint DEFAULT 0,
    embedded_amount integer DEFAULT 0,
    embedded_id1 integer DEFAULT '-1'::integer,
    embedded_id2 integer DEFAULT '-1'::integer,
    embedded_id3 integer DEFAULT '-1'::integer,
    embedded_id4 integer DEFAULT '-1'::integer,
    embedded_id5 integer DEFAULT '-1'::integer,
    embedded_id6 integer DEFAULT '-1'::integer,
    create_time integer DEFAULT 1,
    due_date integer DEFAULT 0,
    container_index integer DEFAULT '-1'::integer,
    combo_id integer DEFAULT 0,
    strengthen integer DEFAULT 0,
    cur_maxdurability integer DEFAULT 0,
    bind integer DEFAULT 0,
    seller_id integer DEFAULT 0,
    item_type integer DEFAULT 0,
    level integer DEFAULT 0,
    class bigint DEFAULT 0,
    quality integer DEFAULT 0,
    quality_filter integer DEFAULT 0,
    auction_duedate integer DEFAULT 0,
    auction_price bigint DEFAULT 0,
    lock_pwd text DEFAULT '*'::character varying,
    unlock_time integer DEFAULT 0,
    extra_combo_id1 integer DEFAULT 0,
    extra_combo_id2 integer DEFAULT 0,
    extra_combo_id3 integer DEFAULT 0,
    extra_combo_id4 integer DEFAULT 0,
    extra_combo_id5 integer DEFAULT 0,
    extra_combo_id6 integer DEFAULT 0,
    item_name text DEFAULT ''::character varying,
    witchcraft integer DEFAULT 0,
    train_type integer DEFAULT 0,
    train_level integer DEFAULT 0,
    train_exp integer DEFAULT 0,
    ride_combo integer DEFAULT 0,
    ride_star_level integer DEFAULT 0,
    ride_point integer DEFAULT 0,
    class_limit bit varying DEFAULT '0'::"bit",
    awake_level integer DEFAULT 0,
    awake_potential integer DEFAULT 0,
    awake_addition integer DEFAULT 0,
    combo_rune_slot integer DEFAULT '-1'::integer,
    rune_combo_id1 integer DEFAULT 0,
    rune_combo_id2 integer DEFAULT 0,
    rune_combo_id3 integer DEFAULT 0,
    rune_combo_id4 integer DEFAULT 0,
    rune_combo_id5 integer DEFAULT 0
);


ALTER TABLE public.auction OWNER TO postgres;

--
-- Name: auction_view_by_duedate_dn; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.auction_view_by_duedate_dn AS
 SELECT auction.id,
    auction.item_id,
    auction.durability,
    auction.maker,
    auction.rank,
    auction.identify,
    auction.magic,
    auction.embedded_amount,
    auction.embedded_id1,
    auction.embedded_id2,
    auction.embedded_id3,
    auction.embedded_id4,
    auction.embedded_id5,
    auction.embedded_id6,
    auction.create_time,
    auction.due_date,
    auction.container_index,
    auction.combo_id,
    auction.strengthen,
    auction.cur_maxdurability,
    auction.bind,
    auction.seller_id,
    auction.item_type,
    auction.level,
    auction.class,
    auction.quality,
    auction.quality_filter,
    auction.auction_duedate,
    auction.auction_price,
    auction.lock_pwd,
    auction.unlock_time,
    auction.extra_combo_id1,
    auction.extra_combo_id2,
    auction.extra_combo_id3,
    auction.extra_combo_id4,
    auction.extra_combo_id5,
    auction.extra_combo_id6,
    auction.item_name,
    auction.witchcraft,
    auction.train_type,
    auction.train_level,
    auction.train_exp,
    auction.ride_combo,
    auction.ride_star_level,
    auction.ride_point,
    auction.class_limit,
    auction.awake_level,
    auction.awake_potential,
    auction.awake_addition,
    auction.combo_rune_slot,
    auction.rune_combo_id1,
    auction.rune_combo_id2,
    auction.rune_combo_id3,
    auction.rune_combo_id4,
    auction.rune_combo_id5
   FROM public.auction
  ORDER BY auction.auction_duedate DESC;


ALTER TABLE public.auction_view_by_duedate_dn OWNER TO postgres;

--
-- Name: auction_view_by_duedate_up; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.auction_view_by_duedate_up AS
 SELECT auction.id,
    auction.item_id,
    auction.durability,
    auction.maker,
    auction.rank,
    auction.identify,
    auction.magic,
    auction.embedded_amount,
    auction.embedded_id1,
    auction.embedded_id2,
    auction.embedded_id3,
    auction.embedded_id4,
    auction.embedded_id5,
    auction.embedded_id6,
    auction.create_time,
    auction.due_date,
    auction.container_index,
    auction.combo_id,
    auction.strengthen,
    auction.cur_maxdurability,
    auction.bind,
    auction.seller_id,
    auction.item_type,
    auction.level,
    auction.class,
    auction.quality,
    auction.quality_filter,
    auction.auction_duedate,
    auction.auction_price,
    auction.lock_pwd,
    auction.unlock_time,
    auction.extra_combo_id1,
    auction.extra_combo_id2,
    auction.extra_combo_id3,
    auction.extra_combo_id4,
    auction.extra_combo_id5,
    auction.extra_combo_id6,
    auction.item_name,
    auction.witchcraft,
    auction.train_type,
    auction.train_level,
    auction.train_exp,
    auction.ride_combo,
    auction.ride_star_level,
    auction.ride_point,
    auction.class_limit,
    auction.awake_level,
    auction.awake_potential,
    auction.awake_addition,
    auction.combo_rune_slot,
    auction.rune_combo_id1,
    auction.rune_combo_id2,
    auction.rune_combo_id3,
    auction.rune_combo_id4,
    auction.rune_combo_id5
   FROM public.auction
  ORDER BY auction.auction_duedate;


ALTER TABLE public.auction_view_by_duedate_up OWNER TO postgres;

--
-- Name: auction_view_by_level_dn; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.auction_view_by_level_dn AS
 SELECT auction.id,
    auction.item_id,
    auction.durability,
    auction.maker,
    auction.rank,
    auction.identify,
    auction.magic,
    auction.embedded_amount,
    auction.embedded_id1,
    auction.embedded_id2,
    auction.embedded_id3,
    auction.embedded_id4,
    auction.embedded_id5,
    auction.embedded_id6,
    auction.create_time,
    auction.due_date,
    auction.container_index,
    auction.combo_id,
    auction.strengthen,
    auction.cur_maxdurability,
    auction.bind,
    auction.seller_id,
    auction.item_type,
    auction.level,
    auction.class,
    auction.quality,
    auction.quality_filter,
    auction.auction_duedate,
    auction.auction_price,
    auction.lock_pwd,
    auction.unlock_time,
    auction.extra_combo_id1,
    auction.extra_combo_id2,
    auction.extra_combo_id3,
    auction.extra_combo_id4,
    auction.extra_combo_id5,
    auction.extra_combo_id6,
    auction.item_name,
    auction.witchcraft,
    auction.train_type,
    auction.train_level,
    auction.train_exp,
    auction.ride_combo,
    auction.ride_star_level,
    auction.ride_point,
    auction.class_limit,
    auction.awake_level,
    auction.awake_potential,
    auction.awake_addition,
    auction.combo_rune_slot,
    auction.rune_combo_id1,
    auction.rune_combo_id2,
    auction.rune_combo_id3,
    auction.rune_combo_id4,
    auction.rune_combo_id5
   FROM public.auction
  ORDER BY auction.level DESC;


ALTER TABLE public.auction_view_by_level_dn OWNER TO postgres;

--
-- Name: auction_view_by_level_up; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.auction_view_by_level_up AS
 SELECT auction.id,
    auction.item_id,
    auction.durability,
    auction.maker,
    auction.rank,
    auction.identify,
    auction.magic,
    auction.embedded_amount,
    auction.embedded_id1,
    auction.embedded_id2,
    auction.embedded_id3,
    auction.embedded_id4,
    auction.embedded_id5,
    auction.embedded_id6,
    auction.create_time,
    auction.due_date,
    auction.container_index,
    auction.combo_id,
    auction.strengthen,
    auction.cur_maxdurability,
    auction.bind,
    auction.seller_id,
    auction.item_type,
    auction.level,
    auction.class,
    auction.quality,
    auction.quality_filter,
    auction.auction_duedate,
    auction.auction_price,
    auction.lock_pwd,
    auction.unlock_time,
    auction.extra_combo_id1,
    auction.extra_combo_id2,
    auction.extra_combo_id3,
    auction.extra_combo_id4,
    auction.extra_combo_id5,
    auction.extra_combo_id6,
    auction.item_name,
    auction.witchcraft,
    auction.train_type,
    auction.train_level,
    auction.train_exp,
    auction.ride_combo,
    auction.ride_star_level,
    auction.ride_point,
    auction.class_limit,
    auction.awake_level,
    auction.awake_potential,
    auction.awake_addition,
    auction.combo_rune_slot,
    auction.rune_combo_id1,
    auction.rune_combo_id2,
    auction.rune_combo_id3,
    auction.rune_combo_id4,
    auction.rune_combo_id5
   FROM public.auction
  ORDER BY auction.level;


ALTER TABLE public.auction_view_by_level_up OWNER TO postgres;

--
-- Name: auction_view_by_price_dn; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.auction_view_by_price_dn AS
 SELECT auction.id,
    auction.item_id,
    auction.durability,
    auction.maker,
    auction.rank,
    auction.identify,
    auction.magic,
    auction.embedded_amount,
    auction.embedded_id1,
    auction.embedded_id2,
    auction.embedded_id3,
    auction.embedded_id4,
    auction.embedded_id5,
    auction.embedded_id6,
    auction.create_time,
    auction.due_date,
    auction.container_index,
    auction.combo_id,
    auction.strengthen,
    auction.cur_maxdurability,
    auction.bind,
    auction.seller_id,
    auction.item_type,
    auction.level,
    auction.class,
    auction.quality,
    auction.quality_filter,
    auction.auction_duedate,
    auction.auction_price,
    auction.lock_pwd,
    auction.unlock_time,
    auction.extra_combo_id1,
    auction.extra_combo_id2,
    auction.extra_combo_id3,
    auction.extra_combo_id4,
    auction.extra_combo_id5,
    auction.extra_combo_id6,
    auction.item_name,
    auction.witchcraft,
    auction.train_type,
    auction.train_level,
    auction.train_exp,
    auction.ride_combo,
    auction.ride_star_level,
    auction.ride_point,
    auction.class_limit,
    auction.awake_level,
    auction.awake_potential,
    auction.awake_addition,
    auction.combo_rune_slot,
    auction.rune_combo_id1,
    auction.rune_combo_id2,
    auction.rune_combo_id3,
    auction.rune_combo_id4,
    auction.rune_combo_id5
   FROM public.auction
  ORDER BY auction.auction_price DESC;


ALTER TABLE public.auction_view_by_price_dn OWNER TO postgres;

--
-- Name: auction_view_by_price_up; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.auction_view_by_price_up AS
 SELECT auction.id,
    auction.item_id,
    auction.durability,
    auction.maker,
    auction.rank,
    auction.identify,
    auction.magic,
    auction.embedded_amount,
    auction.embedded_id1,
    auction.embedded_id2,
    auction.embedded_id3,
    auction.embedded_id4,
    auction.embedded_id5,
    auction.embedded_id6,
    auction.create_time,
    auction.due_date,
    auction.container_index,
    auction.combo_id,
    auction.strengthen,
    auction.cur_maxdurability,
    auction.bind,
    auction.seller_id,
    auction.item_type,
    auction.level,
    auction.class,
    auction.quality,
    auction.quality_filter,
    auction.auction_duedate,
    auction.auction_price,
    auction.lock_pwd,
    auction.unlock_time,
    auction.extra_combo_id1,
    auction.extra_combo_id2,
    auction.extra_combo_id3,
    auction.extra_combo_id4,
    auction.extra_combo_id5,
    auction.extra_combo_id6,
    auction.item_name,
    auction.witchcraft,
    auction.train_type,
    auction.train_level,
    auction.train_exp,
    auction.ride_combo,
    auction.ride_star_level,
    auction.ride_point,
    auction.class_limit,
    auction.awake_level,
    auction.awake_potential,
    auction.awake_addition,
    auction.combo_rune_slot,
    auction.rune_combo_id1,
    auction.rune_combo_id2,
    auction.rune_combo_id3,
    auction.rune_combo_id4,
    auction.rune_combo_id5
   FROM public.auction
  ORDER BY auction.auction_price;


ALTER TABLE public.auction_view_by_price_up OWNER TO postgres;

--
-- Name: auction_view_by_quality_dn; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.auction_view_by_quality_dn AS
 SELECT auction.id,
    auction.item_id,
    auction.durability,
    auction.maker,
    auction.rank,
    auction.identify,
    auction.magic,
    auction.embedded_amount,
    auction.embedded_id1,
    auction.embedded_id2,
    auction.embedded_id3,
    auction.embedded_id4,
    auction.embedded_id5,
    auction.embedded_id6,
    auction.create_time,
    auction.due_date,
    auction.container_index,
    auction.combo_id,
    auction.strengthen,
    auction.cur_maxdurability,
    auction.bind,
    auction.seller_id,
    auction.item_type,
    auction.level,
    auction.class,
    auction.quality,
    auction.quality_filter,
    auction.auction_duedate,
    auction.auction_price,
    auction.lock_pwd,
    auction.unlock_time,
    auction.extra_combo_id1,
    auction.extra_combo_id2,
    auction.extra_combo_id3,
    auction.extra_combo_id4,
    auction.extra_combo_id5,
    auction.extra_combo_id6,
    auction.item_name,
    auction.witchcraft,
    auction.train_type,
    auction.train_level,
    auction.train_exp,
    auction.ride_combo,
    auction.ride_star_level,
    auction.ride_point,
    auction.class_limit,
    auction.awake_level,
    auction.awake_potential,
    auction.awake_addition,
    auction.combo_rune_slot,
    auction.rune_combo_id1,
    auction.rune_combo_id2,
    auction.rune_combo_id3,
    auction.rune_combo_id4,
    auction.rune_combo_id5
   FROM public.auction
  ORDER BY auction.quality DESC;


ALTER TABLE public.auction_view_by_quality_dn OWNER TO postgres;

--
-- Name: auction_view_by_quality_up; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.auction_view_by_quality_up AS
 SELECT auction.id,
    auction.item_id,
    auction.durability,
    auction.maker,
    auction.rank,
    auction.identify,
    auction.magic,
    auction.embedded_amount,
    auction.embedded_id1,
    auction.embedded_id2,
    auction.embedded_id3,
    auction.embedded_id4,
    auction.embedded_id5,
    auction.embedded_id6,
    auction.create_time,
    auction.due_date,
    auction.container_index,
    auction.combo_id,
    auction.strengthen,
    auction.cur_maxdurability,
    auction.bind,
    auction.seller_id,
    auction.item_type,
    auction.level,
    auction.class,
    auction.quality,
    auction.quality_filter,
    auction.auction_duedate,
    auction.auction_price,
    auction.lock_pwd,
    auction.unlock_time,
    auction.extra_combo_id1,
    auction.extra_combo_id2,
    auction.extra_combo_id3,
    auction.extra_combo_id4,
    auction.extra_combo_id5,
    auction.extra_combo_id6,
    auction.item_name,
    auction.witchcraft,
    auction.train_type,
    auction.train_level,
    auction.train_exp,
    auction.ride_combo,
    auction.ride_star_level,
    auction.ride_point,
    auction.class_limit,
    auction.awake_level,
    auction.awake_potential,
    auction.awake_addition,
    auction.combo_rune_slot,
    auction.rune_combo_id1,
    auction.rune_combo_id2,
    auction.rune_combo_id3,
    auction.rune_combo_id4,
    auction.rune_combo_id5
   FROM public.auction
  ORDER BY auction.quality;


ALTER TABLE public.auction_view_by_quality_up OWNER TO postgres;

--
-- Name: bags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bags (
    id integer NOT NULL,
    item_id integer NOT NULL,
    durability integer NOT NULL,
    maker text DEFAULT ''::character varying,
    rank integer DEFAULT 0,
    identify smallint DEFAULT 1,
    magic smallint DEFAULT 0,
    embedded_amount integer DEFAULT 0,
    embedded_id1 integer DEFAULT '-1'::integer,
    embedded_id2 integer DEFAULT '-1'::integer,
    embedded_id3 integer DEFAULT '-1'::integer,
    embedded_id4 integer DEFAULT '-1'::integer,
    embedded_id5 integer DEFAULT '-1'::integer,
    embedded_id6 integer DEFAULT '-1'::integer,
    create_time integer DEFAULT 1,
    due_date integer DEFAULT 0,
    container_index integer DEFAULT '-1'::integer,
    combo_id integer DEFAULT 0,
    strengthen integer DEFAULT 0,
    cur_maxdurability integer DEFAULT 0,
    bind integer DEFAULT 0,
    player_id integer NOT NULL,
    loc integer NOT NULL,
    lock_pwd text DEFAULT '*'::character varying,
    unlock_time integer DEFAULT 0,
    extra_combo_id1 integer DEFAULT 0,
    extra_combo_id2 integer DEFAULT 0,
    extra_combo_id3 integer DEFAULT 0,
    extra_combo_id4 integer DEFAULT 0,
    extra_combo_id5 integer DEFAULT 0,
    extra_combo_id6 integer DEFAULT 0,
    witchcraft integer DEFAULT 0,
    train_type integer DEFAULT 0,
    train_level integer DEFAULT 0,
    train_exp integer DEFAULT 0,
    ride_combo integer DEFAULT 0,
    ride_star_level integer DEFAULT 0,
    ride_point integer DEFAULT 0,
    awake_level integer DEFAULT 0,
    awake_potential integer DEFAULT 0,
    awake_addition integer DEFAULT 0,
    combo_rune_slot integer DEFAULT '-1'::integer,
    rune_combo_id1 integer DEFAULT 0,
    rune_combo_id2 integer DEFAULT 0,
    rune_combo_id3 integer DEFAULT 0,
    rune_combo_id4 integer DEFAULT 0,
    rune_combo_id5 integer DEFAULT 0
);


ALTER TABLE public.bags OWNER TO postgres;

--
-- Name: battlefield_career; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.battlefield_career (
    player_id integer NOT NULL,
    player_name text DEFAULT ''::character varying,
    player_lv integer NOT NULL,
    player_class integer NOT NULL,
    join_count integer NOT NULL,
    win_count integer NOT NULL,
    lose_count integer NOT NULL,
    mvp_count integer NOT NULL,
    hight_score integer NOT NULL,
    kill_count integer NOT NULL,
    die_count integer NOT NULL,
    hight_kill integer NOT NULL,
    hight_die integer NOT NULL,
    hight_damage integer NOT NULL,
    hight_altar_damage integer NOT NULL,
    hight_cure integer NOT NULL
);


ALTER TABLE public.battlefield_career OWNER TO postgres;

--
-- Name: battlefield_month; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.battlefield_month (
    player_id integer NOT NULL,
    player_name text DEFAULT ''::character varying,
    player_lv integer NOT NULL,
    player_class integer NOT NULL,
    join_count integer NOT NULL,
    win_count integer NOT NULL,
    lose_count integer NOT NULL,
    mvp_count integer NOT NULL,
    hight_score integer NOT NULL,
    kill_count integer NOT NULL,
    die_count integer NOT NULL,
    hight_kill integer NOT NULL,
    hight_die integer NOT NULL,
    hight_damage integer NOT NULL,
    hight_altar_damage integer NOT NULL,
    hight_cure integer NOT NULL,
    mvp_count_weight double precision DEFAULT 0,
    kill_count_weight double precision DEFAULT 0,
    pk_grade integer DEFAULT 0,
    pk_kill_count integer DEFAULT 0,
    pk_join_count integer DEFAULT 0,
    rebirth_count integer DEFAULT 0
);


ALTER TABLE public.battlefield_month OWNER TO postgres;

--
-- Name: beasts_tower; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beasts_tower (
    bt_id integer DEFAULT 0,
    floor integer DEFAULT 0,
    family_id integer DEFAULT 0
);


ALTER TABLE public.beasts_tower OWNER TO postgres;

--
-- Name: beasts_tower_members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beasts_tower_members (
    player_id integer NOT NULL,
    bt_id integer DEFAULT 0,
    family_id integer DEFAULT 0
);


ALTER TABLE public.beasts_tower_members OWNER TO postgres;

--
-- Name: collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collection (
    id integer NOT NULL,
    item_id integer NOT NULL,
    durability integer NOT NULL,
    maker text DEFAULT ''::character varying,
    rank integer DEFAULT 0,
    identify smallint DEFAULT 1,
    magic smallint DEFAULT 0,
    embedded_amount integer DEFAULT 0,
    embedded_id1 integer DEFAULT '-1'::integer,
    embedded_id2 integer DEFAULT '-1'::integer,
    embedded_id3 integer DEFAULT '-1'::integer,
    embedded_id4 integer DEFAULT '-1'::integer,
    embedded_id5 integer DEFAULT '-1'::integer,
    embedded_id6 integer DEFAULT '-1'::integer,
    create_time integer DEFAULT 1,
    due_date integer DEFAULT 0,
    combo_id integer DEFAULT 0,
    strengthen integer DEFAULT 0,
    cur_maxdurability integer DEFAULT 0,
    bind integer DEFAULT 0,
    account_id integer NOT NULL,
    lock_pwd text DEFAULT '*'::character varying,
    unlock_time integer DEFAULT 0,
    extra_combo_id1 integer DEFAULT 0,
    extra_combo_id2 integer DEFAULT 0,
    extra_combo_id3 integer DEFAULT 0,
    extra_combo_id4 integer DEFAULT 0,
    extra_combo_id5 integer DEFAULT 0,
    extra_combo_id6 integer DEFAULT 0,
    witchcraft integer DEFAULT 0,
    train_type integer DEFAULT 0,
    train_level integer DEFAULT 0,
    train_exp integer DEFAULT 0,
    ride_combo integer DEFAULT 0,
    ride_star_level integer DEFAULT 0,
    ride_point integer DEFAULT 0,
    awake_level integer DEFAULT 0,
    awake_potential integer DEFAULT 0,
    awake_addition integer DEFAULT 0,
    combo_rune_slot integer DEFAULT '-1'::integer,
    rune_combo_id1 integer DEFAULT 0,
    rune_combo_id2 integer DEFAULT 0,
    rune_combo_id3 integer DEFAULT 0,
    rune_combo_id4 integer DEFAULT 0,
    rune_combo_id5 integer DEFAULT 0
);


ALTER TABLE public.collection OWNER TO postgres;

--
-- Name: configuration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.configuration (
    schema_version integer NOT NULL,
    world_start_time character varying(32) NOT NULL,
    mission_version integer DEFAULT 0
);


ALTER TABLE public.configuration OWNER TO postgres;

--
-- Name: daily_awards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.daily_awards (
    id integer NOT NULL,
    day_index integer DEFAULT 0,
    cooldown_time integer DEFAULT 0,
    award_days bigint DEFAULT 0,
    award_records bigint DEFAULT 0
);


ALTER TABLE public.daily_awards OWNER TO postgres;

--
-- Name: elf1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.elf1 (
    elf_id integer NOT NULL,
    player_id integer NOT NULL,
    template_id integer NOT NULL,
    name text DEFAULT ''::character varying,
    level integer DEFAULT 1,
    exp integer DEFAULT 0,
    familiar integer DEFAULT 0,
    mood integer DEFAULT 0,
    energy integer DEFAULT 0,
    stone_a integer DEFAULT 0,
    stone_b integer DEFAULT 0,
    skill_id_1 integer DEFAULT 0,
    skill_level_1 integer DEFAULT 0,
    skill_exp_1 integer DEFAULT 0,
    skill_id_2 integer DEFAULT 0,
    skill_level_2 integer DEFAULT 0,
    skill_exp_2 integer DEFAULT 0,
    skill_id_3 integer DEFAULT 0,
    skill_level_3 integer DEFAULT 0,
    skill_exp_3 integer DEFAULT 0,
    skill_id_4 integer DEFAULT 0,
    skill_level_4 integer DEFAULT 0,
    skill_exp_4 integer DEFAULT 0,
    loc smallint NOT NULL,
    item1 integer DEFAULT 0,
    amount1 integer DEFAULT 0,
    socket_amount1 integer DEFAULT 0,
    item2 integer DEFAULT 0,
    amount2 integer DEFAULT 0,
    socket_amount2 integer DEFAULT 0,
    item3 integer DEFAULT 0,
    amount3 integer DEFAULT 0,
    socket_amount3 integer DEFAULT 0,
    work_type integer DEFAULT 0,
    work_id integer DEFAULT 0,
    work_event integer DEFAULT 0,
    work_count integer DEFAULT 1,
    face integer DEFAULT 0,
    type integer DEFAULT 0,
    skin integer DEFAULT 0,
    return_loc integer DEFAULT 0,
    return_grade integer DEFAULT 0,
    wall integer DEFAULT 0,
    ground integer DEFAULT 0,
    game_win integer DEFAULT 0,
    game_lose integer DEFAULT 0,
    game_ko integer DEFAULT 0,
    game_winmsg text DEFAULT ''::character varying,
    game_jan_al smallint DEFAULT 1,
    game_ken_al smallint DEFAULT 1,
    game_pon_al smallint DEFAULT 1,
    game_jan_dl smallint DEFAULT 1,
    game_ken_dl smallint DEFAULT 1,
    game_pon_dl smallint DEFAULT 1,
    game_jan_ae integer DEFAULT 0,
    game_ken_ae integer DEFAULT 0,
    game_pon_ae integer DEFAULT 0,
    game_jan_de integer DEFAULT 0,
    game_ken_de integer DEFAULT 0,
    game_pon_de integer DEFAULT 0,
    combo1 integer DEFAULT 0,
    combo2 integer DEFAULT 0,
    combo3 integer DEFAULT 0,
    extra_combo1_1 integer DEFAULT 0,
    extra_combo1_2 integer DEFAULT 0,
    extra_combo1_3 integer DEFAULT 0,
    extra_combo1_4 integer DEFAULT 0,
    extra_combo1_5 integer DEFAULT 0,
    extra_combo1_6 integer DEFAULT 0,
    extra_combo2_1 integer DEFAULT 0,
    extra_combo2_2 integer DEFAULT 0,
    extra_combo2_3 integer DEFAULT 0,
    extra_combo2_4 integer DEFAULT 0,
    extra_combo2_5 integer DEFAULT 0,
    extra_combo2_6 integer DEFAULT 0,
    extra_combo3_1 integer DEFAULT 0,
    extra_combo3_2 integer DEFAULT 0,
    extra_combo3_3 integer DEFAULT 0,
    extra_combo3_4 integer DEFAULT 0,
    extra_combo3_5 integer DEFAULT 0,
    extra_combo3_6 integer DEFAULT 0,
    game_jan_count integer DEFAULT 0,
    game_ken_count integer DEFAULT 0,
    game_pon_count integer DEFAULT 0,
    gold1 integer DEFAULT 0,
    gold2 integer DEFAULT 0,
    gold3 integer DEFAULT 0,
    witchcraft1 integer DEFAULT 0,
    witchcraft2 integer DEFAULT 0,
    witchcraft3 integer DEFAULT 0,
    strengthen1 integer DEFAULT 0,
    strengthen2 integer DEFAULT 0,
    strengthen3 integer DEFAULT 0,
    embedded1_1 integer DEFAULT '-1'::integer,
    embedded1_2 integer DEFAULT '-1'::integer,
    embedded1_3 integer DEFAULT '-1'::integer,
    embedded1_4 integer DEFAULT '-1'::integer,
    embedded1_5 integer DEFAULT '-1'::integer,
    embedded1_6 integer DEFAULT '-1'::integer,
    embedded2_1 integer DEFAULT '-1'::integer,
    embedded2_2 integer DEFAULT '-1'::integer,
    embedded2_3 integer DEFAULT '-1'::integer,
    embedded2_4 integer DEFAULT '-1'::integer,
    embedded2_5 integer DEFAULT '-1'::integer,
    embedded2_6 integer DEFAULT '-1'::integer,
    embedded3_1 integer DEFAULT 0,
    embedded3_2 integer DEFAULT '-1'::integer,
    embedded3_3 integer DEFAULT '-1'::integer,
    embedded3_4 integer DEFAULT '-1'::integer,
    embedded3_5 integer DEFAULT '-1'::integer,
    embedded3_6 integer DEFAULT '-1'::integer,
    rework integer DEFAULT 0,
    max_durability1 integer DEFAULT '-1'::integer,
    max_durability2 integer DEFAULT '-1'::integer,
    max_durability3 integer DEFAULT '-1'::integer,
    class_id integer DEFAULT 0,
    train_type_1 integer DEFAULT 0,
    train_level_1 integer DEFAULT 0,
    train_exp_1 integer DEFAULT 0,
    train_type_2 integer DEFAULT 0,
    train_level_2 integer DEFAULT 0,
    train_exp_2 integer DEFAULT 0,
    train_type_3 integer DEFAULT 0,
    train_level_3 integer DEFAULT 0,
    train_exp_3 integer DEFAULT 0,
    to_bind1 integer DEFAULT 0,
    to_bind2 integer DEFAULT 0,
    to_bind3 integer DEFAULT 0,
    ride_combo1 integer DEFAULT 0,
    ride_star_level1 integer DEFAULT 0,
    ride_point1 integer DEFAULT 0,
    ride_combo2 integer DEFAULT 0,
    ride_star_level2 integer DEFAULT 0,
    ride_point2 integer DEFAULT 0,
    ride_combo3 integer DEFAULT 0,
    ride_star_level3 integer DEFAULT 0,
    ride_point3 integer DEFAULT 0,
    awake_level1 integer DEFAULT 0,
    awake_potential1 integer DEFAULT 0,
    awake_addition1 integer DEFAULT 0,
    awake_level2 integer DEFAULT 0,
    awake_potential2 integer DEFAULT 0,
    awake_addition2 integer DEFAULT 0,
    awake_level3 integer DEFAULT 0,
    awake_potential3 integer DEFAULT 0,
    awake_addition3 integer DEFAULT 0,
    combo_rune_slot1 integer DEFAULT '-1'::integer,
    rune_combo_id1_1 integer DEFAULT 0,
    rune_combo_id1_2 integer DEFAULT 0,
    rune_combo_id1_3 integer DEFAULT 0,
    rune_combo_id1_4 integer DEFAULT 0,
    rune_combo_id1_5 integer DEFAULT 0,
    combo_rune_slot2 integer DEFAULT '-1'::integer,
    rune_combo_id2_1 integer DEFAULT 0,
    rune_combo_id2_2 integer DEFAULT 0,
    rune_combo_id2_3 integer DEFAULT 0,
    rune_combo_id2_4 integer DEFAULT 0,
    rune_combo_id2_5 integer DEFAULT 0,
    combo_rune_slot3 integer DEFAULT '-1'::integer,
    rune_combo_id3_1 integer DEFAULT 0,
    rune_combo_id3_2 integer DEFAULT 0,
    rune_combo_id3_3 integer DEFAULT 0,
    rune_combo_id3_4 integer DEFAULT 0,
    rune_combo_id3_5 integer DEFAULT 0
);


ALTER TABLE public.elf1 OWNER TO postgres;

--
-- Name: elf2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.elf2 (
    elf_id integer NOT NULL,
    player_id integer NOT NULL,
    template_id integer NOT NULL,
    name text DEFAULT ''::character varying,
    level integer DEFAULT 1,
    exp integer DEFAULT 0,
    familiar integer DEFAULT 0,
    mood integer DEFAULT 0,
    energy integer DEFAULT 0,
    stone_a integer DEFAULT 0,
    stone_b integer DEFAULT 0,
    skill_id_1 integer DEFAULT 0,
    skill_level_1 integer DEFAULT 0,
    skill_exp_1 integer DEFAULT 0,
    skill_id_2 integer DEFAULT 0,
    skill_level_2 integer DEFAULT 0,
    skill_exp_2 integer DEFAULT 0,
    skill_id_3 integer DEFAULT 0,
    skill_level_3 integer DEFAULT 0,
    skill_exp_3 integer DEFAULT 0,
    skill_id_4 integer DEFAULT 0,
    skill_level_4 integer DEFAULT 0,
    skill_exp_4 integer DEFAULT 0,
    loc smallint NOT NULL,
    item1 integer DEFAULT 0,
    amount1 integer DEFAULT 0,
    socket_amount1 integer DEFAULT 0,
    item2 integer DEFAULT 0,
    amount2 integer DEFAULT 0,
    socket_amount2 integer DEFAULT 0,
    item3 integer DEFAULT 0,
    amount3 integer DEFAULT 0,
    socket_amount3 integer DEFAULT 0,
    work_type integer DEFAULT 0,
    work_id integer DEFAULT 0,
    work_event integer DEFAULT 0,
    work_count integer DEFAULT 1,
    face integer DEFAULT 0,
    type integer DEFAULT 0,
    skin integer DEFAULT 0,
    return_loc integer DEFAULT 0,
    return_grade integer DEFAULT 0,
    wall integer DEFAULT 0,
    ground integer DEFAULT 0,
    game_win integer DEFAULT 0,
    game_lose integer DEFAULT 0,
    game_ko integer DEFAULT 0,
    game_winmsg text DEFAULT ''::character varying,
    game_jan_al smallint DEFAULT 1,
    game_ken_al smallint DEFAULT 1,
    game_pon_al smallint DEFAULT 1,
    game_jan_dl smallint DEFAULT 1,
    game_ken_dl smallint DEFAULT 1,
    game_pon_dl smallint DEFAULT 1,
    game_jan_ae integer DEFAULT 0,
    game_ken_ae integer DEFAULT 0,
    game_pon_ae integer DEFAULT 0,
    game_jan_de integer DEFAULT 0,
    game_ken_de integer DEFAULT 0,
    game_pon_de integer DEFAULT 0,
    combo1 integer DEFAULT 0,
    combo2 integer DEFAULT 0,
    combo3 integer DEFAULT 0,
    extra_combo1_1 integer DEFAULT 0,
    extra_combo1_2 integer DEFAULT 0,
    extra_combo1_3 integer DEFAULT 0,
    extra_combo1_4 integer DEFAULT 0,
    extra_combo1_5 integer DEFAULT 0,
    extra_combo1_6 integer DEFAULT 0,
    extra_combo2_1 integer DEFAULT 0,
    extra_combo2_2 integer DEFAULT 0,
    extra_combo2_3 integer DEFAULT 0,
    extra_combo2_4 integer DEFAULT 0,
    extra_combo2_5 integer DEFAULT 0,
    extra_combo2_6 integer DEFAULT 0,
    extra_combo3_1 integer DEFAULT 0,
    extra_combo3_2 integer DEFAULT 0,
    extra_combo3_3 integer DEFAULT 0,
    extra_combo3_4 integer DEFAULT 0,
    extra_combo3_5 integer DEFAULT 0,
    extra_combo3_6 integer DEFAULT 0,
    game_jan_count integer DEFAULT 0,
    game_ken_count integer DEFAULT 0,
    game_pon_count integer DEFAULT 0,
    gold1 integer DEFAULT 0,
    gold2 integer DEFAULT 0,
    gold3 integer DEFAULT 0,
    witchcraft1 integer DEFAULT 0,
    witchcraft2 integer DEFAULT 0,
    witchcraft3 integer DEFAULT 0,
    strengthen1 integer DEFAULT 0,
    strengthen2 integer DEFAULT 0,
    strengthen3 integer DEFAULT 0,
    embedded1_1 integer DEFAULT '-1'::integer,
    embedded1_2 integer DEFAULT '-1'::integer,
    embedded1_3 integer DEFAULT '-1'::integer,
    embedded1_4 integer DEFAULT '-1'::integer,
    embedded1_5 integer DEFAULT '-1'::integer,
    embedded1_6 integer DEFAULT '-1'::integer,
    embedded2_1 integer DEFAULT '-1'::integer,
    embedded2_2 integer DEFAULT '-1'::integer,
    embedded2_3 integer DEFAULT '-1'::integer,
    embedded2_4 integer DEFAULT '-1'::integer,
    embedded2_5 integer DEFAULT '-1'::integer,
    embedded2_6 integer DEFAULT '-1'::integer,
    embedded3_1 integer DEFAULT 0,
    embedded3_2 integer DEFAULT '-1'::integer,
    embedded3_3 integer DEFAULT '-1'::integer,
    embedded3_4 integer DEFAULT '-1'::integer,
    embedded3_5 integer DEFAULT '-1'::integer,
    embedded3_6 integer DEFAULT '-1'::integer,
    rework integer DEFAULT 0,
    max_durability1 integer DEFAULT '-1'::integer,
    max_durability2 integer DEFAULT '-1'::integer,
    max_durability3 integer DEFAULT '-1'::integer,
    class_id integer DEFAULT 0,
    train_type_1 integer DEFAULT 0,
    train_level_1 integer DEFAULT 0,
    train_exp_1 integer DEFAULT 0,
    train_type_2 integer DEFAULT 0,
    train_level_2 integer DEFAULT 0,
    train_exp_2 integer DEFAULT 0,
    train_type_3 integer DEFAULT 0,
    train_level_3 integer DEFAULT 0,
    train_exp_3 integer DEFAULT 0,
    to_bind1 integer DEFAULT 0,
    to_bind2 integer DEFAULT 0,
    to_bind3 integer DEFAULT 0,
    ride_combo1 integer DEFAULT 0,
    ride_star_level1 integer DEFAULT 0,
    ride_point1 integer DEFAULT 0,
    ride_combo2 integer DEFAULT 0,
    ride_star_level2 integer DEFAULT 0,
    ride_point2 integer DEFAULT 0,
    ride_combo3 integer DEFAULT 0,
    ride_star_level3 integer DEFAULT 0,
    ride_point3 integer DEFAULT 0,
    awake_level1 integer DEFAULT 0,
    awake_potential1 integer DEFAULT 0,
    awake_addition1 integer DEFAULT 0,
    awake_level2 integer DEFAULT 0,
    awake_potential2 integer DEFAULT 0,
    awake_addition2 integer DEFAULT 0,
    awake_level3 integer DEFAULT 0,
    awake_potential3 integer DEFAULT 0,
    awake_addition3 integer DEFAULT 0,
    combo_rune_slot1 integer DEFAULT '-1'::integer,
    rune_combo_id1_1 integer DEFAULT 0,
    rune_combo_id1_2 integer DEFAULT 0,
    rune_combo_id1_3 integer DEFAULT 0,
    rune_combo_id1_4 integer DEFAULT 0,
    rune_combo_id1_5 integer DEFAULT 0,
    combo_rune_slot2 integer DEFAULT '-1'::integer,
    rune_combo_id2_1 integer DEFAULT 0,
    rune_combo_id2_2 integer DEFAULT 0,
    rune_combo_id2_3 integer DEFAULT 0,
    rune_combo_id2_4 integer DEFAULT 0,
    rune_combo_id2_5 integer DEFAULT 0,
    combo_rune_slot3 integer DEFAULT '-1'::integer,
    rune_combo_id3_1 integer DEFAULT 0,
    rune_combo_id3_2 integer DEFAULT 0,
    rune_combo_id3_3 integer DEFAULT 0,
    rune_combo_id3_4 integer DEFAULT 0,
    rune_combo_id3_5 integer DEFAULT 0
);


ALTER TABLE public.elf2 OWNER TO postgres;

--
-- Name: elf; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.elf AS
 SELECT elf1.elf_id,
    elf1.player_id,
    elf1.template_id,
    elf1.name,
    elf1.level,
    elf1.exp,
    elf1.familiar,
    elf1.mood,
    elf1.energy,
    elf1.stone_a,
    elf1.stone_b,
    elf1.skill_id_1,
    elf1.skill_level_1,
    elf1.skill_exp_1,
    elf1.skill_id_2,
    elf1.skill_level_2,
    elf1.skill_exp_2,
    elf1.skill_id_3,
    elf1.skill_level_3,
    elf1.skill_exp_3,
    elf1.skill_id_4,
    elf1.skill_level_4,
    elf1.skill_exp_4,
    elf1.loc,
    elf1.item1,
    elf1.amount1,
    elf1.socket_amount1,
    elf1.item2,
    elf1.amount2,
    elf1.socket_amount2,
    elf1.item3,
    elf1.amount3,
    elf1.socket_amount3,
    elf1.work_type,
    elf1.work_id,
    elf1.work_event,
    elf1.work_count,
    elf1.face,
    elf1.type,
    elf1.skin,
    elf1.return_loc,
    elf1.return_grade,
    elf1.wall,
    elf1.ground,
    elf1.game_win,
    elf1.game_lose,
    elf1.game_ko,
    elf1.game_winmsg,
    elf1.game_jan_al,
    elf1.game_ken_al,
    elf1.game_pon_al,
    elf1.game_jan_dl,
    elf1.game_ken_dl,
    elf1.game_pon_dl,
    elf1.game_jan_ae,
    elf1.game_ken_ae,
    elf1.game_pon_ae,
    elf1.game_jan_de,
    elf1.game_ken_de,
    elf1.game_pon_de,
    elf1.combo1,
    elf1.combo2,
    elf1.combo3,
    elf1.extra_combo1_1,
    elf1.extra_combo1_2,
    elf1.extra_combo1_3,
    elf1.extra_combo1_4,
    elf1.extra_combo1_5,
    elf1.extra_combo1_6,
    elf1.extra_combo2_1,
    elf1.extra_combo2_2,
    elf1.extra_combo2_3,
    elf1.extra_combo2_4,
    elf1.extra_combo2_5,
    elf1.extra_combo2_6,
    elf1.extra_combo3_1,
    elf1.extra_combo3_2,
    elf1.extra_combo3_3,
    elf1.extra_combo3_4,
    elf1.extra_combo3_5,
    elf1.extra_combo3_6,
    elf1.game_jan_count,
    elf1.game_ken_count,
    elf1.game_pon_count,
    elf1.gold1,
    elf1.gold2,
    elf1.gold3,
    elf1.witchcraft1,
    elf1.witchcraft2,
    elf1.witchcraft3,
    elf1.strengthen1,
    elf1.strengthen2,
    elf1.strengthen3,
    elf1.embedded1_1,
    elf1.embedded1_2,
    elf1.embedded1_3,
    elf1.embedded1_4,
    elf1.embedded1_5,
    elf1.embedded1_6,
    elf1.embedded2_1,
    elf1.embedded2_2,
    elf1.embedded2_3,
    elf1.embedded2_4,
    elf1.embedded2_5,
    elf1.embedded2_6,
    elf1.embedded3_1,
    elf1.embedded3_2,
    elf1.embedded3_3,
    elf1.embedded3_4,
    elf1.embedded3_5,
    elf1.embedded3_6,
    elf1.rework,
    elf1.max_durability1,
    elf1.max_durability2,
    elf1.max_durability3,
    elf1.class_id,
    elf1.train_type_1,
    elf1.train_level_1,
    elf1.train_exp_1,
    elf1.train_type_2,
    elf1.train_level_2,
    elf1.train_exp_2,
    elf1.train_type_3,
    elf1.train_level_3,
    elf1.train_exp_3,
    elf1.to_bind1,
    elf1.to_bind2,
    elf1.to_bind3,
    elf1.ride_combo1,
    elf1.ride_star_level1,
    elf1.ride_point1,
    elf1.ride_combo2,
    elf1.ride_star_level2,
    elf1.ride_point2,
    elf1.ride_combo3,
    elf1.ride_star_level3,
    elf1.ride_point3
   FROM public.elf1
UNION ALL
 SELECT elf2.elf_id,
    elf2.player_id,
    elf2.template_id,
    elf2.name,
    elf2.level,
    elf2.exp,
    elf2.familiar,
    elf2.mood,
    elf2.energy,
    elf2.stone_a,
    elf2.stone_b,
    elf2.skill_id_1,
    elf2.skill_level_1,
    elf2.skill_exp_1,
    elf2.skill_id_2,
    elf2.skill_level_2,
    elf2.skill_exp_2,
    elf2.skill_id_3,
    elf2.skill_level_3,
    elf2.skill_exp_3,
    elf2.skill_id_4,
    elf2.skill_level_4,
    elf2.skill_exp_4,
    elf2.loc,
    elf2.item1,
    elf2.amount1,
    elf2.socket_amount1,
    elf2.item2,
    elf2.amount2,
    elf2.socket_amount2,
    elf2.item3,
    elf2.amount3,
    elf2.socket_amount3,
    elf2.work_type,
    elf2.work_id,
    elf2.work_event,
    elf2.work_count,
    elf2.face,
    elf2.type,
    elf2.skin,
    elf2.return_loc,
    elf2.return_grade,
    elf2.wall,
    elf2.ground,
    elf2.game_win,
    elf2.game_lose,
    elf2.game_ko,
    elf2.game_winmsg,
    elf2.game_jan_al,
    elf2.game_ken_al,
    elf2.game_pon_al,
    elf2.game_jan_dl,
    elf2.game_ken_dl,
    elf2.game_pon_dl,
    elf2.game_jan_ae,
    elf2.game_ken_ae,
    elf2.game_pon_ae,
    elf2.game_jan_de,
    elf2.game_ken_de,
    elf2.game_pon_de,
    elf2.combo1,
    elf2.combo2,
    elf2.combo3,
    elf2.extra_combo1_1,
    elf2.extra_combo1_2,
    elf2.extra_combo1_3,
    elf2.extra_combo1_4,
    elf2.extra_combo1_5,
    elf2.extra_combo1_6,
    elf2.extra_combo2_1,
    elf2.extra_combo2_2,
    elf2.extra_combo2_3,
    elf2.extra_combo2_4,
    elf2.extra_combo2_5,
    elf2.extra_combo2_6,
    elf2.extra_combo3_1,
    elf2.extra_combo3_2,
    elf2.extra_combo3_3,
    elf2.extra_combo3_4,
    elf2.extra_combo3_5,
    elf2.extra_combo3_6,
    elf2.game_jan_count,
    elf2.game_ken_count,
    elf2.game_pon_count,
    elf2.gold1,
    elf2.gold2,
    elf2.gold3,
    elf2.witchcraft1,
    elf2.witchcraft2,
    elf2.witchcraft3,
    elf2.strengthen1,
    elf2.strengthen2,
    elf2.strengthen3,
    elf2.embedded1_1,
    elf2.embedded1_2,
    elf2.embedded1_3,
    elf2.embedded1_4,
    elf2.embedded1_5,
    elf2.embedded1_6,
    elf2.embedded2_1,
    elf2.embedded2_2,
    elf2.embedded2_3,
    elf2.embedded2_4,
    elf2.embedded2_5,
    elf2.embedded2_6,
    elf2.embedded3_1,
    elf2.embedded3_2,
    elf2.embedded3_3,
    elf2.embedded3_4,
    elf2.embedded3_5,
    elf2.embedded3_6,
    elf2.rework,
    elf2.max_durability1,
    elf2.max_durability2,
    elf2.max_durability3,
    elf2.class_id,
    elf2.train_type_1,
    elf2.train_level_1,
    elf2.train_exp_1,
    elf2.train_type_2,
    elf2.train_level_2,
    elf2.train_exp_2,
    elf2.train_type_3,
    elf2.train_level_3,
    elf2.train_exp_3,
    elf2.to_bind1,
    elf2.to_bind2,
    elf2.to_bind3,
    elf2.ride_combo1,
    elf2.ride_star_level1,
    elf2.ride_point1,
    elf2.ride_combo2,
    elf2.ride_star_level2,
    elf2.ride_point2,
    elf2.ride_combo3,
    elf2.ride_star_level3,
    elf2.ride_point3
   FROM public.elf2;


ALTER TABLE public.elf OWNER TO postgres;

--
-- Name: elf_container1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.elf_container1 (
    id integer NOT NULL,
    item_id integer NOT NULL,
    durability integer NOT NULL,
    maker text DEFAULT ''::character varying,
    rank integer DEFAULT 0,
    identify smallint DEFAULT 1,
    magic smallint DEFAULT 0,
    embedded_amount integer DEFAULT 0,
    embedded_id1 integer DEFAULT '-1'::integer,
    embedded_id2 integer DEFAULT '-1'::integer,
    embedded_id3 integer DEFAULT '-1'::integer,
    embedded_id4 integer DEFAULT '-1'::integer,
    embedded_id5 integer DEFAULT '-1'::integer,
    embedded_id6 integer DEFAULT '-1'::integer,
    create_time integer DEFAULT 1,
    due_date integer DEFAULT 0,
    container_index integer DEFAULT '-1'::integer,
    combo_id integer DEFAULT 0,
    strengthen integer DEFAULT 0,
    cur_maxdurability integer DEFAULT 0,
    bind integer DEFAULT 0,
    elf_id integer NOT NULL,
    player_id integer NOT NULL,
    loc integer NOT NULL,
    lock_pwd text DEFAULT '*'::character varying,
    unlock_time integer DEFAULT 0,
    extra_combo_id1 integer DEFAULT 0,
    extra_combo_id2 integer DEFAULT 0,
    extra_combo_id3 integer DEFAULT 0,
    extra_combo_id4 integer DEFAULT 0,
    extra_combo_id5 integer DEFAULT 0,
    extra_combo_id6 integer DEFAULT 0,
    witchcraft integer DEFAULT 0,
    train_type integer DEFAULT 0,
    train_level integer DEFAULT 0,
    train_exp integer DEFAULT 0,
    ride_combo integer DEFAULT 0,
    ride_star_level integer DEFAULT 0,
    ride_point integer DEFAULT 0,
    awake_level integer DEFAULT 0,
    awake_potential integer DEFAULT 0,
    awake_addition integer DEFAULT 0,
    combo_rune_slot integer DEFAULT '-1'::integer,
    rune_combo_id1 integer DEFAULT 0,
    rune_combo_id2 integer DEFAULT 0,
    rune_combo_id3 integer DEFAULT 0,
    rune_combo_id4 integer DEFAULT 0,
    rune_combo_id5 integer DEFAULT 0
);


ALTER TABLE public.elf_container1 OWNER TO postgres;

--
-- Name: elf_container2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.elf_container2 (
    id integer NOT NULL,
    item_id integer NOT NULL,
    durability integer NOT NULL,
    maker text DEFAULT ''::character varying,
    rank integer DEFAULT 0,
    identify smallint DEFAULT 1,
    magic smallint DEFAULT 0,
    embedded_amount integer DEFAULT 0,
    embedded_id1 integer DEFAULT '-1'::integer,
    embedded_id2 integer DEFAULT '-1'::integer,
    embedded_id3 integer DEFAULT '-1'::integer,
    embedded_id4 integer DEFAULT '-1'::integer,
    embedded_id5 integer DEFAULT '-1'::integer,
    embedded_id6 integer DEFAULT '-1'::integer,
    create_time integer DEFAULT 1,
    due_date integer DEFAULT 0,
    container_index integer DEFAULT '-1'::integer,
    combo_id integer DEFAULT 0,
    strengthen integer DEFAULT 0,
    cur_maxdurability integer DEFAULT 0,
    bind integer DEFAULT 0,
    elf_id integer NOT NULL,
    player_id integer NOT NULL,
    loc integer NOT NULL,
    lock_pwd text DEFAULT '*'::character varying,
    unlock_time integer DEFAULT 0,
    extra_combo_id1 integer DEFAULT 0,
    extra_combo_id2 integer DEFAULT 0,
    extra_combo_id3 integer DEFAULT 0,
    extra_combo_id4 integer DEFAULT 0,
    extra_combo_id5 integer DEFAULT 0,
    extra_combo_id6 integer DEFAULT 0,
    witchcraft integer DEFAULT 0,
    train_type integer DEFAULT 0,
    train_level integer DEFAULT 0,
    train_exp integer DEFAULT 0,
    ride_combo integer DEFAULT 0,
    ride_star_level integer DEFAULT 0,
    ride_point integer DEFAULT 0,
    awake_level integer DEFAULT 0,
    awake_potential integer DEFAULT 0,
    awake_addition integer DEFAULT 0,
    combo_rune_slot integer DEFAULT '-1'::integer,
    rune_combo_id1 integer DEFAULT 0,
    rune_combo_id2 integer DEFAULT 0,
    rune_combo_id3 integer DEFAULT 0,
    rune_combo_id4 integer DEFAULT 0,
    rune_combo_id5 integer DEFAULT 0
);


ALTER TABLE public.elf_container2 OWNER TO postgres;

--
-- Name: elf_container; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.elf_container AS
 SELECT elf_container1.id,
    elf_container1.item_id,
    elf_container1.durability,
    elf_container1.maker,
    elf_container1.rank,
    elf_container1.identify,
    elf_container1.magic,
    elf_container1.embedded_amount,
    elf_container1.embedded_id1,
    elf_container1.embedded_id2,
    elf_container1.embedded_id3,
    elf_container1.embedded_id4,
    elf_container1.embedded_id5,
    elf_container1.embedded_id6,
    elf_container1.create_time,
    elf_container1.due_date,
    elf_container1.container_index,
    elf_container1.combo_id,
    elf_container1.strengthen,
    elf_container1.cur_maxdurability,
    elf_container1.bind,
    elf_container1.elf_id,
    elf_container1.player_id,
    elf_container1.loc,
    elf_container1.lock_pwd,
    elf_container1.unlock_time,
    elf_container1.extra_combo_id1,
    elf_container1.extra_combo_id2,
    elf_container1.extra_combo_id3,
    elf_container1.extra_combo_id4,
    elf_container1.extra_combo_id5,
    elf_container1.extra_combo_id6,
    elf_container1.witchcraft,
    elf_container1.train_type,
    elf_container1.train_level,
    elf_container1.train_exp,
    elf_container1.ride_combo,
    elf_container1.ride_star_level,
    elf_container1.ride_point
   FROM public.elf_container1
UNION ALL
 SELECT elf_container2.id,
    elf_container2.item_id,
    elf_container2.durability,
    elf_container2.maker,
    elf_container2.rank,
    elf_container2.identify,
    elf_container2.magic,
    elf_container2.embedded_amount,
    elf_container2.embedded_id1,
    elf_container2.embedded_id2,
    elf_container2.embedded_id3,
    elf_container2.embedded_id4,
    elf_container2.embedded_id5,
    elf_container2.embedded_id6,
    elf_container2.create_time,
    elf_container2.due_date,
    elf_container2.container_index,
    elf_container2.combo_id,
    elf_container2.strengthen,
    elf_container2.cur_maxdurability,
    elf_container2.bind,
    elf_container2.elf_id,
    elf_container2.player_id,
    elf_container2.loc,
    elf_container2.lock_pwd,
    elf_container2.unlock_time,
    elf_container2.extra_combo_id1,
    elf_container2.extra_combo_id2,
    elf_container2.extra_combo_id3,
    elf_container2.extra_combo_id4,
    elf_container2.extra_combo_id5,
    elf_container2.extra_combo_id6,
    elf_container2.witchcraft,
    elf_container2.train_type,
    elf_container2.train_level,
    elf_container2.train_exp,
    elf_container2.ride_combo,
    elf_container2.ride_star_level,
    elf_container2.ride_point
   FROM public.elf_container2;


ALTER TABLE public.elf_container OWNER TO postgres;

--
-- Name: elf_shortcut_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.elf_shortcut_menu (
    player_id integer NOT NULL,
    index_1 integer DEFAULT 0,
    index_2 integer DEFAULT 0,
    index_3 integer DEFAULT 0,
    index_4 integer DEFAULT 0,
    index_5 integer DEFAULT 0,
    dudate_4 integer DEFAULT 0,
    dudate_5 integer DEFAULT 0
);


ALTER TABLE public.elf_shortcut_menu OWNER TO postgres;

--
-- Name: elf_skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.elf_skills (
    player_id integer NOT NULL,
    exp_1 integer DEFAULT 0,
    exp_2 integer DEFAULT 0,
    exp_3 integer DEFAULT 0,
    point_1 integer DEFAULT 0,
    point_2 integer DEFAULT 0,
    point_3 integer DEFAULT 0,
    skill_1_1 integer DEFAULT 0,
    skill_1_2 integer DEFAULT 0,
    skill_1_3 integer DEFAULT 0,
    skill_1_4 integer DEFAULT 0,
    skill_1_5 integer DEFAULT 0,
    skill_2_1 integer DEFAULT 0,
    skill_2_2 integer DEFAULT 0,
    skill_2_3 integer DEFAULT 0,
    skill_2_4 integer DEFAULT 0,
    skill_2_5 integer DEFAULT 0,
    skill_3_1 integer DEFAULT 0,
    skill_3_2 integer DEFAULT 0,
    skill_3_3 integer DEFAULT 0,
    skill_3_4 integer DEFAULT 0,
    skill_3_5 integer DEFAULT 0
);


ALTER TABLE public.elf_skills OWNER TO postgres;

--
-- Name: elf_temple_team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.elf_temple_team (
    id integer NOT NULL,
    leader_id integer DEFAULT 0,
    members text,
    road_index integer DEFAULT 0,
    events text,
    stage integer DEFAULT 0
);


ALTER TABLE public.elf_temple_team OWNER TO postgres;

--
-- Name: elfinventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.elfinventory (
    id integer NOT NULL,
    item_id integer NOT NULL,
    durability integer NOT NULL,
    maker text DEFAULT ''::character varying,
    rank integer DEFAULT 0,
    identify smallint DEFAULT 1,
    magic smallint DEFAULT 0,
    embedded_amount integer DEFAULT 0,
    embedded_id1 integer DEFAULT '-1'::integer,
    embedded_id2 integer DEFAULT '-1'::integer,
    embedded_id3 integer DEFAULT '-1'::integer,
    embedded_id4 integer DEFAULT '-1'::integer,
    embedded_id5 integer DEFAULT '-1'::integer,
    embedded_id6 integer DEFAULT '-1'::integer,
    create_time integer DEFAULT 1,
    due_date integer DEFAULT 0,
    container_index integer DEFAULT '-1'::integer,
    combo_id integer DEFAULT 0,
    strengthen integer DEFAULT 0,
    cur_maxdurability integer DEFAULT 0,
    bind integer DEFAULT 0,
    player_id integer NOT NULL,
    loc integer NOT NULL,
    lock_pwd text DEFAULT '*'::character varying,
    unlock_time integer DEFAULT 0,
    extra_combo_id1 integer DEFAULT 0,
    extra_combo_id2 integer DEFAULT 0,
    extra_combo_id3 integer DEFAULT 0,
    extra_combo_id4 integer DEFAULT 0,
    extra_combo_id5 integer DEFAULT 0,
    extra_combo_id6 integer DEFAULT 0,
    witchcraft integer DEFAULT 0,
    train_type integer DEFAULT 0,
    train_level integer DEFAULT 0,
    train_exp integer DEFAULT 0,
    ride_combo integer DEFAULT 0,
    ride_star_level integer DEFAULT 0,
    ride_point integer DEFAULT 0,
    awake_level integer DEFAULT 0,
    awake_potential integer DEFAULT 0,
    awake_addition integer DEFAULT 0,
    combo_rune_slot integer DEFAULT '-1'::integer,
    rune_combo_id1 integer DEFAULT 0,
    rune_combo_id2 integer DEFAULT 0,
    rune_combo_id3 integer DEFAULT 0,
    rune_combo_id4 integer DEFAULT 0,
    rune_combo_id5 integer DEFAULT 0
);


ALTER TABLE public.elfinventory OWNER TO postgres;

--
-- Name: equipment1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipment1 (
    id integer NOT NULL,
    item_id integer NOT NULL,
    durability integer NOT NULL,
    maker text DEFAULT ''::character varying,
    rank integer DEFAULT 0,
    identify smallint DEFAULT 1,
    magic smallint DEFAULT 0,
    embedded_amount integer DEFAULT 0,
    embedded_id1 integer DEFAULT '-1'::integer,
    embedded_id2 integer DEFAULT '-1'::integer,
    embedded_id3 integer DEFAULT '-1'::integer,
    embedded_id4 integer DEFAULT '-1'::integer,
    embedded_id5 integer DEFAULT '-1'::integer,
    embedded_id6 integer DEFAULT '-1'::integer,
    create_time integer DEFAULT 1,
    due_date integer DEFAULT 0,
    container_index integer DEFAULT '-1'::integer,
    combo_id integer DEFAULT 0,
    strengthen integer DEFAULT 0,
    cur_maxdurability integer DEFAULT 0,
    bind integer DEFAULT 0,
    player_id integer NOT NULL,
    loc integer NOT NULL,
    lock_pwd text DEFAULT '*'::character varying,
    unlock_time integer DEFAULT 0,
    extra_combo_id1 integer DEFAULT 0,
    extra_combo_id2 integer DEFAULT 0,
    extra_combo_id3 integer DEFAULT 0,
    extra_combo_id4 integer DEFAULT 0,
    extra_combo_id5 integer DEFAULT 0,
    extra_combo_id6 integer DEFAULT 0,
    witchcraft integer DEFAULT 0,
    train_type integer DEFAULT 0,
    train_level integer DEFAULT 0,
    train_exp integer DEFAULT 0,
    ride_combo integer DEFAULT 0,
    ride_star_level integer DEFAULT 0,
    ride_point integer DEFAULT 0,
    awake_level integer DEFAULT 0,
    awake_potential integer DEFAULT 0,
    awake_addition integer DEFAULT 0,
    combo_rune_slot integer DEFAULT '-1'::integer,
    rune_combo_id1 integer DEFAULT 0,
    rune_combo_id2 integer DEFAULT 0,
    rune_combo_id3 integer DEFAULT 0,
    rune_combo_id4 integer DEFAULT 0,
    rune_combo_id5 integer DEFAULT 0
);


ALTER TABLE public.equipment1 OWNER TO postgres;

--
-- Name: equipment2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipment2 (
    id integer NOT NULL,
    item_id integer NOT NULL,
    durability integer NOT NULL,
    maker text DEFAULT ''::character varying,
    rank integer DEFAULT 0,
    identify smallint DEFAULT 1,
    magic smallint DEFAULT 0,
    embedded_amount integer DEFAULT 0,
    embedded_id1 integer DEFAULT '-1'::integer,
    embedded_id2 integer DEFAULT '-1'::integer,
    embedded_id3 integer DEFAULT '-1'::integer,
    embedded_id4 integer DEFAULT '-1'::integer,
    embedded_id5 integer DEFAULT '-1'::integer,
    embedded_id6 integer DEFAULT '-1'::integer,
    create_time integer DEFAULT 1,
    due_date integer DEFAULT 0,
    container_index integer DEFAULT '-1'::integer,
    combo_id integer DEFAULT 0,
    strengthen integer DEFAULT 0,
    cur_maxdurability integer DEFAULT 0,
    bind integer DEFAULT 0,
    player_id integer NOT NULL,
    loc integer NOT NULL,
    lock_pwd text DEFAULT '*'::character varying,
    unlock_time integer DEFAULT 0,
    extra_combo_id1 integer DEFAULT 0,
    extra_combo_id2 integer DEFAULT 0,
    extra_combo_id3 integer DEFAULT 0,
    extra_combo_id4 integer DEFAULT 0,
    extra_combo_id5 integer DEFAULT 0,
    extra_combo_id6 integer DEFAULT 0,
    witchcraft integer DEFAULT 0,
    train_type integer DEFAULT 0,
    train_level integer DEFAULT 0,
    train_exp integer DEFAULT 0,
    ride_combo integer DEFAULT 0,
    ride_star_level integer DEFAULT 0,
    ride_point integer DEFAULT 0,
    awake_level integer DEFAULT 0,
    awake_potential integer DEFAULT 0,
    awake_addition integer DEFAULT 0,
    combo_rune_slot integer DEFAULT '-1'::integer,
    rune_combo_id1 integer DEFAULT 0,
    rune_combo_id2 integer DEFAULT 0,
    rune_combo_id3 integer DEFAULT 0,
    rune_combo_id4 integer DEFAULT 0,
    rune_combo_id5 integer DEFAULT 0
);


ALTER TABLE public.equipment2 OWNER TO postgres;

--
-- Name: equipment; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.equipment AS
 SELECT equipment1.id,
    equipment1.item_id,
    equipment1.durability,
    equipment1.maker,
    equipment1.rank,
    equipment1.identify,
    equipment1.magic,
    equipment1.embedded_amount,
    equipment1.embedded_id1,
    equipment1.embedded_id2,
    equipment1.embedded_id3,
    equipment1.embedded_id4,
    equipment1.embedded_id5,
    equipment1.embedded_id6,
    equipment1.create_time,
    equipment1.due_date,
    equipment1.container_index,
    equipment1.combo_id,
    equipment1.strengthen,
    equipment1.cur_maxdurability,
    equipment1.bind,
    equipment1.player_id,
    equipment1.loc,
    equipment1.lock_pwd,
    equipment1.unlock_time,
    equipment1.extra_combo_id1,
    equipment1.extra_combo_id2,
    equipment1.extra_combo_id3,
    equipment1.extra_combo_id4,
    equipment1.extra_combo_id5,
    equipment1.extra_combo_id6,
    equipment1.witchcraft,
    equipment1.train_type,
    equipment1.train_level,
    equipment1.train_exp,
    equipment1.ride_combo,
    equipment1.ride_star_level,
    equipment1.ride_point
   FROM public.equipment1
UNION ALL
 SELECT equipment2.id,
    equipment2.item_id,
    equipment2.durability,
    equipment2.maker,
    equipment2.rank,
    equipment2.identify,
    equipment2.magic,
    equipment2.embedded_amount,
    equipment2.embedded_id1,
    equipment2.embedded_id2,
    equipment2.embedded_id3,
    equipment2.embedded_id4,
    equipment2.embedded_id5,
    equipment2.embedded_id6,
    equipment2.create_time,
    equipment2.due_date,
    equipment2.container_index,
    equipment2.combo_id,
    equipment2.strengthen,
    equipment2.cur_maxdurability,
    equipment2.bind,
    equipment2.player_id,
    equipment2.loc,
    equipment2.lock_pwd,
    equipment2.unlock_time,
    equipment2.extra_combo_id1,
    equipment2.extra_combo_id2,
    equipment2.extra_combo_id3,
    equipment2.extra_combo_id4,
    equipment2.extra_combo_id5,
    equipment2.extra_combo_id6,
    equipment2.witchcraft,
    equipment2.train_type,
    equipment2.train_level,
    equipment2.train_exp,
    equipment2.ride_combo,
    equipment2.ride_star_level,
    equipment2.ride_point
   FROM public.equipment2;


ALTER TABLE public.equipment OWNER TO postgres;

--
-- Name: family; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.family (
    id integer NOT NULL,
    name text,
    leader_id integer,
    lv smallint DEFAULT 1 NOT NULL,
    uniform integer DEFAULT '-1'::integer NOT NULL,
    flag integer DEFAULT '-1'::integer NOT NULL,
    delete_time integer DEFAULT 0 NOT NULL,
    recruit_message text DEFAULT ''::character varying NOT NULL,
    emblem integer DEFAULT '-1'::integer NOT NULL,
    info text DEFAULT ''::character varying NOT NULL,
    member_title text DEFAULT ''::character varying NOT NULL,
    leader_title text DEFAULT ''::character varying NOT NULL,
    cadre_title_2 text DEFAULT ''::character varying NOT NULL,
    cadre_title_3 text DEFAULT ''::character varying NOT NULL,
    cadre_title_4 text DEFAULT ''::character varying NOT NULL,
    cadre_title_5 text DEFAULT ''::character varying NOT NULL,
    cadre_title_6 text DEFAULT ''::character varying NOT NULL,
    cadre_title_7 text DEFAULT ''::character varying NOT NULL,
    cadre_title_8 text DEFAULT ''::character varying NOT NULL,
    exploit integer DEFAULT 0,
    exp integer DEFAULT 0,
    invite_privilege smallint DEFAULT 1 NOT NULL,
    kickout_privilege smallint DEFAULT 1 NOT NULL,
    setcadre_privilege smallint DEFAULT 1 NOT NULL,
    editinfo_privilege smallint DEFAULT 1 NOT NULL,
    setemblem smallint DEFAULT 1 NOT NULL,
    msgboard_privilege smallint DEFAULT 1 NOT NULL,
    channel_privilege smallint DEFAULT 143 NOT NULL,
    be_create_time integer DEFAULT 0 NOT NULL,
    comment_privilege integer DEFAULT 1,
    treasury integer DEFAULT 0,
    tax_rate integer DEFAULT 0,
    spell_point integer DEFAULT 0,
    elfking_tid integer DEFAULT 0,
    spell_privilege integer DEFAULT 1,
    house_open integer DEFAULT 0,
    family_flag bigint DEFAULT 0,
    storage01_privilege smallint DEFAULT 1,
    storage02_privilege smallint DEFAULT 1,
    storage03_privilege smallint DEFAULT 1,
    union_family_1 integer DEFAULT 0,
    union_family_2 integer DEFAULT 0,
    union_family_3 integer DEFAULT 0,
    recurit integer DEFAULT 0,
    fram_privilege integer DEFAULT 1,
    tree_privilege integer DEFAULT 1,
    tree_level integer DEFAULT 1,
    tree_exp integer DEFAULT 0,
    tree_energy integer DEFAULT 0,
    tree_refresh integer DEFAULT 0,
    wishing_well_id integer DEFAULT 0,
    wishing_well_create_time timestamp with time zone
);


ALTER TABLE public.family OWNER TO postgres;

--
-- Name: family_achievement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.family_achievement (
    family_id integer NOT NULL,
    achievement_type integer NOT NULL,
    point integer NOT NULL
);


ALTER TABLE public.family_achievement OWNER TO postgres;

--
-- Name: family_achievement_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.family_achievement_log (
    family_id integer NOT NULL,
    player_id integer NOT NULL,
    achievement_id integer NOT NULL,
    point integer NOT NULL,
    date integer NOT NULL,
    log_id integer NOT NULL
);


ALTER TABLE public.family_achievement_log OWNER TO postgres;

--
-- Name: family_achievement_rank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.family_achievement_rank (
    family_id integer NOT NULL,
    family_name text DEFAULT ''::character varying,
    update_time integer NOT NULL,
    total_point integer NOT NULL,
    monster_kill integer NOT NULL,
    festival_type integer NOT NULL,
    mission_type integer NOT NULL,
    lv01_instance_node integer NOT NULL,
    lv31_instance_node integer NOT NULL,
    lv46_instance_node integer NOT NULL,
    lv61_instance_node integer NOT NULL,
    lv76_instance_node integer NOT NULL,
    lv91_instance_node integer NOT NULL,
    family_boss integer NOT NULL,
    rare_monster integer NOT NULL,
    world_boss integer NOT NULL,
    activity integer NOT NULL,
    mission_chaslot integer NOT NULL,
    mission_elia integer NOT NULL,
    mission_gear integer NOT NULL,
    mission_arsalan integer NOT NULL,
    mission_bluewhale integer NOT NULL,
    mission_other integer NOT NULL,
    event_one integer DEFAULT 0 NOT NULL,
    event_two integer DEFAULT 0 NOT NULL,
    event_three integer DEFAULT 0 NOT NULL,
    event_four integer DEFAULT 0 NOT NULL,
    event_five integer DEFAULT 0 NOT NULL,
    mission_deep integer DEFAULT 0 NOT NULL,
    event_six integer DEFAULT 0
);


ALTER TABLE public.family_achievement_rank OWNER TO postgres;

--
-- Name: family_battle_championship; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.family_battle_championship (
    game_num integer NOT NULL,
    family_id integer NOT NULL,
    family_name text DEFAULT ''::character varying,
    rank integer NOT NULL,
    camp_type integer NOT NULL,
    execute_time integer DEFAULT 0,
    week_point integer DEFAULT 0,
    score integer DEFAULT '-1'::integer,
    city integer DEFAULT 1
);


ALTER TABLE public.family_battle_championship OWNER TO postgres;

--
-- Name: family_battle_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.family_battle_data (
    area_id integer NOT NULL,
    area_name text DEFAULT ''::character varying,
    family_id integer NOT NULL,
    week_type integer NOT NULL
);


ALTER TABLE public.family_battle_data OWNER TO postgres;

--
-- Name: family_battle_rank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.family_battle_rank (
    family_id integer NOT NULL,
    family_name text DEFAULT ''::character varying,
    update_time integer NOT NULL,
    total_point integer NOT NULL,
    monster_kill integer NOT NULL,
    festival_type integer NOT NULL,
    mission_type integer NOT NULL,
    lv01_instance_node integer NOT NULL,
    lv31_instance_node integer NOT NULL,
    lv46_instance_node integer NOT NULL,
    lv61_instance_node integer NOT NULL,
    lv76_instance_node integer NOT NULL,
    lv91_instance_node integer NOT NULL,
    family_boss integer NOT NULL,
    rare_monster integer NOT NULL,
    world_boss integer NOT NULL,
    activity integer NOT NULL,
    mission_chaslot integer NOT NULL,
    mission_elia integer NOT NULL,
    mission_gear integer NOT NULL,
    mission_arsalan integer NOT NULL,
    mission_bluewhale integer NOT NULL,
    mission_other integer NOT NULL,
    event_one integer DEFAULT 0 NOT NULL,
    event_two integer DEFAULT 0 NOT NULL,
    event_three integer DEFAULT 0 NOT NULL,
    event_four integer DEFAULT 0 NOT NULL,
    event_five integer DEFAULT 0 NOT NULL,
    mission_deep integer DEFAULT 0 NOT NULL,
    event_six integer DEFAULT 0
);


ALTER TABLE public.family_battle_rank OWNER TO postgres;

--
-- Name: family_battle_registration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.family_battle_registration (
    family_id integer NOT NULL,
    city integer DEFAULT 1
);


ALTER TABLE public.family_battle_registration OWNER TO postgres;

--
-- Name: family_cadre_members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.family_cadre_members (
    family_id integer NOT NULL,
    player_id integer NOT NULL,
    rank smallint NOT NULL,
    title text
);


ALTER TABLE public.family_cadre_members OWNER TO postgres;

--
-- Name: family_crop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.family_crop (
    id integer NOT NULL,
    family_id integer NOT NULL,
    loc integer NOT NULL,
    grower text DEFAULT ''::character varying,
    crop_tid integer NOT NULL,
    after_time integer DEFAULT 0,
    energy integer DEFAULT 1000000,
    record_time integer NOT NULL
);


ALTER TABLE public.family_crop OWNER TO postgres;

--
-- Name: family_crop_enchants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.family_crop_enchants (
    crop_id integer NOT NULL,
    effect_id integer NOT NULL,
    rest_time integer NOT NULL
);


ALTER TABLE public.family_crop_enchants OWNER TO postgres;

--
-- Name: family_crop_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.family_crop_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.family_crop_id_seq OWNER TO postgres;

--
-- Name: family_crop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.family_crop_id_seq OWNED BY public.family_crop.id;


--
-- Name: family_farm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.family_farm (
    family_id integer NOT NULL,
    loc integer NOT NULL,
    hire_time integer NOT NULL
);


ALTER TABLE public.family_farm OWNER TO postgres;

--
-- Name: family_msgboard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.family_msgboard (
    family_id integer NOT NULL,
    message_id integer NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    player_name text NOT NULL,
    create_date integer NOT NULL
);


ALTER TABLE public.family_msgboard OWNER TO postgres;

--
-- Name: family_storage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.family_storage (
    id integer NOT NULL,
    item_id integer NOT NULL,
    durability integer NOT NULL,
    maker text DEFAULT ''::character varying,
    rank integer DEFAULT 0,
    identify smallint DEFAULT 1,
    magic smallint DEFAULT 0,
    embedded_amount integer DEFAULT 0,
    embedded_id1 integer DEFAULT '-1'::integer,
    embedded_id2 integer DEFAULT '-1'::integer,
    embedded_id3 integer DEFAULT '-1'::integer,
    embedded_id4 integer DEFAULT '-1'::integer,
    embedded_id5 integer DEFAULT '-1'::integer,
    embedded_id6 integer DEFAULT '-1'::integer,
    loc smallint NOT NULL,
    create_time integer DEFAULT 1,
    due_date integer DEFAULT 0,
    combo_id integer DEFAULT 0,
    strengthen integer DEFAULT 0,
    cur_maxdurability integer DEFAULT 0,
    bind integer DEFAULT 0,
    lock_pwd text DEFAULT '*'::character varying,
    unlock_time integer DEFAULT 0,
    family_id integer DEFAULT 0,
    container_index smallint NOT NULL,
    extra_combo_id1 integer DEFAULT 0,
    extra_combo_id2 integer DEFAULT 0,
    extra_combo_id3 integer DEFAULT 0,
    extra_combo_id4 integer DEFAULT 0,
    extra_combo_id5 integer DEFAULT 0,
    extra_combo_id6 integer DEFAULT 0,
    witchcraft integer DEFAULT 0,
    train_type integer DEFAULT 0,
    train_level integer DEFAULT 0,
    train_exp integer DEFAULT 0,
    ride_combo integer DEFAULT 0,
    ride_star_level integer DEFAULT 0,
    ride_point integer DEFAULT 0,
    awake_level integer DEFAULT 0,
    awake_potential integer DEFAULT 0,
    awake_addition integer DEFAULT 0,
    combo_rune_slot integer DEFAULT '-1'::integer,
    rune_combo_id1 integer DEFAULT 0,
    rune_combo_id2 integer DEFAULT 0,
    rune_combo_id3 integer DEFAULT 0,
    rune_combo_id4 integer DEFAULT 0,
    rune_combo_id5 integer DEFAULT 0
);


ALTER TABLE public.family_storage OWNER TO postgres;

--
-- Name: family_storage_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.family_storage_log (
    family_id integer NOT NULL,
    log_type smallint NOT NULL,
    log text DEFAULT ''::character varying NOT NULL,
    log_time integer NOT NULL
);


ALTER TABLE public.family_storage_log OWNER TO postgres;

--
-- Name: family_tree; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.family_tree (
    family_id integer NOT NULL,
    finish_tree_id integer NOT NULL
);


ALTER TABLE public.family_tree OWNER TO postgres;

--
-- Name: fightking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fightking (
    player_id integer DEFAULT 0 NOT NULL,
    gold bigint DEFAULT 0
);


ALTER TABLE public.fightking OWNER TO postgres;

--
-- Name: final_mission_state1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.final_mission_state1 (
    player_id integer NOT NULL,
    index integer NOT NULL,
    state integer
);


ALTER TABLE public.final_mission_state1 OWNER TO postgres;

--
-- Name: final_mission_state2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.final_mission_state2 (
    player_id integer NOT NULL,
    index integer NOT NULL,
    state integer
);


ALTER TABLE public.final_mission_state2 OWNER TO postgres;

--
-- Name: final_mission_state_v2; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.final_mission_state_v2 AS
 SELECT final_mission_state1.player_id,
    final_mission_state1.index,
    final_mission_state1.state
   FROM public.final_mission_state1
UNION ALL
 SELECT final_mission_state2.player_id,
    final_mission_state2.index,
    final_mission_state2.state
   FROM public.final_mission_state2;


ALTER TABLE public.final_mission_state_v2 OWNER TO postgres;

--
-- Name: friends; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.friends (
    player_id integer NOT NULL,
    friend_id integer NOT NULL,
    friend_type integer,
    hello integer DEFAULT 0
);


ALTER TABLE public.friends OWNER TO postgres;

--
-- Name: global_variables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.global_variables (
    id integer NOT NULL,
    value integer DEFAULT 0
);


ALTER TABLE public.global_variables OWNER TO postgres;

--
-- Name: gold_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gold_log (
    date integer NOT NULL,
    increase bigint DEFAULT 0,
    decrease bigint DEFAULT 0,
    range1 bigint DEFAULT 0,
    range2 bigint DEFAULT 0,
    range3 bigint DEFAULT 0,
    range4 bigint DEFAULT 0,
    range5 bigint DEFAULT 0,
    range6 bigint DEFAULT 0,
    range7 bigint DEFAULT 0,
    range8 bigint DEFAULT 0,
    range9 bigint DEFAULT 0,
    range10 bigint DEFAULT 0
);


ALTER TABLE public.gold_log OWNER TO postgres;

--
-- Name: illplugininfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.illplugininfo (
    accountname character varying(32) NOT NULL,
    modulename character varying(260),
    exepathinfo character varying(260),
    servername character varying(32),
    clientversion character varying(20),
    playerhostname character varying(128),
    playerip character varying(20),
    worldid integer,
    playername character varying(32),
    datetime integer,
    playernetaddr character varying(24),
    windowsversion character varying(32)
);


ALTER TABLE public.illplugininfo OWNER TO postgres;

--
-- Name: init_errlog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.init_errlog (
    time_stamp integer NOT NULL,
    start_time character varying(32) NOT NULL,
    message text NOT NULL
);


ALTER TABLE public.init_errlog OWNER TO postgres;

--
-- Name: inventory1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory1 (
    id integer NOT NULL,
    item_id integer NOT NULL,
    durability integer NOT NULL,
    maker text DEFAULT ''::character varying,
    rank integer DEFAULT 0,
    identify smallint DEFAULT 1,
    magic smallint DEFAULT 0,
    embedded_amount integer DEFAULT 0,
    embedded_id1 integer DEFAULT '-1'::integer,
    embedded_id2 integer DEFAULT '-1'::integer,
    embedded_id3 integer DEFAULT '-1'::integer,
    embedded_id4 integer DEFAULT '-1'::integer,
    embedded_id5 integer DEFAULT '-1'::integer,
    embedded_id6 integer DEFAULT '-1'::integer,
    create_time integer DEFAULT 1,
    due_date integer DEFAULT 0,
    container_index integer DEFAULT '-1'::integer,
    combo_id integer DEFAULT 0,
    strengthen integer DEFAULT 0,
    cur_maxdurability integer DEFAULT 0,
    bind integer DEFAULT 0,
    player_id integer NOT NULL,
    loc integer NOT NULL,
    lock_pwd text DEFAULT '*'::character varying,
    unlock_time integer DEFAULT 0,
    extra_combo_id1 integer DEFAULT 0,
    extra_combo_id2 integer DEFAULT 0,
    extra_combo_id3 integer DEFAULT 0,
    extra_combo_id4 integer DEFAULT 0,
    extra_combo_id5 integer DEFAULT 0,
    extra_combo_id6 integer DEFAULT 0,
    witchcraft integer DEFAULT 0,
    train_type integer DEFAULT 0,
    train_level integer DEFAULT 0,
    train_exp integer DEFAULT 0,
    ride_combo integer DEFAULT 0,
    ride_star_level integer DEFAULT 0,
    ride_point integer DEFAULT 0,
    awake_level integer DEFAULT 0,
    awake_potential integer DEFAULT 0,
    awake_addition integer DEFAULT 0,
    combo_rune_slot integer DEFAULT '-1'::integer,
    rune_combo_id1 integer DEFAULT 0,
    rune_combo_id2 integer DEFAULT 0,
    rune_combo_id3 integer DEFAULT 0,
    rune_combo_id4 integer DEFAULT 0,
    rune_combo_id5 integer DEFAULT 0
);


ALTER TABLE public.inventory1 OWNER TO postgres;

--
-- Name: inventory2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory2 (
    id integer NOT NULL,
    item_id integer NOT NULL,
    durability integer NOT NULL,
    maker text DEFAULT ''::character varying,
    rank integer DEFAULT 0,
    identify smallint DEFAULT 1,
    magic smallint DEFAULT 0,
    embedded_amount integer DEFAULT 0,
    embedded_id1 integer DEFAULT '-1'::integer,
    embedded_id2 integer DEFAULT '-1'::integer,
    embedded_id3 integer DEFAULT '-1'::integer,
    embedded_id4 integer DEFAULT '-1'::integer,
    embedded_id5 integer DEFAULT '-1'::integer,
    embedded_id6 integer DEFAULT '-1'::integer,
    create_time integer DEFAULT 1,
    due_date integer DEFAULT 0,
    container_index integer DEFAULT '-1'::integer,
    combo_id integer DEFAULT 0,
    strengthen integer DEFAULT 0,
    cur_maxdurability integer DEFAULT 0,
    bind integer DEFAULT 0,
    player_id integer NOT NULL,
    loc integer NOT NULL,
    lock_pwd text DEFAULT '*'::character varying,
    unlock_time integer DEFAULT 0,
    extra_combo_id1 integer DEFAULT 0,
    extra_combo_id2 integer DEFAULT 0,
    extra_combo_id3 integer DEFAULT 0,
    extra_combo_id4 integer DEFAULT 0,
    extra_combo_id5 integer DEFAULT 0,
    extra_combo_id6 integer DEFAULT 0,
    witchcraft integer DEFAULT 0,
    train_type integer DEFAULT 0,
    train_level integer DEFAULT 0,
    train_exp integer DEFAULT 0,
    ride_combo integer DEFAULT 0,
    ride_star_level integer DEFAULT 0,
    ride_point integer DEFAULT 0,
    awake_level integer DEFAULT 0,
    awake_potential integer DEFAULT 0,
    awake_addition integer DEFAULT 0,
    combo_rune_slot integer DEFAULT '-1'::integer,
    rune_combo_id1 integer DEFAULT 0,
    rune_combo_id2 integer DEFAULT 0,
    rune_combo_id3 integer DEFAULT 0,
    rune_combo_id4 integer DEFAULT 0,
    rune_combo_id5 integer DEFAULT 0
);


ALTER TABLE public.inventory2 OWNER TO postgres;

--
-- Name: inventory; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.inventory AS
 SELECT inventory1.id,
    inventory1.item_id,
    inventory1.durability,
    inventory1.maker,
    inventory1.rank,
    inventory1.identify,
    inventory1.magic,
    inventory1.embedded_amount,
    inventory1.embedded_id1,
    inventory1.embedded_id2,
    inventory1.embedded_id3,
    inventory1.embedded_id4,
    inventory1.embedded_id5,
    inventory1.embedded_id6,
    inventory1.create_time,
    inventory1.due_date,
    inventory1.container_index,
    inventory1.combo_id,
    inventory1.strengthen,
    inventory1.cur_maxdurability,
    inventory1.bind,
    inventory1.player_id,
    inventory1.loc,
    inventory1.lock_pwd,
    inventory1.unlock_time,
    inventory1.extra_combo_id1,
    inventory1.extra_combo_id2,
    inventory1.extra_combo_id3,
    inventory1.extra_combo_id4,
    inventory1.extra_combo_id5,
    inventory1.extra_combo_id6,
    inventory1.witchcraft,
    inventory1.train_type,
    inventory1.train_level,
    inventory1.train_exp,
    inventory1.ride_combo,
    inventory1.ride_star_level,
    inventory1.ride_point
   FROM public.inventory1
UNION ALL
 SELECT inventory2.id,
    inventory2.item_id,
    inventory2.durability,
    inventory2.maker,
    inventory2.rank,
    inventory2.identify,
    inventory2.magic,
    inventory2.embedded_amount,
    inventory2.embedded_id1,
    inventory2.embedded_id2,
    inventory2.embedded_id3,
    inventory2.embedded_id4,
    inventory2.embedded_id5,
    inventory2.embedded_id6,
    inventory2.create_time,
    inventory2.due_date,
    inventory2.container_index,
    inventory2.combo_id,
    inventory2.strengthen,
    inventory2.cur_maxdurability,
    inventory2.bind,
    inventory2.player_id,
    inventory2.loc,
    inventory2.lock_pwd,
    inventory2.unlock_time,
    inventory2.extra_combo_id1,
    inventory2.extra_combo_id2,
    inventory2.extra_combo_id3,
    inventory2.extra_combo_id4,
    inventory2.extra_combo_id5,
    inventory2.extra_combo_id6,
    inventory2.witchcraft,
    inventory2.train_type,
    inventory2.train_level,
    inventory2.train_exp,
    inventory2.ride_combo,
    inventory2.ride_star_level,
    inventory2.ride_point
   FROM public.inventory2;


ALTER TABLE public.inventory OWNER TO postgres;

--
-- Name: isle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.isle (
    isle_id integer NOT NULL,
    name text NOT NULL,
    durability integer NOT NULL,
    time_record integer NOT NULL,
    level integer DEFAULT 0,
    exp integer DEFAULT 0,
    style integer DEFAULT 0,
    create_date text NOT NULL,
    visits integer DEFAULT 0,
    grade integer DEFAULT 0,
    bulletin text DEFAULT ''::character varying,
    equip_cd integer DEFAULT 0,
    change_name integer DEFAULT 0
);


ALTER TABLE public.isle OWNER TO postgres;

--
-- Name: isle_achievement_rank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.isle_achievement_rank (
    isle_id integer NOT NULL,
    isle_name text DEFAULT ''::character varying,
    isle_lv integer NOT NULL,
    visits integer DEFAULT 0,
    total_visits integer DEFAULT 0,
    grade integer DEFAULT 0,
    total_grade integer DEFAULT 0
);


ALTER TABLE public.isle_achievement_rank OWNER TO postgres;

--
-- Name: isle_altar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.isle_altar (
    isle_id integer NOT NULL,
    elf_id integer NOT NULL,
    time_limit integer DEFAULT 0
);


ALTER TABLE public.isle_altar OWNER TO postgres;

--
-- Name: isle_blacklist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.isle_blacklist (
    isle_id integer NOT NULL,
    block_id integer NOT NULL,
    block_name text NOT NULL,
    block_time integer NOT NULL
);


ALTER TABLE public.isle_blacklist OWNER TO postgres;

--
-- Name: isle_crop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.isle_crop (
    id integer NOT NULL,
    isle_id integer NOT NULL,
    category integer NOT NULL,
    loc integer NOT NULL,
    grower text DEFAULT ''::character varying,
    crop_tid integer NOT NULL,
    after_time integer DEFAULT 0,
    energy integer DEFAULT 1000000,
    record_time integer NOT NULL
);


ALTER TABLE public.isle_crop OWNER TO postgres;

--
-- Name: isle_crop_enchants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.isle_crop_enchants (
    crop_id integer NOT NULL,
    effect_id integer NOT NULL,
    rest_time integer NOT NULL
);


ALTER TABLE public.isle_crop_enchants OWNER TO postgres;

--
-- Name: isle_crop_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.isle_crop_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.isle_crop_id_seq OWNER TO postgres;

--
-- Name: isle_crop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.isle_crop_id_seq OWNED BY public.isle_crop.id;


--
-- Name: isle_elf_works; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.isle_elf_works (
    isle_id integer NOT NULL,
    category integer NOT NULL,
    elf_1 integer NOT NULL,
    elf_2 integer NOT NULL,
    elf_3 integer NOT NULL,
    elf_4 integer NOT NULL,
    elf_5 integer NOT NULL,
    end_time integer NOT NULL
);


ALTER TABLE public.isle_elf_works OWNER TO postgres;

--
-- Name: isle_equipment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.isle_equipment (
    isle_id integer NOT NULL,
    loc_id integer NOT NULL,
    equipment_id integer NOT NULL,
    param integer NOT NULL
);


ALTER TABLE public.isle_equipment OWNER TO postgres;

--
-- Name: isle_farm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.isle_farm (
    isle_id integer NOT NULL,
    category integer NOT NULL,
    loc integer NOT NULL,
    state integer NOT NULL,
    param integer NOT NULL
);


ALTER TABLE public.isle_farm OWNER TO postgres;

--
-- Name: isle_record; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.isle_record (
    id integer NOT NULL,
    isle_id integer NOT NULL,
    visitor_id integer NOT NULL,
    name text NOT NULL,
    enter_time integer NOT NULL,
    leave_time integer NOT NULL,
    kill_count integer NOT NULL,
    kill_score integer NOT NULL,
    repair_count integer NOT NULL,
    repair_score integer NOT NULL,
    opened integer DEFAULT 0,
    divine_time integer DEFAULT 0,
    divine_buf_id integer DEFAULT 0,
    fish_count integer DEFAULT 0,
    fish_score integer DEFAULT 0,
    feed_fish integer DEFAULT 0,
    feed_fish_score integer DEFAULT 0
);


ALTER TABLE public.isle_record OWNER TO postgres;

--
-- Name: isle_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.isle_record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.isle_record_id_seq OWNER TO postgres;

--
-- Name: isle_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.isle_record_id_seq OWNED BY public.isle_record.id;


--
-- Name: isle_statue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.isle_statue (
    isle_id integer NOT NULL,
    monster_id integer NOT NULL,
    color integer DEFAULT 0
);


ALTER TABLE public.isle_statue OWNER TO postgres;

--
-- Name: isle_storage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.isle_storage (
    id integer NOT NULL,
    item_id integer NOT NULL,
    durability integer NOT NULL,
    maker text DEFAULT ''::character varying,
    rank integer DEFAULT 0,
    identify smallint DEFAULT 1,
    magic smallint DEFAULT 0,
    embedded_amount integer DEFAULT 0,
    embedded_id1 integer DEFAULT '-1'::integer,
    embedded_id2 integer DEFAULT '-1'::integer,
    embedded_id3 integer DEFAULT '-1'::integer,
    embedded_id4 integer DEFAULT '-1'::integer,
    embedded_id5 integer DEFAULT '-1'::integer,
    embedded_id6 integer DEFAULT '-1'::integer,
    create_time integer DEFAULT 1,
    due_date integer DEFAULT 0,
    container_index integer DEFAULT '-1'::integer,
    combo_id integer DEFAULT 0,
    strengthen integer DEFAULT 0,
    cur_maxdurability integer DEFAULT 0,
    bind integer DEFAULT 0,
    player_id integer NOT NULL,
    loc integer NOT NULL,
    lock_pwd text DEFAULT '*'::character varying,
    unlock_time integer DEFAULT 0,
    extra_combo_id1 integer DEFAULT 0,
    extra_combo_id2 integer DEFAULT 0,
    extra_combo_id3 integer DEFAULT 0,
    extra_combo_id4 integer DEFAULT 0,
    extra_combo_id5 integer DEFAULT 0,
    extra_combo_id6 integer DEFAULT 0,
    witchcraft integer DEFAULT 0,
    train_type integer DEFAULT 0,
    train_level integer DEFAULT 0,
    train_exp integer DEFAULT 0,
    ride_combo integer DEFAULT 0,
    ride_star_level integer DEFAULT 0,
    ride_point integer DEFAULT 0,
    awake_level integer DEFAULT 0,
    awake_potential integer DEFAULT 0,
    awake_addition integer DEFAULT 0,
    combo_rune_slot integer DEFAULT '-1'::integer,
    rune_combo_id1 integer DEFAULT 0,
    rune_combo_id2 integer DEFAULT 0,
    rune_combo_id3 integer DEFAULT 0,
    rune_combo_id4 integer DEFAULT 0,
    rune_combo_id5 integer DEFAULT 0
);


ALTER TABLE public.isle_storage OWNER TO postgres;

--
-- Name: item_exchange_stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_exchange_stock (
    account_id integer DEFAULT 0,
    exchange_id integer DEFAULT 0,
    in_stock integer DEFAULT 0
);


ALTER TABLE public.item_exchange_stock OWNER TO postgres;

--
-- Name: lover; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lover (
    id integer NOT NULL,
    coin integer DEFAULT 0 NOT NULL,
    point integer DEFAULT 0 NOT NULL,
    create_time integer NOT NULL,
    update_coin_time integer DEFAULT 0 NOT NULL,
    message text DEFAULT ''::character varying NOT NULL,
    is_married integer DEFAULT 0,
    mood integer DEFAULT 0,
    love_challenge1 integer DEFAULT 0,
    love_challenge2 integer DEFAULT 0
);


ALTER TABLE public.lover OWNER TO postgres;

--
-- Name: mailitem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mailitem (
    id integer NOT NULL,
    item_id integer NOT NULL,
    durability integer NOT NULL,
    maker text DEFAULT ''::character varying,
    rank integer DEFAULT 0,
    identify smallint DEFAULT 1,
    magic smallint DEFAULT 0,
    embedded_amount integer DEFAULT 0,
    embedded_id1 integer DEFAULT '-1'::integer,
    embedded_id2 integer DEFAULT '-1'::integer,
    embedded_id3 integer DEFAULT '-1'::integer,
    embedded_id4 integer DEFAULT '-1'::integer,
    embedded_id5 integer DEFAULT '-1'::integer,
    embedded_id6 integer DEFAULT '-1'::integer,
    create_time integer DEFAULT 1,
    due_date integer DEFAULT 0,
    container_index integer DEFAULT '-1'::integer,
    combo_id integer DEFAULT 0,
    strengthen integer DEFAULT 0,
    cur_maxdurability integer DEFAULT 0,
    bind integer DEFAULT 0,
    player_id integer NOT NULL,
    mail_id integer NOT NULL,
    lock_pwd text DEFAULT '*'::character varying,
    unlock_time integer DEFAULT 0,
    extra_combo_id1 integer DEFAULT 0,
    extra_combo_id2 integer DEFAULT 0,
    extra_combo_id3 integer DEFAULT 0,
    extra_combo_id4 integer DEFAULT 0,
    extra_combo_id5 integer DEFAULT 0,
    extra_combo_id6 integer DEFAULT 0,
    witchcraft integer DEFAULT 0,
    train_type integer DEFAULT 0,
    train_level integer DEFAULT 0,
    train_exp integer DEFAULT 0,
    ride_combo integer DEFAULT 0,
    ride_star_level integer DEFAULT 0,
    ride_point integer DEFAULT 0,
    awake_level integer DEFAULT 0,
    awake_potential integer DEFAULT 0,
    awake_addition integer DEFAULT 0,
    combo_rune_slot integer DEFAULT '-1'::integer,
    rune_combo_id1 integer DEFAULT 0,
    rune_combo_id2 integer DEFAULT 0,
    rune_combo_id3 integer DEFAULT 0,
    rune_combo_id4 integer DEFAULT 0,
    rune_combo_id5 integer DEFAULT 0
);


ALTER TABLE public.mailitem OWNER TO postgres;

--
-- Name: mentorship; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mentorship (
    player_id integer NOT NULL,
    mentor_rank integer DEFAULT 0,
    mentor_point integer DEFAULT 0,
    daily_challenge integer DEFAULT 0,
    my_mentor_id integer DEFAULT 0,
    etc_flags integer DEFAULT 0
);


ALTER TABLE public.mentorship OWNER TO postgres;

--
-- Name: message_board; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.message_board (
    message_id integer NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    player_name text NOT NULL,
    create_date integer NOT NULL
);


ALTER TABLE public.message_board OWNER TO postgres;

--
-- Name: midnight_limit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.midnight_limit (
    player_id integer NOT NULL,
    function_type integer NOT NULL,
    due_date integer DEFAULT 0
);


ALTER TABLE public.midnight_limit OWNER TO postgres;

--
-- Name: new_shortcut_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.new_shortcut_menu (
    player_id integer NOT NULL,
    index1 integer DEFAULT '-1'::integer,
    index2 integer DEFAULT '-1'::integer,
    index3 integer DEFAULT '-1'::integer,
    index4 integer DEFAULT '-1'::integer,
    index5 integer DEFAULT '-1'::integer,
    index6 integer DEFAULT '-1'::integer,
    index7 integer DEFAULT '-1'::integer,
    index8 integer DEFAULT '-1'::integer,
    index9 integer DEFAULT '-1'::integer,
    index10 integer DEFAULT '-1'::integer,
    index11 integer DEFAULT '-1'::integer,
    index12 integer DEFAULT '-1'::integer,
    index13 integer DEFAULT '-1'::integer,
    index14 integer DEFAULT '-1'::integer,
    index15 integer DEFAULT '-1'::integer,
    index16 integer DEFAULT '-1'::integer,
    index17 integer DEFAULT '-1'::integer,
    index18 integer DEFAULT '-1'::integer,
    index19 integer DEFAULT '-1'::integer,
    index20 integer DEFAULT '-1'::integer,
    index21 integer DEFAULT '-1'::integer,
    index22 integer DEFAULT '-1'::integer,
    index23 integer DEFAULT '-1'::integer,
    index24 integer DEFAULT '-1'::integer
);


ALTER TABLE public.new_shortcut_menu OWNER TO postgres;

--
-- Name: old_player_enchants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.old_player_enchants (
    player_id integer,
    effect_id integer,
    caster_id integer,
    rest_time integer,
    factor integer,
    counter integer,
    note text,
    stack_count integer
);


ALTER TABLE public.old_player_enchants OWNER TO postgres;

--
-- Name: personal_mission_states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_mission_states (
    id integer NOT NULL,
    index bigint NOT NULL,
    state integer
);


ALTER TABLE public.personal_mission_states OWNER TO postgres;

--
-- Name: player_achievement_rank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_achievement_rank (
    player_id integer NOT NULL,
    player_name text DEFAULT ''::character varying,
    player_lv integer NOT NULL,
    player_class integer NOT NULL,
    update_time integer NOT NULL,
    total_point integer NOT NULL,
    monster_kill integer NOT NULL,
    festival_type integer NOT NULL,
    mission_type integer NOT NULL,
    lv01_instance_node integer NOT NULL,
    lv31_instance_node integer NOT NULL,
    lv46_instance_node integer NOT NULL,
    lv61_instance_node integer NOT NULL,
    lv76_instance_node integer NOT NULL,
    lv91_instance_node integer NOT NULL,
    family_boss integer NOT NULL,
    rare_monster integer NOT NULL,
    world_boss integer NOT NULL,
    activity integer NOT NULL,
    mission_chaslot integer NOT NULL,
    mission_elia integer NOT NULL,
    mission_gear integer NOT NULL,
    mission_arsalan integer NOT NULL,
    mission_bluewhale integer NOT NULL,
    mission_other integer NOT NULL,
    event_one integer DEFAULT 0 NOT NULL,
    event_two integer DEFAULT 0 NOT NULL,
    event_three integer DEFAULT 0 NOT NULL,
    event_four integer DEFAULT 0 NOT NULL,
    event_five integer DEFAULT 0 NOT NULL,
    mission_deep integer DEFAULT 0 NOT NULL,
    guess_point integer DEFAULT 0,
    history_guess_point integer DEFAULT 0,
    guess_answers integer DEFAULT 0,
    history_guess_answers integer DEFAULT 0,
    gladiator_win_count integer DEFAULT 0,
    gladiator_lose_count integer DEFAULT 0,
    gladiator_win_rate integer DEFAULT 0,
    gladiator_ko_count integer DEFAULT 0,
    event_six integer DEFAULT 0,
    anecdotes_chaslot integer DEFAULT 0,
    anecdotes_elia integer DEFAULT 0,
    anecdotes_gear integer DEFAULT 0,
    anecdotes_arsalan integer DEFAULT 0,
    anecdotes_bluewhale integer DEFAULT 0,
    anecdotes_deep integer DEFAULT 0,
    anecdotes_other integer DEFAULT 0,
    rebirth_count integer DEFAULT 0
);


ALTER TABLE public.player_achievement_rank OWNER TO postgres;

--
-- Name: player_appellation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_appellation (
    player_id integer NOT NULL,
    appellation_id integer NOT NULL,
    create_time integer DEFAULT 0
);


ALTER TABLE public.player_appellation OWNER TO postgres;

--
-- Name: player_characters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_characters (
    id integer NOT NULL,
    given_name text,
    node_id integer DEFAULT 5,
    x double precision,
    y double precision,
    z double precision,
    face_dir double precision,
    class_id integer,
    race_id integer,
    gender_id integer,
    hair integer,
    face integer DEFAULT 0,
    hair_color integer DEFAULT 0,
    skin_color integer DEFAULT 1,
    level integer,
    exp bigint DEFAULT 0,
    skill_point integer DEFAULT 0,
    hp integer DEFAULT 0,
    max_hp integer DEFAULT 0,
    mp integer DEFAULT 0,
    max_mp integer DEFAULT 0,
    combo_point integer DEFAULT 0,
    gold bigint DEFAULT 0,
    flags character varying DEFAULT ''::character varying,
    quit integer DEFAULT 1,
    account_id integer,
    account_name text,
    privilege integer,
    family_id integer DEFAULT 0,
    revive_area_id integer,
    expbonus_gettime integer DEFAULT 0,
    last_saving_time integer DEFAULT 0,
    current_level_time integer DEFAULT 0,
    channel_limit integer DEFAULT 0,
    login_time_limit timestamp without time zone,
    create_time timestamp without time zone DEFAULT now(),
    deleted_time integer DEFAULT 0,
    reputation integer DEFAULT 0,
    expand_storage_cnt integer DEFAULT 0,
    last_normal_area_id integer DEFAULT 0,
    note text,
    present_exploit integer DEFAULT 0,
    total_exploit integer DEFAULT 0,
    rank integer DEFAULT 0,
    bank_duedate_1 integer DEFAULT 0,
    bank_duedate_2 integer DEFAULT 0,
    bank_duedate_3 integer DEFAULT 0,
    bank_duedate_4 integer DEFAULT 0,
    crystal integer DEFAULT 0,
    appellation integer DEFAULT 0,
    new_mail integer DEFAULT 0,
    add_family_time integer DEFAULT 0,
    spell_card_ground integer DEFAULT 0,
    spell_card_moon integer DEFAULT 0,
    spell_card_star integer DEFAULT 0,
    spell_card_sun integer DEFAULT 0,
    spell_card_ground2 integer DEFAULT 0,
    spell_card_moon2 integer DEFAULT 0,
    spell_card_star2 integer DEFAULT 0,
    spell_card_sun2 integer DEFAULT 0,
    family_msgboard_state integer DEFAULT 0,
    spell_card_attr integer DEFAULT 0,
    max_aa_point integer DEFAULT 0,
    aa_point integer DEFAULT 0,
    aa_exp integer DEFAULT 0,
    aa_rate integer DEFAULT 0,
    self_comment text,
    family_comment text,
    family_contribution_point integer DEFAULT 0,
    lover_id integer DEFAULT 0,
    given_name_change integer DEFAULT 0,
    elf_bot integer DEFAULT 0,
    marked_point integer DEFAULT 0,
    marked_point_id integer DEFAULT 0,
    recommended_events_time integer DEFAULT 0,
    society_option integer DEFAULT 0,
    lucky_bar_money integer DEFAULT 0,
    eqtrain_item_id integer DEFAULT 0,
    lottery_go_reward_1 integer DEFAULT 0,
    lottery_go_reward_2 integer DEFAULT 0,
    lottery_go_reward_3 integer DEFAULT 0,
    isle_bank_duedate_1 integer DEFAULT 0,
    isle_bank_duedate_2 integer DEFAULT 0,
    isle_bank_duedate_3 integer DEFAULT 0,
    isle_bank_duedate_4 integer DEFAULT 0,
    collection_ability integer DEFAULT 0,
    postfix character varying(16) DEFAULT '1'::character varying,
    guess_point integer DEFAULT 0,
    guess_answers integer DEFAULT 0,
    recommended_events_lv integer DEFAULT 0,
    recommended_events_star integer DEFAULT 0,
    re_star_buy_count integer DEFAULT 0,
    re_reward_id integer DEFAULT 0,
    ride_train_item_id integer DEFAULT 0,
    gladiator_last_update_time integer DEFAULT 0,
    gladiator_count integer DEFAULT 0,
    race_team_id integer DEFAULT 0,
    interim_race_team_id integer DEFAULT 0,
    arena_point integer DEFAULT 0,
    upanishad_1 integer DEFAULT 0,
    upanishad_2 integer DEFAULT 0,
    upanishad_3 integer DEFAULT 0,
    upanishad_4 integer DEFAULT 0,
    select_upanishad integer DEFAULT 0,
    equip_ride_item_id integer DEFAULT 0,
    daily_update_time integer DEFAULT 0,
    num_hello integer DEFAULT 0,
    hello_enable integer DEFAULT 0,
    greetings text DEFAULT ''::character varying,
    rebirth_count integer DEFAULT 0,
    rebirth_score integer DEFAULT 0,
    rebirth_last_class integer DEFAULT 0,
    rebirth_last_level integer DEFAULT 0,
    rebirth_front_score integer DEFAULT 0,
    rebirth_store_exp bigint DEFAULT 0,
    appellation_top1 integer DEFAULT 0,
    appellation_top2 integer DEFAULT 0,
    appellation_top3 integer DEFAULT 0,
    equip_chair_item_id integer DEFAULT 0,
    elf_temple_team_id integer DEFAULT 0,
    equip_crystal_combo_item_id integer DEFAULT 0,
    CONSTRAINT player_characters_level CHECK (((level >= 1) AND (level <= 200)))
);


ALTER TABLE public.player_characters OWNER TO postgres;

--
-- Name: player_characters_achievement1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_characters_achievement1 (
    player_id integer NOT NULL,
    achievement_id integer NOT NULL,
    point integer NOT NULL
);


ALTER TABLE public.player_characters_achievement1 OWNER TO postgres;

--
-- Name: player_characters_achievement2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_characters_achievement2 (
    player_id integer NOT NULL,
    achievement_id integer NOT NULL,
    point integer NOT NULL
);


ALTER TABLE public.player_characters_achievement2 OWNER TO postgres;

--
-- Name: player_characters_achievement; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.player_characters_achievement AS
 SELECT player_characters_achievement1.player_id,
    player_characters_achievement1.achievement_id,
    player_characters_achievement1.point
   FROM public.player_characters_achievement1
UNION ALL
 SELECT player_characters_achievement2.player_id,
    player_characters_achievement2.achievement_id,
    player_characters_achievement2.point
   FROM public.player_characters_achievement2;


ALTER TABLE public.player_characters_achievement OWNER TO postgres;

--
-- Name: player_characters_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_characters_setting (
    player_id integer NOT NULL,
    elfpick_setting integer DEFAULT 255
);


ALTER TABLE public.player_characters_setting OWNER TO postgres;

--
-- Name: player_enchants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_enchants (
    player_id integer NOT NULL,
    effect_id integer NOT NULL,
    caster_id integer DEFAULT 0,
    rest_time integer DEFAULT 0,
    factor integer DEFAULT 0,
    counter integer DEFAULT 0,
    note text,
    stack_count integer DEFAULT 1
);


ALTER TABLE public.player_enchants OWNER TO postgres;

--
-- Name: player_family_transform; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_family_transform (
    player_id integer NOT NULL,
    family_id integer NOT NULL,
    inviter_id integer NOT NULL,
    dead_line integer NOT NULL
);


ALTER TABLE public.player_family_transform OWNER TO postgres;

--
-- Name: player_free_ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_free_ticket (
    account_id integer NOT NULL,
    free_tickets integer DEFAULT 0
);


ALTER TABLE public.player_free_ticket OWNER TO postgres;

--
-- Name: player_luckystar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_luckystar (
    player_id integer NOT NULL,
    lucky_ticket_str text DEFAULT ''::character varying,
    lucky_ticket integer DEFAULT 0,
    phase integer DEFAULT 0,
    normal_type integer DEFAULT 1
);


ALTER TABLE public.player_luckystar OWNER TO postgres;

--
-- Name: player_mail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_mail (
    id integer NOT NULL,
    receiver_id integer NOT NULL,
    sender_id integer NOT NULL,
    sender_name text DEFAULT ''::character varying,
    send_time integer NOT NULL,
    due_date integer NOT NULL,
    title text DEFAULT ''::character varying,
    content character varying,
    item_id integer DEFAULT 0,
    gold bigint DEFAULT 0,
    crystal integer DEFAULT 0,
    cod integer DEFAULT 0,
    opened integer DEFAULT 0,
    returned integer DEFAULT 0,
    authoritative integer DEFAULT 0
);


ALTER TABLE public.player_mail OWNER TO postgres;

--
-- Name: player_spellcards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_spellcards (
    player_id integer DEFAULT 0,
    enchant_type integer DEFAULT 0,
    item_id integer DEFAULT 0
);


ALTER TABLE public.player_spellcards OWNER TO postgres;

--
-- Name: player_spells; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_spells (
    player_id integer NOT NULL,
    spellmaster_id integer NOT NULL,
    spell_order integer DEFAULT 0
);


ALTER TABLE public.player_spells OWNER TO postgres;

--
-- Name: prestige; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prestige (
    player_id integer NOT NULL,
    prestige_id integer NOT NULL,
    level integer NOT NULL,
    exp integer NOT NULL
);


ALTER TABLE public.prestige OWNER TO postgres;

--
-- Name: race_rank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.race_rank (
    race_id integer NOT NULL,
    player_id integer NOT NULL,
    player_name text NOT NULL,
    family_name text NOT NULL,
    class_id integer DEFAULT 0,
    level integer DEFAULT 0,
    last_date integer DEFAULT 0,
    race_record integer DEFAULT 0,
    race_best_record integer DEFAULT 0,
    rebirth_count integer DEFAULT 0
);


ALTER TABLE public.race_rank OWNER TO postgres;

--
-- Name: race_record; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.race_record (
    player_id integer NOT NULL,
    race_id integer NOT NULL,
    month_best_time integer NOT NULL,
    best_time integer NOT NULL,
    record_date integer NOT NULL
);


ALTER TABLE public.race_record OWNER TO postgres;

--
-- Name: race_team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.race_team (
    id integer NOT NULL,
    name text NOT NULL,
    leader integer NOT NULL,
    bulletin text DEFAULT ''::character varying,
    create_date integer NOT NULL,
    race_count integer DEFAULT 0,
    recruit integer DEFAULT 0,
    class_filter bigint DEFAULT '-1'::integer,
    min_level integer DEFAULT 0,
    max_level integer DEFAULT 0,
    last_date integer DEFAULT 0
);


ALTER TABLE public.race_team OWNER TO postgres;

--
-- Name: race_team_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.race_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.race_team_id_seq OWNER TO postgres;

--
-- Name: race_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.race_team_id_seq OWNED BY public.race_team.id;


--
-- Name: race_team_member; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.race_team_member (
    team_id integer NOT NULL,
    player_id integer NOT NULL,
    flag integer DEFAULT 0,
    join_date integer NOT NULL
);


ALTER TABLE public.race_team_member OWNER TO postgres;

--
-- Name: race_team_rank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.race_team_rank (
    group_id integer NOT NULL,
    team_id integer NOT NULL,
    team_name text NOT NULL,
    team_declare text NOT NULL,
    last_date integer DEFAULT 0,
    race_id_1 integer DEFAULT 0,
    race_count_1 integer DEFAULT 0,
    race_record_1 integer DEFAULT 0,
    race_id_2 integer DEFAULT 0,
    race_count_2 integer DEFAULT 0,
    race_record_2 integer DEFAULT 0,
    race_id_3 integer DEFAULT 0,
    race_count_3 integer DEFAULT 0,
    race_record_3 integer DEFAULT 0,
    race_id_4 integer DEFAULT 0,
    race_count_4 integer DEFAULT 0,
    race_record_4 integer DEFAULT 0,
    race_id_5 integer DEFAULT 0,
    race_count_5 integer DEFAULT 0,
    race_record_5 integer DEFAULT 0,
    race_id_6 integer DEFAULT 0,
    race_count_6 integer DEFAULT 0,
    race_record_6 integer DEFAULT 0,
    race_id_7 integer DEFAULT 0,
    race_count_7 integer DEFAULT 0,
    race_record_7 integer DEFAULT 0,
    race_id_8 integer DEFAULT 0,
    race_count_8 integer DEFAULT 0,
    race_record_8 integer DEFAULT 0,
    race_id_9 integer DEFAULT 0,
    race_count_9 integer DEFAULT 0,
    race_record_9 integer DEFAULT 0,
    race_id_10 integer DEFAULT 0,
    race_count_10 integer DEFAULT 0,
    race_record_10 integer DEFAULT 0
);


ALTER TABLE public.race_team_rank OWNER TO postgres;

--
-- Name: race_team_record; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.race_team_record (
    team_id integer NOT NULL,
    race_id integer NOT NULL,
    race_count integer DEFAULT 0,
    month_best_time integer NOT NULL,
    best_time integer NOT NULL,
    record_date integer NOT NULL
);


ALTER TABLE public.race_team_record OWNER TO postgres;

--
-- Name: race_team_request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.race_team_request (
    team_id integer NOT NULL,
    player_id integer NOT NULL,
    name text NOT NULL,
    class_id integer NOT NULL,
    level integer NOT NULL,
    request_date integer NOT NULL
);


ALTER TABLE public.race_team_request OWNER TO postgres;

--
-- Name: rank_award_mail_queue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rank_award_mail_queue (
    receiver_id integer NOT NULL,
    rank_template_id integer NOT NULL,
    award_item_index integer NOT NULL
);


ALTER TABLE public.rank_award_mail_queue OWNER TO postgres;

--
-- Name: recommended_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recommended_events (
    player_id integer NOT NULL,
    recommended_id integer NOT NULL,
    count integer DEFAULT 0,
    target_number1 integer DEFAULT 0,
    target_number2 integer DEFAULT 0,
    target_number3 integer DEFAULT 0,
    target_number4 integer DEFAULT 0,
    target_number5 integer DEFAULT 0,
    target_number integer DEFAULT 0
);


ALTER TABLE public.recommended_events OWNER TO postgres;

--
-- Name: recommended_events_old; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recommended_events_old (
    player_id integer NOT NULL,
    recommended_id integer NOT NULL,
    target_number integer DEFAULT 0
);


ALTER TABLE public.recommended_events_old OWNER TO postgres;

--
-- Name: server_fightking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.server_fightking (
    bonus bigint DEFAULT 0,
    bonus_pool bigint DEFAULT 0,
    system_recover bigint DEFAULT 0,
    last_update_time integer DEFAULT 0,
    change_count integer DEFAULT 0,
    fightking_id integer DEFAULT 0,
    fightking_elf_name text DEFAULT ''::character varying,
    fightking_elf_template_id integer DEFAULT 0,
    fightking_elf_model integer DEFAULT 0
);


ALTER TABLE public.server_fightking OWNER TO postgres;

--
-- Name: server_lucky_bar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.server_lucky_bar (
    zone_id integer DEFAULT 0,
    elf_no integer DEFAULT 0,
    elf_money integer DEFAULT 0
);


ALTER TABLE public.server_lucky_bar OWNER TO postgres;

--
-- Name: server_luckystar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.server_luckystar (
    current_lucky_ticket_str text DEFAULT ''::character varying,
    current_lucky_ticket integer DEFAULT 0,
    last_lucky_ticket_str text DEFAULT ''::character varying,
    last_lucky_ticket integer DEFAULT 0,
    current_phase integer DEFAULT 0,
    bonus integer DEFAULT 0,
    phase_due_date integer DEFAULT 0,
    current_special integer DEFAULT 0,
    last_special integer DEFAULT 0,
    CONSTRAINT player_server_luckystar_bonus CHECK (((bonus >= 0) AND (bonus <= 1200000000)))
);


ALTER TABLE public.server_luckystar OWNER TO postgres;

--
-- Name: server_luckystar_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.server_luckystar_log (
    phase integer DEFAULT 0,
    lucky_ticket_str text DEFAULT ''::character varying,
    total_bonus integer DEFAULT 0,
    first_prize_count integer DEFAULT 0,
    second_prize_count integer DEFAULT 0,
    third_prize_count integer DEFAULT 0,
    first_prize integer DEFAULT 0,
    second_prize integer DEFAULT 0,
    third_prize integer DEFAULT 0,
    special_no integer DEFAULT 0
);


ALTER TABLE public.server_luckystar_log OWNER TO postgres;

--
-- Name: server_shutdown; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.server_shutdown (
    server_id integer NOT NULL,
    shutdown_time integer NOT NULL
);


ALTER TABLE public.server_shutdown OWNER TO postgres;

--
-- Name: serverstatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverstatus (
    id integer NOT NULL,
    name character varying(16),
    ext_address character varying(16),
    ext_port integer,
    int_address character varying(16),
    int_port integer,
    last_start_time integer DEFAULT 0,
    last_vip_mail_time integer DEFAULT 0,
    next_itemmall_time integer DEFAULT 0,
    bf_count integer DEFAULT 0,
    last_race_reset_time integer DEFAULT 0,
    daily_awards_time_record integer DEFAULT 0,
    daily_awards_begin_date integer DEFAULT 0,
    daily_awards_flags integer DEFAULT 0
);


ALTER TABLE public.serverstatus OWNER TO postgres;

--
-- Name: shortcut_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shortcut_menu (
    character_id integer NOT NULL,
    page smallint NOT NULL,
    index1 integer DEFAULT '-1'::integer NOT NULL,
    index2 integer DEFAULT '-1'::integer NOT NULL,
    index3 integer DEFAULT '-1'::integer NOT NULL,
    index4 integer DEFAULT '-1'::integer NOT NULL,
    index5 integer DEFAULT '-1'::integer NOT NULL,
    index6 integer DEFAULT '-1'::integer NOT NULL,
    index7 integer DEFAULT '-1'::integer NOT NULL,
    index8 integer DEFAULT '-1'::integer NOT NULL,
    index9 integer DEFAULT '-1'::integer NOT NULL,
    index10 integer DEFAULT '-1'::integer NOT NULL,
    index11 integer DEFAULT '-1'::integer NOT NULL,
    index12 integer DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.shortcut_menu OWNER TO postgres;

--
-- Name: spell_storage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spell_storage (
    player_id integer NOT NULL,
    spell_id integer NOT NULL
);


ALTER TABLE public.spell_storage OWNER TO postgres;

--
-- Name: statistics_monster; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statistics_monster (
    handle integer NOT NULL,
    template_id integer DEFAULT 0,
    death_count integer DEFAULT 0
);


ALTER TABLE public.statistics_monster OWNER TO postgres;

--
-- Name: statistics_player; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statistics_player (
    level integer NOT NULL,
    player_count integer DEFAULT 0,
    played_time integer DEFAULT 0
);


ALTER TABLE public.statistics_player OWNER TO postgres;

--
-- Name: statues_scenes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statues_scenes (
    worldserver_id integer NOT NULL,
    node_id integer NOT NULL,
    template_id integer NOT NULL,
    family_id integer NOT NULL,
    player_name text DEFAULT ''::character varying,
    gender_id integer,
    face integer,
    hair integer,
    equip_head integer,
    equip_chest integer,
    equip_pants integer,
    equip_glove integer,
    equip_feet integer,
    equip_back integer,
    equip_right integer,
    equip_left integer,
    equip_shoot integer,
    weapon_active integer,
    ride_id integer,
    transform_id integer,
    action_id integer,
    frame_key double precision
);


ALTER TABLE public.statues_scenes OWNER TO postgres;

--
-- Name: storage1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.storage1 (
    id integer NOT NULL,
    item_id integer NOT NULL,
    durability integer NOT NULL,
    maker text DEFAULT ''::character varying,
    rank integer DEFAULT 0,
    identify smallint DEFAULT 1,
    magic smallint DEFAULT 0,
    embedded_amount integer DEFAULT 0,
    embedded_id1 integer DEFAULT '-1'::integer,
    embedded_id2 integer DEFAULT '-1'::integer,
    embedded_id3 integer DEFAULT '-1'::integer,
    embedded_id4 integer DEFAULT '-1'::integer,
    embedded_id5 integer DEFAULT '-1'::integer,
    embedded_id6 integer DEFAULT '-1'::integer,
    create_time integer DEFAULT 1,
    due_date integer DEFAULT 0,
    container_index integer DEFAULT '-1'::integer,
    combo_id integer DEFAULT 0,
    strengthen integer DEFAULT 0,
    cur_maxdurability integer DEFAULT 0,
    bind integer DEFAULT 0,
    player_id integer NOT NULL,
    loc integer NOT NULL,
    lock_pwd text DEFAULT '*'::character varying,
    unlock_time integer DEFAULT 0,
    extra_combo_id1 integer DEFAULT 0,
    extra_combo_id2 integer DEFAULT 0,
    extra_combo_id3 integer DEFAULT 0,
    extra_combo_id4 integer DEFAULT 0,
    extra_combo_id5 integer DEFAULT 0,
    extra_combo_id6 integer DEFAULT 0,
    witchcraft integer DEFAULT 0,
    train_type integer DEFAULT 0,
    train_level integer DEFAULT 0,
    train_exp integer DEFAULT 0,
    ride_combo integer DEFAULT 0,
    ride_star_level integer DEFAULT 0,
    ride_point integer DEFAULT 0,
    awake_level integer DEFAULT 0,
    awake_potential integer DEFAULT 0,
    awake_addition integer DEFAULT 0,
    combo_rune_slot integer DEFAULT '-1'::integer,
    rune_combo_id1 integer DEFAULT 0,
    rune_combo_id2 integer DEFAULT 0,
    rune_combo_id3 integer DEFAULT 0,
    rune_combo_id4 integer DEFAULT 0,
    rune_combo_id5 integer DEFAULT 0
);


ALTER TABLE public.storage1 OWNER TO postgres;

--
-- Name: storage2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.storage2 (
    id integer NOT NULL,
    item_id integer NOT NULL,
    durability integer NOT NULL,
    maker text DEFAULT ''::character varying,
    rank integer DEFAULT 0,
    identify smallint DEFAULT 1,
    magic smallint DEFAULT 0,
    embedded_amount integer DEFAULT 0,
    embedded_id1 integer DEFAULT '-1'::integer,
    embedded_id2 integer DEFAULT '-1'::integer,
    embedded_id3 integer DEFAULT '-1'::integer,
    embedded_id4 integer DEFAULT '-1'::integer,
    embedded_id5 integer DEFAULT '-1'::integer,
    embedded_id6 integer DEFAULT '-1'::integer,
    create_time integer DEFAULT 1,
    due_date integer DEFAULT 0,
    container_index integer DEFAULT '-1'::integer,
    combo_id integer DEFAULT 0,
    strengthen integer DEFAULT 0,
    cur_maxdurability integer DEFAULT 0,
    bind integer DEFAULT 0,
    player_id integer NOT NULL,
    loc integer NOT NULL,
    lock_pwd text DEFAULT '*'::character varying,
    unlock_time integer DEFAULT 0,
    extra_combo_id1 integer DEFAULT 0,
    extra_combo_id2 integer DEFAULT 0,
    extra_combo_id3 integer DEFAULT 0,
    extra_combo_id4 integer DEFAULT 0,
    extra_combo_id5 integer DEFAULT 0,
    extra_combo_id6 integer DEFAULT 0,
    witchcraft integer DEFAULT 0,
    train_type integer DEFAULT 0,
    train_level integer DEFAULT 0,
    train_exp integer DEFAULT 0,
    ride_combo integer DEFAULT 0,
    ride_star_level integer DEFAULT 0,
    ride_point integer DEFAULT 0,
    awake_level integer DEFAULT 0,
    awake_potential integer DEFAULT 0,
    awake_addition integer DEFAULT 0,
    combo_rune_slot integer DEFAULT '-1'::integer,
    rune_combo_id1 integer DEFAULT 0,
    rune_combo_id2 integer DEFAULT 0,
    rune_combo_id3 integer DEFAULT 0,
    rune_combo_id4 integer DEFAULT 0,
    rune_combo_id5 integer DEFAULT 0
);


ALTER TABLE public.storage2 OWNER TO postgres;

--
-- Name: storage; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.storage AS
 SELECT storage1.id,
    storage1.item_id,
    storage1.durability,
    storage1.maker,
    storage1.rank,
    storage1.identify,
    storage1.magic,
    storage1.embedded_amount,
    storage1.embedded_id1,
    storage1.embedded_id2,
    storage1.embedded_id3,
    storage1.embedded_id4,
    storage1.embedded_id5,
    storage1.embedded_id6,
    storage1.create_time,
    storage1.due_date,
    storage1.container_index,
    storage1.combo_id,
    storage1.strengthen,
    storage1.cur_maxdurability,
    storage1.bind,
    storage1.player_id,
    storage1.loc,
    storage1.lock_pwd,
    storage1.unlock_time,
    storage1.extra_combo_id1,
    storage1.extra_combo_id2,
    storage1.extra_combo_id3,
    storage1.extra_combo_id4,
    storage1.extra_combo_id5,
    storage1.extra_combo_id6,
    storage1.witchcraft,
    storage1.train_type,
    storage1.train_level,
    storage1.train_exp,
    storage1.ride_combo,
    storage1.ride_star_level,
    storage1.ride_point
   FROM public.storage1
UNION ALL
 SELECT storage2.id,
    storage2.item_id,
    storage2.durability,
    storage2.maker,
    storage2.rank,
    storage2.identify,
    storage2.magic,
    storage2.embedded_amount,
    storage2.embedded_id1,
    storage2.embedded_id2,
    storage2.embedded_id3,
    storage2.embedded_id4,
    storage2.embedded_id5,
    storage2.embedded_id6,
    storage2.create_time,
    storage2.due_date,
    storage2.container_index,
    storage2.combo_id,
    storage2.strengthen,
    storage2.cur_maxdurability,
    storage2.bind,
    storage2.player_id,
    storage2.loc,
    storage2.lock_pwd,
    storage2.unlock_time,
    storage2.extra_combo_id1,
    storage2.extra_combo_id2,
    storage2.extra_combo_id3,
    storage2.extra_combo_id4,
    storage2.extra_combo_id5,
    storage2.extra_combo_id6,
    storage2.witchcraft,
    storage2.train_type,
    storage2.train_level,
    storage2.train_exp,
    storage2.ride_combo,
    storage2.ride_star_level,
    storage2.ride_point
   FROM public.storage2;


ALTER TABLE public.storage OWNER TO postgres;

--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    player_id integer NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: sys_mail_queue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sys_mail_queue (
    receiver_id integer NOT NULL,
    title text DEFAULT ''::character varying,
    content text DEFAULT ''::character varying,
    gold integer DEFAULT 0,
    item_id integer NOT NULL,
    durability integer NOT NULL,
    maker text DEFAULT ''::character varying,
    rank integer DEFAULT 0,
    identify smallint DEFAULT 1,
    magic smallint DEFAULT 0,
    embedded_amount integer DEFAULT 0,
    embedded_id1 integer DEFAULT '-1'::integer,
    embedded_id2 integer DEFAULT '-1'::integer,
    embedded_id3 integer DEFAULT '-1'::integer,
    embedded_id4 integer DEFAULT '-1'::integer,
    embedded_id5 integer DEFAULT '-1'::integer,
    embedded_id6 integer DEFAULT '-1'::integer,
    create_time integer DEFAULT 1,
    due_date integer DEFAULT 0,
    combo_id integer DEFAULT 0,
    strengthen integer DEFAULT 0,
    cur_maxdurability integer DEFAULT 0,
    bind integer DEFAULT 0,
    clone_item_id integer DEFAULT '-1'::integer,
    state text DEFAULT 'New'::character varying,
    extra_combo_id1 integer DEFAULT 0,
    extra_combo_id2 integer DEFAULT 0,
    extra_combo_id3 integer DEFAULT 0,
    extra_combo_id4 integer DEFAULT 0,
    extra_combo_id5 integer DEFAULT 0,
    extra_combo_id6 integer DEFAULT 0,
    sender_name text DEFAULT ''::character varying,
    witchcraft integer DEFAULT 0,
    train_type integer DEFAULT 0,
    train_level integer DEFAULT 0,
    train_exp integer DEFAULT 0,
    ride_combo integer DEFAULT 0,
    ride_star_level integer DEFAULT 0,
    ride_point integer DEFAULT 0,
    awake_level integer DEFAULT 0,
    awake_potential integer DEFAULT 0,
    awake_addition integer DEFAULT 0,
    combo_rune_slot integer DEFAULT '-1'::integer,
    rune_combo_id1 integer DEFAULT 0,
    rune_combo_id2 integer DEFAULT 0,
    rune_combo_id3 integer DEFAULT 0,
    rune_combo_id4 integer DEFAULT 0,
    rune_combo_id5 integer DEFAULT 0
);


ALTER TABLE public.sys_mail_queue OWNER TO postgres;

--
-- Name: sys_mail_queue_new; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sys_mail_queue_new (
    mail_id integer NOT NULL,
    receiver_id integer NOT NULL,
    clone_item_id integer DEFAULT 0,
    state text DEFAULT 'New'::character varying,
    sender_name text DEFAULT ''::character varying,
    title text DEFAULT ''::character varying,
    content text DEFAULT ''::character varying,
    gold bigint DEFAULT 0,
    item_id integer NOT NULL,
    durability integer NOT NULL,
    maker text DEFAULT ''::character varying,
    rank integer DEFAULT 0,
    identify smallint DEFAULT 1,
    magic smallint DEFAULT 0,
    embedded_amount integer DEFAULT 0,
    embedded_id1 integer DEFAULT '-1'::integer,
    embedded_id2 integer DEFAULT '-1'::integer,
    embedded_id3 integer DEFAULT '-1'::integer,
    embedded_id4 integer DEFAULT '-1'::integer,
    embedded_id5 integer DEFAULT '-1'::integer,
    embedded_id6 integer DEFAULT '-1'::integer,
    create_time integer DEFAULT 1,
    due_date integer DEFAULT 0,
    combo_id integer DEFAULT 0,
    strengthen integer DEFAULT 0,
    cur_maxdurability integer DEFAULT 0,
    bind integer DEFAULT 0,
    extra_combo_id1 integer DEFAULT 0,
    extra_combo_id2 integer DEFAULT 0,
    extra_combo_id3 integer DEFAULT 0,
    extra_combo_id4 integer DEFAULT 0,
    extra_combo_id5 integer DEFAULT 0,
    extra_combo_id6 integer DEFAULT 0,
    witchcraft integer DEFAULT 0,
    train_type integer DEFAULT 0,
    train_level integer DEFAULT 0,
    train_exp integer DEFAULT 0,
    ride_combo integer DEFAULT 0,
    ride_star_level integer DEFAULT 0,
    ride_point integer DEFAULT 0,
    awake_level integer DEFAULT 0,
    awake_potential integer DEFAULT 0,
    awake_addition integer DEFAULT 0,
    combo_rune_slot integer DEFAULT '-1'::integer,
    rune_combo_id1 integer DEFAULT 0,
    rune_combo_id2 integer DEFAULT 0,
    rune_combo_id3 integer DEFAULT 0,
    rune_combo_id4 integer DEFAULT 0,
    rune_combo_id5 integer DEFAULT 0
);


ALTER TABLE public.sys_mail_queue_new OWNER TO postgres;

--
-- Name: sys_mail_queue_new_mail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sys_mail_queue_new_mail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_mail_queue_new_mail_id_seq OWNER TO postgres;

--
-- Name: sys_mail_queue_new_mail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sys_mail_queue_new_mail_id_seq OWNED BY public.sys_mail_queue_new.mail_id;


--
-- Name: territory_war; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.territory_war (
    territory_id integer NOT NULL,
    own_family_id integer NOT NULL,
    own_times integer NOT NULL
);


ALTER TABLE public.territory_war OWNER TO postgres;

--
-- Name: transport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transport (
    player_id integer NOT NULL,
    node_id integer NOT NULL,
    eventarea_id integer NOT NULL
);


ALTER TABLE public.transport OWNER TO postgres;

--
-- Name: victory_declaration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.victory_declaration (
    player_id integer NOT NULL,
    content character varying NOT NULL
);


ALTER TABLE public.victory_declaration OWNER TO postgres;

--
-- Name: vip; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vip (
    id integer NOT NULL,
    silver_time integer DEFAULT 0,
    golden_time integer DEFAULT 0
);


ALTER TABLE public.vip OWNER TO postgres;

--
-- Name: vip_card; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vip_card (
    player_id integer NOT NULL,
    vip_id integer NOT NULL,
    received_day integer NOT NULL,
    set_time integer NOT NULL,
    next_time integer NOT NULL
);


ALTER TABLE public.vip_card OWNER TO postgres;

--
-- Name: family_crop id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.family_crop ALTER COLUMN id SET DEFAULT nextval('public.family_crop_id_seq'::regclass);


--
-- Name: isle_crop id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.isle_crop ALTER COLUMN id SET DEFAULT nextval('public.isle_crop_id_seq'::regclass);


--
-- Name: isle_record id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.isle_record ALTER COLUMN id SET DEFAULT nextval('public.isle_record_id_seq'::regclass);


--
-- Name: race_team id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.race_team ALTER COLUMN id SET DEFAULT nextval('public.race_team_id_seq'::regclass);


--
-- Name: sys_mail_queue_new mail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_mail_queue_new ALTER COLUMN mail_id SET DEFAULT nextval('public.sys_mail_queue_new_mail_id_seq'::regclass);


--
-- Data for Name: account_shared; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_shared (account_id, beaststower_enter_count, daily_update_time, rainbowroad_enter_count) FROM stdin;
\.


--
-- Data for Name: advanced_ability; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.advanced_ability (player_id, effect_id, point) FROM stdin;
\.


--
-- Data for Name: auction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auction (id, item_id, durability, maker, rank, identify, magic, embedded_amount, embedded_id1, embedded_id2, embedded_id3, embedded_id4, embedded_id5, embedded_id6, create_time, due_date, container_index, combo_id, strengthen, cur_maxdurability, bind, seller_id, item_type, level, class, quality, quality_filter, auction_duedate, auction_price, lock_pwd, unlock_time, extra_combo_id1, extra_combo_id2, extra_combo_id3, extra_combo_id4, extra_combo_id5, extra_combo_id6, item_name, witchcraft, train_type, train_level, train_exp, ride_combo, ride_star_level, ride_point, class_limit, awake_level, awake_potential, awake_addition, combo_rune_slot, rune_combo_id1, rune_combo_id2, rune_combo_id3, rune_combo_id4, rune_combo_id5) FROM stdin;
\.


--
-- Data for Name: bags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bags (id, item_id, durability, maker, rank, identify, magic, embedded_amount, embedded_id1, embedded_id2, embedded_id3, embedded_id4, embedded_id5, embedded_id6, create_time, due_date, container_index, combo_id, strengthen, cur_maxdurability, bind, player_id, loc, lock_pwd, unlock_time, extra_combo_id1, extra_combo_id2, extra_combo_id3, extra_combo_id4, extra_combo_id5, extra_combo_id6, witchcraft, train_type, train_level, train_exp, ride_combo, ride_star_level, ride_point, awake_level, awake_potential, awake_addition, combo_rune_slot, rune_combo_id1, rune_combo_id2, rune_combo_id3, rune_combo_id4, rune_combo_id5) FROM stdin;
\.


--
-- Data for Name: battlefield_career; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.battlefield_career (player_id, player_name, player_lv, player_class, join_count, win_count, lose_count, mvp_count, hight_score, kill_count, die_count, hight_kill, hight_die, hight_damage, hight_altar_damage, hight_cure) FROM stdin;
\.


--
-- Data for Name: battlefield_month; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.battlefield_month (player_id, player_name, player_lv, player_class, join_count, win_count, lose_count, mvp_count, hight_score, kill_count, die_count, hight_kill, hight_die, hight_damage, hight_altar_damage, hight_cure, mvp_count_weight, kill_count_weight, pk_grade, pk_kill_count, pk_join_count, rebirth_count) FROM stdin;
\.


--
-- Data for Name: beasts_tower; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beasts_tower (bt_id, floor, family_id) FROM stdin;
\.


--
-- Data for Name: beasts_tower_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beasts_tower_members (player_id, bt_id, family_id) FROM stdin;
\.


--
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collection (id, item_id, durability, maker, rank, identify, magic, embedded_amount, embedded_id1, embedded_id2, embedded_id3, embedded_id4, embedded_id5, embedded_id6, create_time, due_date, combo_id, strengthen, cur_maxdurability, bind, account_id, lock_pwd, unlock_time, extra_combo_id1, extra_combo_id2, extra_combo_id3, extra_combo_id4, extra_combo_id5, extra_combo_id6, witchcraft, train_type, train_level, train_exp, ride_combo, ride_star_level, ride_point, awake_level, awake_potential, awake_addition, combo_rune_slot, rune_combo_id1, rune_combo_id2, rune_combo_id3, rune_combo_id4, rune_combo_id5) FROM stdin;
\.


--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.configuration (schema_version, world_start_time, mission_version) FROM stdin;
2006081400	2000-01-01	0
\.


--
-- Data for Name: daily_awards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.daily_awards (id, day_index, cooldown_time, award_days, award_records) FROM stdin;
\.


--
-- Data for Name: elf1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.elf1 (elf_id, player_id, template_id, name, level, exp, familiar, mood, energy, stone_a, stone_b, skill_id_1, skill_level_1, skill_exp_1, skill_id_2, skill_level_2, skill_exp_2, skill_id_3, skill_level_3, skill_exp_3, skill_id_4, skill_level_4, skill_exp_4, loc, item1, amount1, socket_amount1, item2, amount2, socket_amount2, item3, amount3, socket_amount3, work_type, work_id, work_event, work_count, face, type, skin, return_loc, return_grade, wall, ground, game_win, game_lose, game_ko, game_winmsg, game_jan_al, game_ken_al, game_pon_al, game_jan_dl, game_ken_dl, game_pon_dl, game_jan_ae, game_ken_ae, game_pon_ae, game_jan_de, game_ken_de, game_pon_de, combo1, combo2, combo3, extra_combo1_1, extra_combo1_2, extra_combo1_3, extra_combo1_4, extra_combo1_5, extra_combo1_6, extra_combo2_1, extra_combo2_2, extra_combo2_3, extra_combo2_4, extra_combo2_5, extra_combo2_6, extra_combo3_1, extra_combo3_2, extra_combo3_3, extra_combo3_4, extra_combo3_5, extra_combo3_6, game_jan_count, game_ken_count, game_pon_count, gold1, gold2, gold3, witchcraft1, witchcraft2, witchcraft3, strengthen1, strengthen2, strengthen3, embedded1_1, embedded1_2, embedded1_3, embedded1_4, embedded1_5, embedded1_6, embedded2_1, embedded2_2, embedded2_3, embedded2_4, embedded2_5, embedded2_6, embedded3_1, embedded3_2, embedded3_3, embedded3_4, embedded3_5, embedded3_6, rework, max_durability1, max_durability2, max_durability3, class_id, train_type_1, train_level_1, train_exp_1, train_type_2, train_level_2, train_exp_2, train_type_3, train_level_3, train_exp_3, to_bind1, to_bind2, to_bind3, ride_combo1, ride_star_level1, ride_point1, ride_combo2, ride_star_level2, ride_point2, ride_combo3, ride_star_level3, ride_point3, awake_level1, awake_potential1, awake_addition1, awake_level2, awake_potential2, awake_addition2, awake_level3, awake_potential3, awake_addition3, combo_rune_slot1, rune_combo_id1_1, rune_combo_id1_2, rune_combo_id1_3, rune_combo_id1_4, rune_combo_id1_5, combo_rune_slot2, rune_combo_id2_1, rune_combo_id2_2, rune_combo_id2_3, rune_combo_id2_4, rune_combo_id2_5, combo_rune_slot3, rune_combo_id3_1, rune_combo_id3_2, rune_combo_id3_3, rune_combo_id3_4, rune_combo_id3_5) FROM stdin;
\.


--
-- Data for Name: elf2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.elf2 (elf_id, player_id, template_id, name, level, exp, familiar, mood, energy, stone_a, stone_b, skill_id_1, skill_level_1, skill_exp_1, skill_id_2, skill_level_2, skill_exp_2, skill_id_3, skill_level_3, skill_exp_3, skill_id_4, skill_level_4, skill_exp_4, loc, item1, amount1, socket_amount1, item2, amount2, socket_amount2, item3, amount3, socket_amount3, work_type, work_id, work_event, work_count, face, type, skin, return_loc, return_grade, wall, ground, game_win, game_lose, game_ko, game_winmsg, game_jan_al, game_ken_al, game_pon_al, game_jan_dl, game_ken_dl, game_pon_dl, game_jan_ae, game_ken_ae, game_pon_ae, game_jan_de, game_ken_de, game_pon_de, combo1, combo2, combo3, extra_combo1_1, extra_combo1_2, extra_combo1_3, extra_combo1_4, extra_combo1_5, extra_combo1_6, extra_combo2_1, extra_combo2_2, extra_combo2_3, extra_combo2_4, extra_combo2_5, extra_combo2_6, extra_combo3_1, extra_combo3_2, extra_combo3_3, extra_combo3_4, extra_combo3_5, extra_combo3_6, game_jan_count, game_ken_count, game_pon_count, gold1, gold2, gold3, witchcraft1, witchcraft2, witchcraft3, strengthen1, strengthen2, strengthen3, embedded1_1, embedded1_2, embedded1_3, embedded1_4, embedded1_5, embedded1_6, embedded2_1, embedded2_2, embedded2_3, embedded2_4, embedded2_5, embedded2_6, embedded3_1, embedded3_2, embedded3_3, embedded3_4, embedded3_5, embedded3_6, rework, max_durability1, max_durability2, max_durability3, class_id, train_type_1, train_level_1, train_exp_1, train_type_2, train_level_2, train_exp_2, train_type_3, train_level_3, train_exp_3, to_bind1, to_bind2, to_bind3, ride_combo1, ride_star_level1, ride_point1, ride_combo2, ride_star_level2, ride_point2, ride_combo3, ride_star_level3, ride_point3, awake_level1, awake_potential1, awake_addition1, awake_level2, awake_potential2, awake_addition2, awake_level3, awake_potential3, awake_addition3, combo_rune_slot1, rune_combo_id1_1, rune_combo_id1_2, rune_combo_id1_3, rune_combo_id1_4, rune_combo_id1_5, combo_rune_slot2, rune_combo_id2_1, rune_combo_id2_2, rune_combo_id2_3, rune_combo_id2_4, rune_combo_id2_5, combo_rune_slot3, rune_combo_id3_1, rune_combo_id3_2, rune_combo_id3_3, rune_combo_id3_4, rune_combo_id3_5) FROM stdin;
\.


--
-- Data for Name: elf_container1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.elf_container1 (id, item_id, durability, maker, rank, identify, magic, embedded_amount, embedded_id1, embedded_id2, embedded_id3, embedded_id4, embedded_id5, embedded_id6, create_time, due_date, container_index, combo_id, strengthen, cur_maxdurability, bind, elf_id, player_id, loc, lock_pwd, unlock_time, extra_combo_id1, extra_combo_id2, extra_combo_id3, extra_combo_id4, extra_combo_id5, extra_combo_id6, witchcraft, train_type, train_level, train_exp, ride_combo, ride_star_level, ride_point, awake_level, awake_potential, awake_addition, combo_rune_slot, rune_combo_id1, rune_combo_id2, rune_combo_id3, rune_combo_id4, rune_combo_id5) FROM stdin;
\.


--
-- Data for Name: elf_container2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.elf_container2 (id, item_id, durability, maker, rank, identify, magic, embedded_amount, embedded_id1, embedded_id2, embedded_id3, embedded_id4, embedded_id5, embedded_id6, create_time, due_date, container_index, combo_id, strengthen, cur_maxdurability, bind, elf_id, player_id, loc, lock_pwd, unlock_time, extra_combo_id1, extra_combo_id2, extra_combo_id3, extra_combo_id4, extra_combo_id5, extra_combo_id6, witchcraft, train_type, train_level, train_exp, ride_combo, ride_star_level, ride_point, awake_level, awake_potential, awake_addition, combo_rune_slot, rune_combo_id1, rune_combo_id2, rune_combo_id3, rune_combo_id4, rune_combo_id5) FROM stdin;
\.


--
-- Data for Name: elf_shortcut_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.elf_shortcut_menu (player_id, index_1, index_2, index_3, index_4, index_5, dudate_4, dudate_5) FROM stdin;
\.


--
-- Data for Name: elf_skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.elf_skills (player_id, exp_1, exp_2, exp_3, point_1, point_2, point_3, skill_1_1, skill_1_2, skill_1_3, skill_1_4, skill_1_5, skill_2_1, skill_2_2, skill_2_3, skill_2_4, skill_2_5, skill_3_1, skill_3_2, skill_3_3, skill_3_4, skill_3_5) FROM stdin;
\.


--
-- Data for Name: elf_temple_team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.elf_temple_team (id, leader_id, members, road_index, events, stage) FROM stdin;
\.


--
-- Data for Name: elfinventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.elfinventory (id, item_id, durability, maker, rank, identify, magic, embedded_amount, embedded_id1, embedded_id2, embedded_id3, embedded_id4, embedded_id5, embedded_id6, create_time, due_date, container_index, combo_id, strengthen, cur_maxdurability, bind, player_id, loc, lock_pwd, unlock_time, extra_combo_id1, extra_combo_id2, extra_combo_id3, extra_combo_id4, extra_combo_id5, extra_combo_id6, witchcraft, train_type, train_level, train_exp, ride_combo, ride_star_level, ride_point, awake_level, awake_potential, awake_addition, combo_rune_slot, rune_combo_id1, rune_combo_id2, rune_combo_id3, rune_combo_id4, rune_combo_id5) FROM stdin;
\.


--
-- Data for Name: equipment1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equipment1 (id, item_id, durability, maker, rank, identify, magic, embedded_amount, embedded_id1, embedded_id2, embedded_id3, embedded_id4, embedded_id5, embedded_id6, create_time, due_date, container_index, combo_id, strengthen, cur_maxdurability, bind, player_id, loc, lock_pwd, unlock_time, extra_combo_id1, extra_combo_id2, extra_combo_id3, extra_combo_id4, extra_combo_id5, extra_combo_id6, witchcraft, train_type, train_level, train_exp, ride_combo, ride_star_level, ride_point, awake_level, awake_potential, awake_addition, combo_rune_slot, rune_combo_id1, rune_combo_id2, rune_combo_id3, rune_combo_id4, rune_combo_id5) FROM stdin;
\.


--
-- Data for Name: equipment2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equipment2 (id, item_id, durability, maker, rank, identify, magic, embedded_amount, embedded_id1, embedded_id2, embedded_id3, embedded_id4, embedded_id5, embedded_id6, create_time, due_date, container_index, combo_id, strengthen, cur_maxdurability, bind, player_id, loc, lock_pwd, unlock_time, extra_combo_id1, extra_combo_id2, extra_combo_id3, extra_combo_id4, extra_combo_id5, extra_combo_id6, witchcraft, train_type, train_level, train_exp, ride_combo, ride_star_level, ride_point, awake_level, awake_potential, awake_addition, combo_rune_slot, rune_combo_id1, rune_combo_id2, rune_combo_id3, rune_combo_id4, rune_combo_id5) FROM stdin;
\.


--
-- Data for Name: family; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.family (id, name, leader_id, lv, uniform, flag, delete_time, recruit_message, emblem, info, member_title, leader_title, cadre_title_2, cadre_title_3, cadre_title_4, cadre_title_5, cadre_title_6, cadre_title_7, cadre_title_8, exploit, exp, invite_privilege, kickout_privilege, setcadre_privilege, editinfo_privilege, setemblem, msgboard_privilege, channel_privilege, be_create_time, comment_privilege, treasury, tax_rate, spell_point, elfking_tid, spell_privilege, house_open, family_flag, storage01_privilege, storage02_privilege, storage03_privilege, union_family_1, union_family_2, union_family_3, recurit, fram_privilege, tree_privilege, tree_level, tree_exp, tree_energy, tree_refresh, wishing_well_id, wishing_well_create_time) FROM stdin;
\.


--
-- Data for Name: family_achievement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.family_achievement (family_id, achievement_type, point) FROM stdin;
\.


--
-- Data for Name: family_achievement_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.family_achievement_log (family_id, player_id, achievement_id, point, date, log_id) FROM stdin;
\.


--
-- Data for Name: family_achievement_rank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.family_achievement_rank (family_id, family_name, update_time, total_point, monster_kill, festival_type, mission_type, lv01_instance_node, lv31_instance_node, lv46_instance_node, lv61_instance_node, lv76_instance_node, lv91_instance_node, family_boss, rare_monster, world_boss, activity, mission_chaslot, mission_elia, mission_gear, mission_arsalan, mission_bluewhale, mission_other, event_one, event_two, event_three, event_four, event_five, mission_deep, event_six) FROM stdin;
\.


--
-- Data for Name: family_battle_championship; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.family_battle_championship (game_num, family_id, family_name, rank, camp_type, execute_time, week_point, score, city) FROM stdin;
\.


--
-- Data for Name: family_battle_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.family_battle_data (area_id, area_name, family_id, week_type) FROM stdin;
1	chaslot	0	0
2	elia	0	0
3	gear	0	0
4	deepfathom	0	0
\.


--
-- Data for Name: family_battle_rank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.family_battle_rank (family_id, family_name, update_time, total_point, monster_kill, festival_type, mission_type, lv01_instance_node, lv31_instance_node, lv46_instance_node, lv61_instance_node, lv76_instance_node, lv91_instance_node, family_boss, rare_monster, world_boss, activity, mission_chaslot, mission_elia, mission_gear, mission_arsalan, mission_bluewhale, mission_other, event_one, event_two, event_three, event_four, event_five, mission_deep, event_six) FROM stdin;
\.


--
-- Data for Name: family_battle_registration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.family_battle_registration (family_id, city) FROM stdin;
\.


--
-- Data for Name: family_cadre_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.family_cadre_members (family_id, player_id, rank, title) FROM stdin;
\.


--
-- Data for Name: family_crop; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.family_crop (id, family_id, loc, grower, crop_tid, after_time, energy, record_time) FROM stdin;
\.


--
-- Data for Name: family_crop_enchants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.family_crop_enchants (crop_id, effect_id, rest_time) FROM stdin;
\.


--
-- Data for Name: family_farm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.family_farm (family_id, loc, hire_time) FROM stdin;
\.


--
-- Data for Name: family_msgboard; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.family_msgboard (family_id, message_id, title, content, player_name, create_date) FROM stdin;
\.


--
-- Data for Name: family_storage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.family_storage (id, item_id, durability, maker, rank, identify, magic, embedded_amount, embedded_id1, embedded_id2, embedded_id3, embedded_id4, embedded_id5, embedded_id6, loc, create_time, due_date, combo_id, strengthen, cur_maxdurability, bind, lock_pwd, unlock_time, family_id, container_index, extra_combo_id1, extra_combo_id2, extra_combo_id3, extra_combo_id4, extra_combo_id5, extra_combo_id6, witchcraft, train_type, train_level, train_exp, ride_combo, ride_star_level, ride_point, awake_level, awake_potential, awake_addition, combo_rune_slot, rune_combo_id1, rune_combo_id2, rune_combo_id3, rune_combo_id4, rune_combo_id5) FROM stdin;
\.


--
-- Data for Name: family_storage_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.family_storage_log (family_id, log_type, log, log_time) FROM stdin;
\.


--
-- Data for Name: family_tree; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.family_tree (family_id, finish_tree_id) FROM stdin;
\.


--
-- Data for Name: fightking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fightking (player_id, gold) FROM stdin;
\.


--
-- Data for Name: final_mission_state1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.final_mission_state1 (player_id, index, state) FROM stdin;
\.


--
-- Data for Name: final_mission_state2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.final_mission_state2 (player_id, index, state) FROM stdin;
\.


--
-- Data for Name: friends; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.friends (player_id, friend_id, friend_type, hello) FROM stdin;
\.


--
-- Data for Name: global_variables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.global_variables (id, value) FROM stdin;
\.


--
-- Data for Name: gold_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gold_log (date, increase, decrease, range1, range2, range3, range4, range5, range6, range7, range8, range9, range10) FROM stdin;
\.


--
-- Data for Name: illplugininfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.illplugininfo (accountname, modulename, exepathinfo, servername, clientversion, playerhostname, playerip, worldid, playername, datetime, playernetaddr, windowsversion) FROM stdin;
\.


--
-- Data for Name: init_errlog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.init_errlog (time_stamp, start_time, message) FROM stdin;
\.


--
-- Data for Name: inventory1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory1 (id, item_id, durability, maker, rank, identify, magic, embedded_amount, embedded_id1, embedded_id2, embedded_id3, embedded_id4, embedded_id5, embedded_id6, create_time, due_date, container_index, combo_id, strengthen, cur_maxdurability, bind, player_id, loc, lock_pwd, unlock_time, extra_combo_id1, extra_combo_id2, extra_combo_id3, extra_combo_id4, extra_combo_id5, extra_combo_id6, witchcraft, train_type, train_level, train_exp, ride_combo, ride_star_level, ride_point, awake_level, awake_potential, awake_addition, combo_rune_slot, rune_combo_id1, rune_combo_id2, rune_combo_id3, rune_combo_id4, rune_combo_id5) FROM stdin;
\.


--
-- Data for Name: inventory2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory2 (id, item_id, durability, maker, rank, identify, magic, embedded_amount, embedded_id1, embedded_id2, embedded_id3, embedded_id4, embedded_id5, embedded_id6, create_time, due_date, container_index, combo_id, strengthen, cur_maxdurability, bind, player_id, loc, lock_pwd, unlock_time, extra_combo_id1, extra_combo_id2, extra_combo_id3, extra_combo_id4, extra_combo_id5, extra_combo_id6, witchcraft, train_type, train_level, train_exp, ride_combo, ride_star_level, ride_point, awake_level, awake_potential, awake_addition, combo_rune_slot, rune_combo_id1, rune_combo_id2, rune_combo_id3, rune_combo_id4, rune_combo_id5) FROM stdin;
\.


--
-- Data for Name: isle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.isle (isle_id, name, durability, time_record, level, exp, style, create_date, visits, grade, bulletin, equip_cd, change_name) FROM stdin;
\.


--
-- Data for Name: isle_achievement_rank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.isle_achievement_rank (isle_id, isle_name, isle_lv, visits, total_visits, grade, total_grade) FROM stdin;
\.


--
-- Data for Name: isle_altar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.isle_altar (isle_id, elf_id, time_limit) FROM stdin;
\.


--
-- Data for Name: isle_blacklist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.isle_blacklist (isle_id, block_id, block_name, block_time) FROM stdin;
\.


--
-- Data for Name: isle_crop; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.isle_crop (id, isle_id, category, loc, grower, crop_tid, after_time, energy, record_time) FROM stdin;
\.


--
-- Data for Name: isle_crop_enchants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.isle_crop_enchants (crop_id, effect_id, rest_time) FROM stdin;
\.


--
-- Data for Name: isle_elf_works; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.isle_elf_works (isle_id, category, elf_1, elf_2, elf_3, elf_4, elf_5, end_time) FROM stdin;
\.


--
-- Data for Name: isle_equipment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.isle_equipment (isle_id, loc_id, equipment_id, param) FROM stdin;
\.


--
-- Data for Name: isle_farm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.isle_farm (isle_id, category, loc, state, param) FROM stdin;
\.


--
-- Data for Name: isle_record; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.isle_record (id, isle_id, visitor_id, name, enter_time, leave_time, kill_count, kill_score, repair_count, repair_score, opened, divine_time, divine_buf_id, fish_count, fish_score, feed_fish, feed_fish_score) FROM stdin;
\.


--
-- Data for Name: isle_statue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.isle_statue (isle_id, monster_id, color) FROM stdin;
\.


--
-- Data for Name: isle_storage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.isle_storage (id, item_id, durability, maker, rank, identify, magic, embedded_amount, embedded_id1, embedded_id2, embedded_id3, embedded_id4, embedded_id5, embedded_id6, create_time, due_date, container_index, combo_id, strengthen, cur_maxdurability, bind, player_id, loc, lock_pwd, unlock_time, extra_combo_id1, extra_combo_id2, extra_combo_id3, extra_combo_id4, extra_combo_id5, extra_combo_id6, witchcraft, train_type, train_level, train_exp, ride_combo, ride_star_level, ride_point, awake_level, awake_potential, awake_addition, combo_rune_slot, rune_combo_id1, rune_combo_id2, rune_combo_id3, rune_combo_id4, rune_combo_id5) FROM stdin;
\.


--
-- Data for Name: item_exchange_stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item_exchange_stock (account_id, exchange_id, in_stock) FROM stdin;
\.


--
-- Data for Name: lover; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lover (id, coin, point, create_time, update_coin_time, message, is_married, mood, love_challenge1, love_challenge2) FROM stdin;
\.


--
-- Data for Name: mailitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mailitem (id, item_id, durability, maker, rank, identify, magic, embedded_amount, embedded_id1, embedded_id2, embedded_id3, embedded_id4, embedded_id5, embedded_id6, create_time, due_date, container_index, combo_id, strengthen, cur_maxdurability, bind, player_id, mail_id, lock_pwd, unlock_time, extra_combo_id1, extra_combo_id2, extra_combo_id3, extra_combo_id4, extra_combo_id5, extra_combo_id6, witchcraft, train_type, train_level, train_exp, ride_combo, ride_star_level, ride_point, awake_level, awake_potential, awake_addition, combo_rune_slot, rune_combo_id1, rune_combo_id2, rune_combo_id3, rune_combo_id4, rune_combo_id5) FROM stdin;
\.


--
-- Data for Name: mentorship; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mentorship (player_id, mentor_rank, mentor_point, daily_challenge, my_mentor_id, etc_flags) FROM stdin;
\.


--
-- Data for Name: message_board; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.message_board (message_id, title, content, player_name, create_date) FROM stdin;
\.


--
-- Data for Name: midnight_limit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.midnight_limit (player_id, function_type, due_date) FROM stdin;
\.


--
-- Data for Name: new_shortcut_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.new_shortcut_menu (player_id, index1, index2, index3, index4, index5, index6, index7, index8, index9, index10, index11, index12, index13, index14, index15, index16, index17, index18, index19, index20, index21, index22, index23, index24) FROM stdin;
\.


--
-- Data for Name: old_player_enchants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.old_player_enchants (player_id, effect_id, caster_id, rest_time, factor, counter, note, stack_count) FROM stdin;
\.


--
-- Data for Name: personal_mission_states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_mission_states (id, index, state) FROM stdin;
\.


--
-- Data for Name: player_achievement_rank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_achievement_rank (player_id, player_name, player_lv, player_class, update_time, total_point, monster_kill, festival_type, mission_type, lv01_instance_node, lv31_instance_node, lv46_instance_node, lv61_instance_node, lv76_instance_node, lv91_instance_node, family_boss, rare_monster, world_boss, activity, mission_chaslot, mission_elia, mission_gear, mission_arsalan, mission_bluewhale, mission_other, event_one, event_two, event_three, event_four, event_five, mission_deep, guess_point, history_guess_point, guess_answers, history_guess_answers, gladiator_win_count, gladiator_lose_count, gladiator_win_rate, gladiator_ko_count, event_six, anecdotes_chaslot, anecdotes_elia, anecdotes_gear, anecdotes_arsalan, anecdotes_bluewhale, anecdotes_deep, anecdotes_other, rebirth_count) FROM stdin;
\.


--
-- Data for Name: player_appellation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_appellation (player_id, appellation_id, create_time) FROM stdin;
\.


--
-- Data for Name: player_characters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_characters (id, given_name, node_id, x, y, z, face_dir, class_id, race_id, gender_id, hair, face, hair_color, skin_color, level, exp, skill_point, hp, max_hp, mp, max_mp, combo_point, gold, flags, quit, account_id, account_name, privilege, family_id, revive_area_id, expbonus_gettime, last_saving_time, current_level_time, channel_limit, login_time_limit, create_time, deleted_time, reputation, expand_storage_cnt, last_normal_area_id, note, present_exploit, total_exploit, rank, bank_duedate_1, bank_duedate_2, bank_duedate_3, bank_duedate_4, crystal, appellation, new_mail, add_family_time, spell_card_ground, spell_card_moon, spell_card_star, spell_card_sun, spell_card_ground2, spell_card_moon2, spell_card_star2, spell_card_sun2, family_msgboard_state, spell_card_attr, max_aa_point, aa_point, aa_exp, aa_rate, self_comment, family_comment, family_contribution_point, lover_id, given_name_change, elf_bot, marked_point, marked_point_id, recommended_events_time, society_option, lucky_bar_money, eqtrain_item_id, lottery_go_reward_1, lottery_go_reward_2, lottery_go_reward_3, isle_bank_duedate_1, isle_bank_duedate_2, isle_bank_duedate_3, isle_bank_duedate_4, collection_ability, postfix, guess_point, guess_answers, recommended_events_lv, recommended_events_star, re_star_buy_count, re_reward_id, ride_train_item_id, gladiator_last_update_time, gladiator_count, race_team_id, interim_race_team_id, arena_point, upanishad_1, upanishad_2, upanishad_3, upanishad_4, select_upanishad, equip_ride_item_id, daily_update_time, num_hello, hello_enable, greetings, rebirth_count, rebirth_score, rebirth_last_class, rebirth_last_level, rebirth_front_score, rebirth_store_exp, appellation_top1, appellation_top2, appellation_top3, equip_chair_item_id, elf_temple_team_id, equip_crystal_combo_item_id) FROM stdin;
\.


--
-- Data for Name: player_characters_achievement1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_characters_achievement1 (player_id, achievement_id, point) FROM stdin;
\.


--
-- Data for Name: player_characters_achievement2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_characters_achievement2 (player_id, achievement_id, point) FROM stdin;
\.


--
-- Data for Name: player_characters_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_characters_setting (player_id, elfpick_setting) FROM stdin;
\.


--
-- Data for Name: player_enchants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_enchants (player_id, effect_id, caster_id, rest_time, factor, counter, note, stack_count) FROM stdin;
\.


--
-- Data for Name: player_family_transform; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_family_transform (player_id, family_id, inviter_id, dead_line) FROM stdin;
\.


--
-- Data for Name: player_free_ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_free_ticket (account_id, free_tickets) FROM stdin;
\.


--
-- Data for Name: player_luckystar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_luckystar (player_id, lucky_ticket_str, lucky_ticket, phase, normal_type) FROM stdin;
\.


--
-- Data for Name: player_mail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_mail (id, receiver_id, sender_id, sender_name, send_time, due_date, title, content, item_id, gold, crystal, cod, opened, returned, authoritative) FROM stdin;
\.


--
-- Data for Name: player_spellcards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_spellcards (player_id, enchant_type, item_id) FROM stdin;
\.


--
-- Data for Name: player_spells; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_spells (player_id, spellmaster_id, spell_order) FROM stdin;
\.


--
-- Data for Name: prestige; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prestige (player_id, prestige_id, level, exp) FROM stdin;
\.


--
-- Data for Name: race_rank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.race_rank (race_id, player_id, player_name, family_name, class_id, level, last_date, race_record, race_best_record, rebirth_count) FROM stdin;
\.


--
-- Data for Name: race_record; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.race_record (player_id, race_id, month_best_time, best_time, record_date) FROM stdin;
\.


--
-- Data for Name: race_team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.race_team (id, name, leader, bulletin, create_date, race_count, recruit, class_filter, min_level, max_level, last_date) FROM stdin;
\.


--
-- Data for Name: race_team_member; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.race_team_member (team_id, player_id, flag, join_date) FROM stdin;
\.


--
-- Data for Name: race_team_rank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.race_team_rank (group_id, team_id, team_name, team_declare, last_date, race_id_1, race_count_1, race_record_1, race_id_2, race_count_2, race_record_2, race_id_3, race_count_3, race_record_3, race_id_4, race_count_4, race_record_4, race_id_5, race_count_5, race_record_5, race_id_6, race_count_6, race_record_6, race_id_7, race_count_7, race_record_7, race_id_8, race_count_8, race_record_8, race_id_9, race_count_9, race_record_9, race_id_10, race_count_10, race_record_10) FROM stdin;
\.


--
-- Data for Name: race_team_record; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.race_team_record (team_id, race_id, race_count, month_best_time, best_time, record_date) FROM stdin;
\.


--
-- Data for Name: race_team_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.race_team_request (team_id, player_id, name, class_id, level, request_date) FROM stdin;
\.


--
-- Data for Name: rank_award_mail_queue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rank_award_mail_queue (receiver_id, rank_template_id, award_item_index) FROM stdin;
\.


--
-- Data for Name: recommended_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recommended_events (player_id, recommended_id, count, target_number1, target_number2, target_number3, target_number4, target_number5, target_number) FROM stdin;
\.


--
-- Data for Name: recommended_events_old; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recommended_events_old (player_id, recommended_id, target_number) FROM stdin;
\.


--
-- Data for Name: server_fightking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.server_fightking (bonus, bonus_pool, system_recover, last_update_time, change_count, fightking_id, fightking_elf_name, fightking_elf_template_id, fightking_elf_model) FROM stdin;
0	0	0	0	0	0		0	0
\.


--
-- Data for Name: server_lucky_bar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.server_lucky_bar (zone_id, elf_no, elf_money) FROM stdin;
\.


--
-- Data for Name: server_luckystar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.server_luckystar (current_lucky_ticket_str, current_lucky_ticket, last_lucky_ticket_str, last_lucky_ticket, current_phase, bonus, phase_due_date, current_special, last_special) FROM stdin;
\.


--
-- Data for Name: server_luckystar_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.server_luckystar_log (phase, lucky_ticket_str, total_bonus, first_prize_count, second_prize_count, third_prize_count, first_prize, second_prize, third_prize, special_no) FROM stdin;
\.


--
-- Data for Name: server_shutdown; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.server_shutdown (server_id, shutdown_time) FROM stdin;
\.


--
-- Data for Name: serverstatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverstatus (id, name, ext_address, ext_port, int_address, int_port, last_start_time, last_vip_mail_time, next_itemmall_time, bf_count, last_race_reset_time, daily_awards_time_record, daily_awards_begin_date, daily_awards_flags) FROM stdin;
-2	MissionServer	none	-1	127.0.0.1	7654	0	0	0	0	0	0	0	0
1010	WorldServer101	0.0.0.0	5517	127.0.0.1	5518	0	0	0	0	0	0	0	0
1011	ZoneServer101	0.0.0.0	10010	127.0.0.1	10011	0	0	0	0	0	0	0	0
1020	WorldServer102	0.0.0.0	5527	127.0.0.1	5528	0	0	0	0	0	0	0	0
1021	ZoneServer102	0.0.0.0	10020	127.0.0.1	10021	0	0	0	0	0	0	0	0
1090	WorldServer109	0.0.0.0	5597	127.0.0.1	5598	0	0	0	0	0	0	0	0
1091	ZoneServer109	0.0.0.0	10090	127.0.0.1	10091	0	0	0	0	0	0	0	0
\.


--
-- Data for Name: shortcut_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shortcut_menu (character_id, page, index1, index2, index3, index4, index5, index6, index7, index8, index9, index10, index11, index12) FROM stdin;
\.


--
-- Data for Name: spell_storage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spell_storage (player_id, spell_id) FROM stdin;
\.


--
-- Data for Name: statistics_monster; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.statistics_monster (handle, template_id, death_count) FROM stdin;
\.


--
-- Data for Name: statistics_player; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.statistics_player (level, player_count, played_time) FROM stdin;
\.


--
-- Data for Name: statues_scenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.statues_scenes (worldserver_id, node_id, template_id, family_id, player_name, gender_id, face, hair, equip_head, equip_chest, equip_pants, equip_glove, equip_feet, equip_back, equip_right, equip_left, equip_shoot, weapon_active, ride_id, transform_id, action_id, frame_key) FROM stdin;
\.


--
-- Data for Name: storage1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.storage1 (id, item_id, durability, maker, rank, identify, magic, embedded_amount, embedded_id1, embedded_id2, embedded_id3, embedded_id4, embedded_id5, embedded_id6, create_time, due_date, container_index, combo_id, strengthen, cur_maxdurability, bind, player_id, loc, lock_pwd, unlock_time, extra_combo_id1, extra_combo_id2, extra_combo_id3, extra_combo_id4, extra_combo_id5, extra_combo_id6, witchcraft, train_type, train_level, train_exp, ride_combo, ride_star_level, ride_point, awake_level, awake_potential, awake_addition, combo_rune_slot, rune_combo_id1, rune_combo_id2, rune_combo_id3, rune_combo_id4, rune_combo_id5) FROM stdin;
\.


--
-- Data for Name: storage2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.storage2 (id, item_id, durability, maker, rank, identify, magic, embedded_amount, embedded_id1, embedded_id2, embedded_id3, embedded_id4, embedded_id5, embedded_id6, create_time, due_date, container_index, combo_id, strengthen, cur_maxdurability, bind, player_id, loc, lock_pwd, unlock_time, extra_combo_id1, extra_combo_id2, extra_combo_id3, extra_combo_id4, extra_combo_id5, extra_combo_id6, witchcraft, train_type, train_level, train_exp, ride_combo, ride_star_level, ride_point, awake_level, awake_potential, awake_addition, combo_rune_slot, rune_combo_id1, rune_combo_id2, rune_combo_id3, rune_combo_id4, rune_combo_id5) FROM stdin;
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (player_id, student_id) FROM stdin;
\.


--
-- Data for Name: sys_mail_queue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sys_mail_queue (receiver_id, title, content, gold, item_id, durability, maker, rank, identify, magic, embedded_amount, embedded_id1, embedded_id2, embedded_id3, embedded_id4, embedded_id5, embedded_id6, create_time, due_date, combo_id, strengthen, cur_maxdurability, bind, clone_item_id, state, extra_combo_id1, extra_combo_id2, extra_combo_id3, extra_combo_id4, extra_combo_id5, extra_combo_id6, sender_name, witchcraft, train_type, train_level, train_exp, ride_combo, ride_star_level, ride_point, awake_level, awake_potential, awake_addition, combo_rune_slot, rune_combo_id1, rune_combo_id2, rune_combo_id3, rune_combo_id4, rune_combo_id5) FROM stdin;
\.


--
-- Data for Name: sys_mail_queue_new; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sys_mail_queue_new (mail_id, receiver_id, clone_item_id, state, sender_name, title, content, gold, item_id, durability, maker, rank, identify, magic, embedded_amount, embedded_id1, embedded_id2, embedded_id3, embedded_id4, embedded_id5, embedded_id6, create_time, due_date, combo_id, strengthen, cur_maxdurability, bind, extra_combo_id1, extra_combo_id2, extra_combo_id3, extra_combo_id4, extra_combo_id5, extra_combo_id6, witchcraft, train_type, train_level, train_exp, ride_combo, ride_star_level, ride_point, awake_level, awake_potential, awake_addition, combo_rune_slot, rune_combo_id1, rune_combo_id2, rune_combo_id3, rune_combo_id4, rune_combo_id5) FROM stdin;
\.


--
-- Data for Name: territory_war; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.territory_war (territory_id, own_family_id, own_times) FROM stdin;
\.


--
-- Data for Name: transport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transport (player_id, node_id, eventarea_id) FROM stdin;
\.


--
-- Data for Name: victory_declaration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.victory_declaration (player_id, content) FROM stdin;
\.


--
-- Data for Name: vip; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vip (id, silver_time, golden_time) FROM stdin;
\.


--
-- Data for Name: vip_card; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vip_card (player_id, vip_id, received_day, set_time, next_time) FROM stdin;
\.


--
-- Name: family_crop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.family_crop_id_seq', 1, false);


--
-- Name: isle_crop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.isle_crop_id_seq', 1, false);


--
-- Name: isle_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.isle_record_id_seq', 1, false);


--
-- Name: race_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.race_team_id_seq', 1, false);


--
-- Name: sys_mail_queue_new_mail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sys_mail_queue_new_mail_id_seq', 1, false);


--
-- Name: account_shared account_shared_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_shared
    ADD CONSTRAINT account_shared_pkey PRIMARY KEY (account_id);


--
-- Name: auction auction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auction
    ADD CONSTRAINT auction_pkey PRIMARY KEY (id);


--
-- Name: bags bags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bags
    ADD CONSTRAINT bags_pkey PRIMARY KEY (id);


--
-- Name: battlefield_career battlefield_career_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.battlefield_career
    ADD CONSTRAINT battlefield_career_pkey PRIMARY KEY (player_id);


--
-- Name: battlefield_month battlefield_month_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.battlefield_month
    ADD CONSTRAINT battlefield_month_pkey PRIMARY KEY (player_id);


--
-- Name: beasts_tower_members beasts_tower_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beasts_tower_members
    ADD CONSTRAINT beasts_tower_members_pkey PRIMARY KEY (player_id);


--
-- Name: collection collection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_pkey PRIMARY KEY (id);


--
-- Name: configuration configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuration
    ADD CONSTRAINT configuration_pkey PRIMARY KEY (schema_version);


--
-- Name: daily_awards daily_awards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.daily_awards
    ADD CONSTRAINT daily_awards_pkey PRIMARY KEY (id);


--
-- Name: elf1 elf1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elf1
    ADD CONSTRAINT elf1_pkey PRIMARY KEY (elf_id);


--
-- Name: elf2 elf2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elf2
    ADD CONSTRAINT elf2_pkey PRIMARY KEY (elf_id);


--
-- Name: elf_container1 elf_container1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elf_container1
    ADD CONSTRAINT elf_container1_pkey PRIMARY KEY (id);


--
-- Name: elf_container2 elf_container2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elf_container2
    ADD CONSTRAINT elf_container2_pkey PRIMARY KEY (id);


--
-- Name: elf_temple_team elf_temple_team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elf_temple_team
    ADD CONSTRAINT elf_temple_team_pkey PRIMARY KEY (id);


--
-- Name: elfinventory elfinventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elfinventory
    ADD CONSTRAINT elfinventory_pkey PRIMARY KEY (id);


--
-- Name: equipment1 equipment1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment1
    ADD CONSTRAINT equipment1_pkey PRIMARY KEY (id);


--
-- Name: equipment2 equipment2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment2
    ADD CONSTRAINT equipment2_pkey PRIMARY KEY (id);


--
-- Name: family_achievement family_achievement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.family_achievement
    ADD CONSTRAINT family_achievement_pkey PRIMARY KEY (family_id, achievement_type);


--
-- Name: family_achievement_rank family_achievement_rank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.family_achievement_rank
    ADD CONSTRAINT family_achievement_rank_pkey PRIMARY KEY (family_id);


--
-- Name: family_battle_championship family_battle_championship_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.family_battle_championship
    ADD CONSTRAINT family_battle_championship_pkey PRIMARY KEY (game_num, family_id, rank);


--
-- Name: family_battle_data family_battle_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.family_battle_data
    ADD CONSTRAINT family_battle_data_pkey PRIMARY KEY (area_id);


--
-- Name: family_battle_rank family_battle_rank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.family_battle_rank
    ADD CONSTRAINT family_battle_rank_pkey PRIMARY KEY (family_id);


--
-- Name: family_battle_registration family_battle_registration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.family_battle_registration
    ADD CONSTRAINT family_battle_registration_pkey PRIMARY KEY (family_id);


--
-- Name: family_crop family_crop_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.family_crop
    ADD CONSTRAINT family_crop_pkey PRIMARY KEY (id);


--
-- Name: family family_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.family
    ADD CONSTRAINT family_pkey PRIMARY KEY (id);


--
-- Name: family_storage family_storage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.family_storage
    ADD CONSTRAINT family_storage_pkey PRIMARY KEY (id);


--
-- Name: fightking fightking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fightking
    ADD CONSTRAINT fightking_pkey PRIMARY KEY (player_id);


--
-- Name: final_mission_state1 final_mission_state1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.final_mission_state1
    ADD CONSTRAINT final_mission_state1_pkey PRIMARY KEY (player_id, index);


--
-- Name: final_mission_state2 final_mission_state2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.final_mission_state2
    ADD CONSTRAINT final_mission_state2_pkey PRIMARY KEY (player_id, index);


--
-- Name: friends friends_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_index PRIMARY KEY (player_id, friend_id);


--
-- Name: global_variables global_variables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.global_variables
    ADD CONSTRAINT global_variables_pkey PRIMARY KEY (id);


--
-- Name: gold_log gold_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gold_log
    ADD CONSTRAINT gold_log_pkey PRIMARY KEY (date);


--
-- Name: inventory1 inventory1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory1
    ADD CONSTRAINT inventory1_pkey PRIMARY KEY (id);


--
-- Name: inventory2 inventory2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory2
    ADD CONSTRAINT inventory2_pkey PRIMARY KEY (id);


--
-- Name: isle_achievement_rank isle_achievement_rank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.isle_achievement_rank
    ADD CONSTRAINT isle_achievement_rank_pkey PRIMARY KEY (isle_id);


--
-- Name: isle_crop isle_crop_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.isle_crop
    ADD CONSTRAINT isle_crop_pkey PRIMARY KEY (id);


--
-- Name: isle isle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.isle
    ADD CONSTRAINT isle_pkey PRIMARY KEY (isle_id);


--
-- Name: isle_record isle_record_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.isle_record
    ADD CONSTRAINT isle_record_pkey PRIMARY KEY (id);


--
-- Name: isle_storage isle_storage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.isle_storage
    ADD CONSTRAINT isle_storage_pkey PRIMARY KEY (id);


--
-- Name: lover lover_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lover
    ADD CONSTRAINT lover_pkey PRIMARY KEY (id);


--
-- Name: sys_mail_queue_new mail_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_mail_queue_new
    ADD CONSTRAINT mail_queue_pkey PRIMARY KEY (mail_id);


--
-- Name: mailitem mailitem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mailitem
    ADD CONSTRAINT mailitem_pkey PRIMARY KEY (id);


--
-- Name: mentorship mentorship_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mentorship
    ADD CONSTRAINT mentorship_pkey PRIMARY KEY (player_id);


--
-- Name: new_shortcut_menu new_shortcut_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.new_shortcut_menu
    ADD CONSTRAINT new_shortcut_menu_pkey PRIMARY KEY (player_id);


--
-- Name: player_achievement_rank player_achievement_rank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_achievement_rank
    ADD CONSTRAINT player_achievement_rank_pkey PRIMARY KEY (player_id);


--
-- Name: player_characters_achievement1 player_characters_achievement1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_characters_achievement1
    ADD CONSTRAINT player_characters_achievement1_pkey PRIMARY KEY (player_id, achievement_id);


--
-- Name: player_characters_achievement2 player_characters_achievement2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_characters_achievement2
    ADD CONSTRAINT player_characters_achievement2_pkey PRIMARY KEY (player_id, achievement_id);


--
-- Name: player_characters player_characters_given_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_characters
    ADD CONSTRAINT player_characters_given_name_key UNIQUE (given_name);


--
-- Name: player_characters player_characters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_characters
    ADD CONSTRAINT player_characters_pkey PRIMARY KEY (id);


--
-- Name: player_characters_setting player_characters_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_characters_setting
    ADD CONSTRAINT player_characters_setting_pkey PRIMARY KEY (player_id);


--
-- Name: player_free_ticket player_free_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_free_ticket
    ADD CONSTRAINT player_free_ticket_pkey PRIMARY KEY (account_id);


--
-- Name: player_mail player_mail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_mail
    ADD CONSTRAINT player_mail_pkey PRIMARY KEY (id);


--
-- Name: player_spells player_spells_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_spells
    ADD CONSTRAINT player_spells_index PRIMARY KEY (player_id, spellmaster_id);


--
-- Name: prestige prestige_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestige
    ADD CONSTRAINT prestige_pkey PRIMARY KEY (player_id, prestige_id);


--
-- Name: race_team race_team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.race_team
    ADD CONSTRAINT race_team_pkey PRIMARY KEY (id);


--
-- Name: recommended_events_old recommended_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recommended_events_old
    ADD CONSTRAINT recommended_events_pkey PRIMARY KEY (player_id, recommended_id);


--
-- Name: recommended_events recommended_events_pkey1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recommended_events
    ADD CONSTRAINT recommended_events_pkey1 PRIMARY KEY (player_id, recommended_id);


--
-- Name: serverstatus serverstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverstatus
    ADD CONSTRAINT serverstatus_pkey PRIMARY KEY (id);


--
-- Name: statistics_monster statistics_monster_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statistics_monster
    ADD CONSTRAINT statistics_monster_pkey PRIMARY KEY (handle);


--
-- Name: statistics_player statistics_player_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statistics_player
    ADD CONSTRAINT statistics_player_pkey PRIMARY KEY (level);


--
-- Name: statues_scenes statues_scenes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statues_scenes
    ADD CONSTRAINT statues_scenes_pkey PRIMARY KEY (worldserver_id, node_id, template_id, family_id);


--
-- Name: storage1 storage1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage1
    ADD CONSTRAINT storage1_pkey PRIMARY KEY (id);


--
-- Name: storage2 storage2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage2
    ADD CONSTRAINT storage2_pkey PRIMARY KEY (id);


--
-- Name: territory_war territory_war_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.territory_war
    ADD CONSTRAINT territory_war_pkey PRIMARY KEY (territory_id);


--
-- Name: victory_declaration victory_declaration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.victory_declaration
    ADD CONSTRAINT victory_declaration_pkey PRIMARY KEY (player_id);


--
-- Name: vip_card vip_card_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vip_card
    ADD CONSTRAINT vip_card_pkey PRIMARY KEY (player_id);


--
-- Name: advanced_ability_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX advanced_ability_index ON public.advanced_ability USING btree (player_id, effect_id);


--
-- Name: auction_auction_price_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auction_auction_price_index ON public.auction USING btree (auction_price);


--
-- Name: auction_class_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auction_class_index ON public.auction USING btree (class);


--
-- Name: auction_duedate_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auction_duedate_index ON public.auction USING btree (auction_duedate);


--
-- Name: auction_item_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auction_item_type_index ON public.auction USING btree (item_type);


--
-- Name: auction_level_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auction_level_index ON public.auction USING btree (level);


--
-- Name: auction_quality_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auction_quality_index ON public.auction USING btree (quality);


--
-- Name: auction_seller_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auction_seller_index ON public.auction USING btree (seller_id);


--
-- Name: bags_loc_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX bags_loc_index ON public.bags USING btree (player_id, loc, container_index);


--
-- Name: bags_pi_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bags_pi_index ON public.bags USING btree (player_id);


--
-- Name: collection_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX collection_index ON public.collection USING btree (account_id);


--
-- Name: elf1_ci_player_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX elf1_ci_player_id_index ON public.elf1 USING btree (elf_id, player_id);


--
-- Name: elf2_ci_player_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX elf2_ci_player_id_index ON public.elf2 USING btree (elf_id, player_id);


--
-- Name: elf_container1_con_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX elf_container1_con_index ON public.elf_container1 USING btree (player_id, container_index);


--
-- Name: elf_container1_loc_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX elf_container1_loc_index ON public.elf_container1 USING btree (elf_id, loc);


--
-- Name: elf_container2_con_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX elf_container2_con_index ON public.elf_container2 USING btree (player_id, container_index);


--
-- Name: elf_container2_loc_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX elf_container2_loc_index ON public.elf_container2 USING btree (elf_id, loc);


--
-- Name: elf_shortcut_menu_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX elf_shortcut_menu_index ON public.elf_shortcut_menu USING btree (player_id);


--
-- Name: elf_skills_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX elf_skills_index ON public.elf_skills USING btree (player_id);


--
-- Name: elfinventory_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX elfinventory_index ON public.elfinventory USING btree (player_id, loc, container_index);


--
-- Name: elfinventory_player_container_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX elfinventory_player_container_index ON public.elfinventory USING btree (player_id, container_index);


--
-- Name: elfinventory_player_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX elfinventory_player_index ON public.elfinventory USING btree (player_id);


--
-- Name: equipment1_loc_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX equipment1_loc_index ON public.equipment1 USING btree (player_id, container_index, loc);


--
-- Name: equipment2_loc_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX equipment2_loc_index ON public.equipment2 USING btree (player_id, container_index, loc);


--
-- Name: family_achievement_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX family_achievement_index ON public.family_achievement USING btree (family_id, achievement_type);


--
-- Name: family_achievement_log_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX family_achievement_log_index ON public.family_achievement_log USING btree (log_id, family_id);


--
-- Name: family_battle_championship_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX family_battle_championship_index ON public.family_battle_championship USING btree (game_num, family_id, rank);


--
-- Name: family_battle_data_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX family_battle_data_index ON public.family_battle_data USING btree (area_id, family_id);


--
-- Name: family_cadre_members_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX family_cadre_members_index ON public.family_cadre_members USING btree (family_id, player_id);


--
-- Name: family_crop_enchants_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX family_crop_enchants_index ON public.family_crop_enchants USING btree (crop_id);


--
-- Name: family_crop_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX family_crop_index ON public.family_crop USING btree (family_id);


--
-- Name: family_farm_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX family_farm_index ON public.family_farm USING btree (family_id);


--
-- Name: family_message_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX family_message_id_index ON public.family_msgboard USING btree (family_id, message_id);


--
-- Name: family_storage_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX family_storage_index ON public.family_storage USING btree (family_id);


--
-- Name: family_storage_log_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX family_storage_log_index ON public.family_storage_log USING btree (family_id);


--
-- Name: family_tree_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX family_tree_index ON public.family_tree USING btree (family_id);


--
-- Name: friends_fi_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX friends_fi_index ON public.friends USING btree (friend_id);


--
-- Name: friends_pi_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX friends_pi_index ON public.friends USING btree (player_id);


--
-- Name: gold_log_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gold_log_index ON public.gold_log USING btree (date);


--
-- Name: illplugininfo_accountname_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX illplugininfo_accountname_index ON public.illplugininfo USING btree (accountname);


--
-- Name: illplugininfo_datetime_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX illplugininfo_datetime_index ON public.illplugininfo USING btree (datetime);


--
-- Name: illplugininfo_modulename_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX illplugininfo_modulename_index ON public.illplugininfo USING btree (modulename);


--
-- Name: illplugininfo_playerip_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX illplugininfo_playerip_index ON public.illplugininfo USING btree (playerip);


--
-- Name: illplugininfo_playername_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX illplugininfo_playername_index ON public.illplugininfo USING btree (playername);


--
-- Name: inventory1_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX inventory1_index ON public.inventory1 USING btree (player_id, container_index, loc);


--
-- Name: inventory2_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX inventory2_index ON public.inventory2 USING btree (player_id, container_index, loc);


--
-- Name: isle_altar_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX isle_altar_index ON public.isle_altar USING btree (isle_id);


--
-- Name: isle_blacklist_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX isle_blacklist_index ON public.isle_blacklist USING btree (isle_id);


--
-- Name: isle_crop_enchants_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX isle_crop_enchants_index ON public.isle_crop_enchants USING btree (crop_id);


--
-- Name: isle_crop_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX isle_crop_index ON public.isle_crop USING btree (isle_id);


--
-- Name: isle_elf_works_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX isle_elf_works_index ON public.isle_elf_works USING btree (isle_id);


--
-- Name: isle_equipment_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX isle_equipment_index ON public.isle_equipment USING btree (isle_id);


--
-- Name: isle_farm_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX isle_farm_index ON public.isle_farm USING btree (isle_id);


--
-- Name: isle_record_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX isle_record_index ON public.isle_record USING btree (isle_id);


--
-- Name: isle_record_time_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX isle_record_time_index ON public.isle_record USING btree (leave_time);


--
-- Name: isle_statue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX isle_statue_index ON public.isle_statue USING btree (isle_id);


--
-- Name: isle_storage_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX isle_storage_index ON public.isle_storage USING btree (player_id, loc, container_index);


--
-- Name: isle_storage_player_container_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX isle_storage_player_container_index ON public.isle_storage USING btree (player_id, container_index);


--
-- Name: isle_storage_player_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX isle_storage_player_index ON public.isle_storage USING btree (player_id);


--
-- Name: mailitem_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mailitem_index ON public.mailitem USING btree (item_id);


--
-- Name: mailitem_mailid_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX mailitem_mailid_index ON public.mailitem USING btree (player_id, mail_id);


--
-- Name: midnight_limit_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX midnight_limit_index ON public.midnight_limit USING btree (player_id, function_type);


--
-- Name: midnight_limit_player_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX midnight_limit_player_index ON public.midnight_limit USING btree (player_id);


--
-- Name: personal_mission_states_pi_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_mission_states_pi_index ON public.personal_mission_states USING btree (id, index);


--
-- Name: player_appellation_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX player_appellation_index ON public.player_appellation USING btree (player_id);


--
-- Name: player_cardloc_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX player_cardloc_index ON public.player_spellcards USING btree (player_id, enchant_type);


--
-- Name: player_characters_account_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX player_characters_account_id_index ON public.player_characters USING btree (account_id);


--
-- Name: player_characters_account_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX player_characters_account_name_index ON public.player_characters USING btree (account_name);


--
-- Name: player_characters_family_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX player_characters_family_id_index ON public.player_characters USING btree (family_id);


--
-- Name: player_characters_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX player_characters_index ON public.player_characters USING btree (lover_id);


--
-- Name: player_characters_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX player_characters_name_index ON public.player_characters USING btree (given_name);


--
-- Name: player_characters_node_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX player_characters_node_index ON public.player_characters USING btree (node_id);


--
-- Name: player_enchants_pi_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX player_enchants_pi_index ON public.player_enchants USING btree (player_id);


--
-- Name: player_family_transform_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX player_family_transform_index ON public.player_family_transform USING btree (player_id);


--
-- Name: player_luckystar_player_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX player_luckystar_player_index ON public.player_luckystar USING btree (player_id);


--
-- Name: player_luckystar_ticket_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX player_luckystar_ticket_index ON public.player_luckystar USING btree (lucky_ticket_str, phase);


--
-- Name: player_mail_receiver_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX player_mail_receiver_id_index ON public.player_mail USING btree (receiver_id, id);


--
-- Name: player_mail_sender_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX player_mail_sender_index ON public.player_mail USING btree (sender_id);


--
-- Name: player_spells_pi_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX player_spells_pi_index ON public.player_spells USING btree (player_id);


--
-- Name: race_rank_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX race_rank_id_index ON public.race_rank USING btree (race_id);


--
-- Name: race_record_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX race_record_index ON public.race_record USING btree (player_id);


--
-- Name: race_team_member_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX race_team_member_index ON public.race_team_member USING btree (team_id);


--
-- Name: race_team_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX race_team_name_index ON public.race_team USING btree (name);


--
-- Name: race_team_rank_group_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX race_team_rank_group_id_index ON public.race_team_rank USING btree (group_id);


--
-- Name: race_team_record_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX race_team_record_index ON public.race_team_record USING btree (team_id);


--
-- Name: race_team_request_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX race_team_request_index ON public.race_team_request USING btree (team_id);


--
-- Name: rank_award_mail_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rank_award_mail_queue_index ON public.rank_award_mail_queue USING btree (receiver_id);


--
-- Name: recommended_events_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recommended_events_index ON public.recommended_events USING btree (player_id);


--
-- Name: server_lucky_bar_elf_no_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX server_lucky_bar_elf_no_index ON public.server_lucky_bar USING btree (elf_no);


--
-- Name: server_lucky_bar_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX server_lucky_bar_index ON public.server_lucky_bar USING btree (zone_id);


--
-- Name: shortcut_menu_ci_page_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX shortcut_menu_ci_page_index ON public.shortcut_menu USING btree (character_id, page);


--
-- Name: spell_storage_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX spell_storage_index ON public.spell_storage USING btree (player_id);


--
-- Name: storage1_loc_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX storage1_loc_index ON public.storage1 USING btree (player_id, container_index, loc);


--
-- Name: storage2_loc_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX storage2_loc_index ON public.storage2 USING btree (player_id, container_index, loc);


--
-- Name: students_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX students_index ON public.students USING btree (player_id);


--
-- Name: sys_mail_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_mail_queue_index ON public.sys_mail_queue USING btree (receiver_id);


--
-- Name: sys_mail_queue_receiver_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_mail_queue_receiver_index ON public.sys_mail_queue_new USING btree (receiver_id);


--
-- Name: territory_war_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX territory_war_index ON public.territory_war USING btree (territory_id);


--
-- Name: transport_ci_node_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX transport_ci_node_index ON public.transport USING btree (player_id, node_id);


--
-- Name: vip_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vip_index ON public.vip USING btree (id);


--
-- Name: TABLE serverstatus; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.serverstatus TO PUBLIC;


--
-- PostgreSQL database dump complete
--

