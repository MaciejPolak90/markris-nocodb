--
-- PostgreSQL database dump
--

\restrict pg88XZdzbHo9ff9il6vb9MYuX4KnccJ2AQSfMbMoEESQvv2k8c712o0QFFTqhr0

-- Dumped from database version 16.11
-- Dumped by pg_dump version 16.11

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
-- Name: p3llodmezayxe7x; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA p3llodmezayxe7x;


--
-- Name: ptbstfo5b36htsq; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA ptbstfo5b36htsq;


--
-- Name: pupuc6ugup9dm03; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA pupuc6ugup9dm03;


--
-- Name: to_date_time_safe(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.to_date_time_safe(value text, format text) RETURNS timestamp without time zone
    LANGUAGE plpgsql
    AS $$
  BEGIN
    RETURN to_timestamp(value, format);
    EXCEPTION
      WHEN others THEN RETURN NULL;  
  END;
  $$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: 1_CLIENTS; Type: TABLE; Schema: p3llodmezayxe7x; Owner: -
--

CREATE TABLE p3llodmezayxe7x."1_CLIENTS" (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    nc_order numeric,
    "Company_Name" text,
    "VAT_ID" text,
    "Address" text,
    "Email" character varying,
    "Phone" character varying,
    "Notes" text
);


--
-- Name: 1_CLIENTS_id_seq; Type: SEQUENCE; Schema: p3llodmezayxe7x; Owner: -
--

CREATE SEQUENCE p3llodmezayxe7x."1_CLIENTS_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: 1_CLIENTS_id_seq; Type: SEQUENCE OWNED BY; Schema: p3llodmezayxe7x; Owner: -
--

ALTER SEQUENCE p3llodmezayxe7x."1_CLIENTS_id_seq" OWNED BY p3llodmezayxe7x."1_CLIENTS".id;


--
-- Name: 2_CONTACTS; Type: TABLE; Schema: p3llodmezayxe7x; Owner: -
--

CREATE TABLE p3llodmezayxe7x."2_CONTACTS" (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    nc_order numeric,
    "Full_Name" text,
    "Position" text,
    "Email" character varying,
    "Phone" character varying,
    "Primary_Contact" boolean DEFAULT false
);


--
-- Name: 2_CONTACTS_id_seq; Type: SEQUENCE; Schema: p3llodmezayxe7x; Owner: -
--

CREATE SEQUENCE p3llodmezayxe7x."2_CONTACTS_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: 2_CONTACTS_id_seq; Type: SEQUENCE OWNED BY; Schema: p3llodmezayxe7x; Owner: -
--

ALTER SEQUENCE p3llodmezayxe7x."2_CONTACTS_id_seq" OWNED BY p3llodmezayxe7x."2_CONTACTS".id;


--
-- Name: 3_VEHICLES; Type: TABLE; Schema: p3llodmezayxe7x; Owner: -
--

CREATE TABLE p3llodmezayxe7x."3_VEHICLES" (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    nc_order numeric,
    "Registration_Number" text,
    "Body_Type" text,
    "Capacity_kg" bigint,
    "Capacity_m3" bigint,
    "Pallet_Spaces" bigint,
    "ADR" boolean DEFAULT false,
    "ADR_Classes" text,
    "Inspection_Date" date,
    "Insurance_Expiry" date,
    "Notes" text
);


--
-- Name: 3_VEHICLES_id_seq; Type: SEQUENCE; Schema: p3llodmezayxe7x; Owner: -
--

CREATE SEQUENCE p3llodmezayxe7x."3_VEHICLES_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: 3_VEHICLES_id_seq; Type: SEQUENCE OWNED BY; Schema: p3llodmezayxe7x; Owner: -
--

ALTER SEQUENCE p3llodmezayxe7x."3_VEHICLES_id_seq" OWNED BY p3llodmezayxe7x."3_VEHICLES".id;


--
-- Name: 4_DRIVERS; Type: TABLE; Schema: p3llodmezayxe7x; Owner: -
--

CREATE TABLE p3llodmezayxe7x."4_DRIVERS" (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    nc_order numeric,
    "Full_Name" text,
    "Phone" character varying,
    "License_Categories" text,
    "ADR" boolean DEFAULT false,
    "ADR_Classes" text,
    "ADR_Expiry_Date" date,
    "Medical_Exam_Expiry" date,
    "Notes" text
);


--
-- Name: 4_DRIVERS_id_seq; Type: SEQUENCE; Schema: p3llodmezayxe7x; Owner: -
--

CREATE SEQUENCE p3llodmezayxe7x."4_DRIVERS_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: 4_DRIVERS_id_seq; Type: SEQUENCE OWNED BY; Schema: p3llodmezayxe7x; Owner: -
--

ALTER SEQUENCE p3llodmezayxe7x."4_DRIVERS_id_seq" OWNED BY p3llodmezayxe7x."4_DRIVERS".id;


--
-- Name: 5_INQUIRIES; Type: TABLE; Schema: p3llodmezayxe7x; Owner: -
--

CREATE TABLE p3llodmezayxe7x."5_INQUIRIES" (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    nc_order numeric,
    "Inquiry_Date" timestamp without time zone,
    "Origin_City_Postal" text,
    "Destination_City_Postal" text,
    "Loading_Date" date,
    "Delivery_Date" date,
    "Cargo_Type" text,
    "ADR" boolean DEFAULT false,
    "ADR_Class_UN" text,
    "Dimensions" text,
    "Weight_kg" bigint,
    "Status" text,
    "Source" text,
    "UTM_Source" text,
    "Notes" text
);


--
-- Name: 5_INQUIRIES_id_seq; Type: SEQUENCE; Schema: p3llodmezayxe7x; Owner: -
--

CREATE SEQUENCE p3llodmezayxe7x."5_INQUIRIES_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: 5_INQUIRIES_id_seq; Type: SEQUENCE OWNED BY; Schema: p3llodmezayxe7x; Owner: -
--

ALTER SEQUENCE p3llodmezayxe7x."5_INQUIRIES_id_seq" OWNED BY p3llodmezayxe7x."5_INQUIRIES".id;


--
-- Name: 6_TRANSPORTS; Type: TABLE; Schema: p3llodmezayxe7x; Owner: -
--

CREATE TABLE p3llodmezayxe7x."6_TRANSPORTS" (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    nc_order numeric,
    "Departure_Date" date,
    "Origin" text,
    "Destination" text,
    "Status" text,
    "Notes" text,
    "Transport_Capacity__" double precision
);


--
-- Name: 6_TRANSPORTS_id_seq; Type: SEQUENCE; Schema: p3llodmezayxe7x; Owner: -
--

CREATE SEQUENCE p3llodmezayxe7x."6_TRANSPORTS_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: 6_TRANSPORTS_id_seq; Type: SEQUENCE OWNED BY; Schema: p3llodmezayxe7x; Owner: -
--

ALTER SEQUENCE p3llodmezayxe7x."6_TRANSPORTS_id_seq" OWNED BY p3llodmezayxe7x."6_TRANSPORTS".id;


--
-- Name: 7_FREIGHTS; Type: TABLE; Schema: p3llodmezayxe7x; Owner: -
--

CREATE TABLE p3llodmezayxe7x."7_FREIGHTS" (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    nc_order numeric,
    "Client" text,
    "Unit_Type" text,
    "Quantity" bigint,
    "Cargo_Description" text,
    "Pickup_Address" text,
    "Delivery_Address" text,
    "Freight_Price_EUR" numeric,
    "Invoiced" boolean DEFAULT false,
    "Invoice_Number" text,
    "Notes" text
);


--
-- Name: 7_FREIGHTS_id_seq; Type: SEQUENCE; Schema: p3llodmezayxe7x; Owner: -
--

CREATE SEQUENCE p3llodmezayxe7x."7_FREIGHTS_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: 7_FREIGHTS_id_seq; Type: SEQUENCE OWNED BY; Schema: p3llodmezayxe7x; Owner: -
--

ALTER SEQUENCE p3llodmezayxe7x."7_FREIGHTS_id_seq" OWNED BY p3llodmezayxe7x."7_FREIGHTS".id;


--
-- Name: _nc_m2m_1_CLIENTS_2_CONTACTS; Type: TABLE; Schema: p3llodmezayxe7x; Owner: -
--

CREATE TABLE p3llodmezayxe7x."_nc_m2m_1_CLIENTS_2_CONTACTS" (
    "2_CONTACTS_id" integer NOT NULL,
    "1_CLIENTS_id" integer NOT NULL
);


--
-- Name: _nc_m2m_1_CLIENTS_5_INQUIRIES; Type: TABLE; Schema: p3llodmezayxe7x; Owner: -
--

CREATE TABLE p3llodmezayxe7x."_nc_m2m_1_CLIENTS_5_INQUIRIES" (
    "5_INQUIRIES_id" integer NOT NULL,
    "1_CLIENTS_id" integer NOT NULL
);


--
-- Name: _nc_m2m_1_CLIENTS_7_FREIGHTS; Type: TABLE; Schema: p3llodmezayxe7x; Owner: -
--

CREATE TABLE p3llodmezayxe7x."_nc_m2m_1_CLIENTS_7_FREIGHTS" (
    "7_FREIGHTS_id" integer NOT NULL,
    "1_CLIENTS_id" integer NOT NULL
);


--
-- Name: _nc_m2m_2_CONTACTS_5_INQUIRIES; Type: TABLE; Schema: p3llodmezayxe7x; Owner: -
--

CREATE TABLE p3llodmezayxe7x."_nc_m2m_2_CONTACTS_5_INQUIRIES" (
    "5_INQUIRIES_id" integer NOT NULL,
    "2_CONTACTS_id" integer NOT NULL
);


--
-- Name: _nc_m2m_3_VEHICLES_4_DRIVERS; Type: TABLE; Schema: p3llodmezayxe7x; Owner: -
--

CREATE TABLE p3llodmezayxe7x."_nc_m2m_3_VEHICLES_4_DRIVERS" (
    "4_DRIVERS_id" integer NOT NULL,
    "3_VEHICLES_id" integer NOT NULL
);


--
-- Name: _nc_m2m_3_VEHICLES_6_TRANSPORTS; Type: TABLE; Schema: p3llodmezayxe7x; Owner: -
--

CREATE TABLE p3llodmezayxe7x."_nc_m2m_3_VEHICLES_6_TRANSPORTS" (
    "6_TRANSPORTS_id" integer NOT NULL,
    "3_VEHICLES_id" integer NOT NULL
);


--
-- Name: _nc_m2m_4_DRIVERS_6_TRANSPORTS; Type: TABLE; Schema: p3llodmezayxe7x; Owner: -
--

CREATE TABLE p3llodmezayxe7x."_nc_m2m_4_DRIVERS_6_TRANSPORTS" (
    "6_TRANSPORTS_id" integer NOT NULL,
    "4_DRIVERS_id" integer NOT NULL
);


--
-- Name: _nc_m2m_6_TRANSPORTS_7_FREIGHTS; Type: TABLE; Schema: p3llodmezayxe7x; Owner: -
--

CREATE TABLE p3llodmezayxe7x."_nc_m2m_6_TRANSPORTS_7_FREIGHTS" (
    "7_FREIGHTS_id" integer NOT NULL,
    "6_TRANSPORTS_id" integer NOT NULL
);


--
-- Name: Features; Type: TABLE; Schema: ptbstfo5b36htsq; Owner: -
--

CREATE TABLE ptbstfo5b36htsq."Features" (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by character varying,
    updated_by character varying,
    nc_order numeric,
    title text
);


--
-- Name: Features_id_seq; Type: SEQUENCE; Schema: ptbstfo5b36htsq; Owner: -
--

CREATE SEQUENCE ptbstfo5b36htsq."Features_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Features_id_seq; Type: SEQUENCE OWNED BY; Schema: ptbstfo5b36htsq; Owner: -
--

ALTER SEQUENCE ptbstfo5b36htsq."Features_id_seq" OWNED BY ptbstfo5b36htsq."Features".id;


--
-- Name: nc_api_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_api_tokens (
    id integer NOT NULL,
    base_id character varying(20),
    db_alias character varying(255),
    description character varying(255),
    permissions text,
    token text,
    expiry character varying(255),
    enabled boolean DEFAULT true,
    fk_user_id character varying(20),
    fk_workspace_id character varying(20),
    fk_sso_client_id character varying(20),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: nc_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.nc_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nc_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.nc_api_tokens_id_seq OWNED BY public.nc_api_tokens.id;


--
-- Name: nc_audit_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_audit_v2 (
    id uuid NOT NULL,
    "user" character varying(255),
    ip character varying(255),
    source_id character varying(20),
    base_id character varying(20),
    fk_model_id character varying(20),
    row_id character varying(255),
    op_type character varying(255),
    op_sub_type character varying(255),
    status character varying(255),
    description text,
    details text,
    fk_user_id character varying(20),
    fk_ref_id character varying(20),
    fk_parent_id uuid,
    fk_workspace_id character varying(20),
    fk_org_id character varying(20),
    user_agent text,
    version smallint DEFAULT '0'::smallint,
    old_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_automation_executions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_automation_executions (
    id character varying(20) NOT NULL,
    fk_workspace_id character varying(20),
    base_id character varying(20) NOT NULL,
    fk_workflow_id character varying(20) NOT NULL,
    workflow_data text,
    execution_data text,
    finished boolean DEFAULT false,
    started_at timestamp with time zone,
    finished_at timestamp with time zone,
    status character varying(50),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    resume_at timestamp with time zone
);


--
-- Name: nc_automations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_automations (
    id character varying(20) NOT NULL,
    title character varying(255),
    description text,
    meta text,
    fk_workspace_id character varying(20),
    base_id character varying(20) NOT NULL,
    "order" real,
    type character varying(20),
    created_by character varying(20),
    updated_by character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    enabled boolean DEFAULT false,
    nodes text,
    edges text,
    draft text,
    config text,
    script text
);


--
-- Name: nc_base_users_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_base_users_v2 (
    base_id character varying(20) NOT NULL,
    fk_user_id character varying(20) NOT NULL,
    roles text,
    starred boolean,
    pinned boolean,
    "group" character varying(255),
    color character varying(255),
    "order" real,
    hidden real,
    opened_date timestamp with time zone,
    invited_by character varying(20),
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_bases_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_bases_v2 (
    id character varying(128) NOT NULL,
    title character varying(255),
    prefix character varying(255),
    status character varying(255),
    description text,
    meta text,
    color character varying(255),
    uuid character varying(255),
    password character varying(255),
    roles character varying(255),
    deleted boolean DEFAULT false,
    is_meta boolean,
    "order" real,
    type character varying(200),
    fk_workspace_id character varying(20),
    is_snapshot boolean DEFAULT false,
    fk_custom_url_id character varying(20),
    version smallint DEFAULT '2'::smallint,
    default_role character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    sandbox_master boolean DEFAULT false,
    sandbox_id character varying(20),
    sandbox_version_id character varying(20),
    auto_update boolean DEFAULT true
);


--
-- Name: nc_calendar_view_columns_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_calendar_view_columns_v2 (
    id character varying(20) NOT NULL,
    base_id character varying(20) NOT NULL,
    source_id character varying(20),
    fk_view_id character varying(20),
    fk_column_id character varying(20),
    show boolean,
    bold boolean,
    underline boolean,
    italic boolean,
    "order" real,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_calendar_view_range_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_calendar_view_range_v2 (
    id character varying(20) NOT NULL,
    fk_view_id character varying(20),
    fk_to_column_id character varying(20),
    label character varying(40),
    fk_from_column_id character varying(20),
    base_id character varying(20) NOT NULL,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_calendar_view_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_calendar_view_v2 (
    fk_view_id character varying(20) NOT NULL,
    base_id character varying(20) NOT NULL,
    source_id character varying(20),
    title character varying(255),
    fk_cover_image_col_id character varying(20),
    meta text,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: nc_col_barcode_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_col_barcode_v2 (
    id character varying(20) NOT NULL,
    fk_column_id character varying(20),
    fk_barcode_value_column_id character varying(20),
    barcode_format character varying(15),
    deleted boolean,
    base_id character varying(20) NOT NULL,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_col_button_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_col_button_v2 (
    id character varying(20) NOT NULL,
    base_id character varying(20) NOT NULL,
    type character varying(255),
    label text,
    theme character varying(255),
    color character varying(255),
    icon character varying(255),
    formula text,
    formula_raw text,
    error character varying(255),
    parsed_tree text,
    fk_webhook_id character varying(20),
    fk_column_id character varying(20),
    fk_integration_id character varying(20),
    model character varying(255),
    output_column_ids text,
    fk_workspace_id character varying(20),
    fk_script_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_col_formula_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_col_formula_v2 (
    id character varying(20) NOT NULL,
    fk_column_id character varying(20),
    formula text NOT NULL,
    formula_raw text,
    error text,
    deleted boolean,
    "order" real,
    parsed_tree text,
    base_id character varying(20) NOT NULL,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_col_long_text_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_col_long_text_v2 (
    id character varying(20) NOT NULL,
    fk_workspace_id character varying(20),
    base_id character varying(20) NOT NULL,
    fk_model_id character varying(20),
    fk_column_id character varying(20),
    fk_integration_id character varying(20),
    model character varying(255),
    prompt text,
    prompt_raw text,
    error text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_col_lookup_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_col_lookup_v2 (
    id character varying(20) NOT NULL,
    fk_column_id character varying(20),
    fk_relation_column_id character varying(20),
    fk_lookup_column_id character varying(20),
    deleted boolean,
    base_id character varying(20) NOT NULL,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_col_qrcode_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_col_qrcode_v2 (
    id character varying(20) NOT NULL,
    fk_column_id character varying(20),
    fk_qr_value_column_id character varying(20),
    deleted boolean,
    "order" real,
    base_id character varying(20) NOT NULL,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_col_relations_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_col_relations_v2 (
    id character varying(20) NOT NULL,
    ref_db_alias character varying(255),
    type character varying(255),
    virtual boolean,
    db_type character varying(255),
    fk_column_id character varying(20),
    fk_related_model_id character varying(20),
    fk_child_column_id character varying(20),
    fk_parent_column_id character varying(20),
    fk_mm_model_id character varying(20),
    fk_mm_child_column_id character varying(20),
    fk_mm_parent_column_id character varying(20),
    ur character varying(255),
    dr character varying(255),
    fk_index_name character varying(255),
    deleted boolean,
    fk_target_view_id character varying(20),
    base_id character varying(20) NOT NULL,
    fk_workspace_id character varying(20),
    fk_related_base_id character varying(20),
    fk_mm_base_id character varying(20),
    fk_related_source_id character varying(20),
    fk_mm_source_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_col_rollup_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_col_rollup_v2 (
    id character varying(20) NOT NULL,
    fk_column_id character varying(20),
    fk_relation_column_id character varying(20),
    fk_rollup_column_id character varying(20),
    rollup_function character varying(255),
    deleted boolean,
    base_id character varying(20) NOT NULL,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_col_select_options_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_col_select_options_v2 (
    id character varying(20) NOT NULL,
    fk_column_id character varying(20),
    title character varying(255),
    color character varying(255),
    "order" real,
    base_id character varying(20) NOT NULL,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_columns_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_columns_v2 (
    id character varying(20) NOT NULL,
    source_id character varying(20),
    base_id character varying(20) NOT NULL,
    fk_model_id character varying(20),
    title character varying(255),
    column_name character varying(255),
    uidt character varying(255),
    dt character varying(255),
    np character varying(255),
    ns character varying(255),
    clen character varying(255),
    cop character varying(255),
    pk boolean,
    pv boolean,
    rqd boolean,
    un boolean,
    ct text,
    ai boolean,
    "unique" boolean,
    cdf text,
    cc text,
    csn character varying(255),
    dtx character varying(255),
    dtxp text,
    dtxs character varying(255),
    au boolean,
    validate text,
    virtual boolean,
    deleted boolean,
    system boolean DEFAULT false,
    "order" real,
    meta text,
    description text,
    readonly boolean DEFAULT false,
    fk_workspace_id character varying(20),
    custom_index_name character varying(64),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    internal_meta text
);


--
-- Name: nc_comment_reactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_comment_reactions (
    id character varying(20) NOT NULL,
    row_id character varying(255),
    comment_id character varying(20),
    source_id character varying(20),
    fk_model_id character varying(20),
    base_id character varying(20) NOT NULL,
    reaction character varying(255),
    created_by character varying(255),
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_comments (
    id character varying(20) NOT NULL,
    row_id character varying(255),
    comment text,
    created_by character varying(20),
    created_by_email character varying(255),
    resolved_by character varying(20),
    resolved_by_email character varying(255),
    parent_comment_id character varying(20),
    source_id character varying(20),
    base_id character varying(20) NOT NULL,
    fk_model_id character varying(20),
    is_deleted boolean,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_custom_urls_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_custom_urls_v2 (
    id character varying(20) NOT NULL,
    fk_workspace_id character varying(20),
    base_id character varying(20) NOT NULL,
    fk_model_id character varying(20),
    view_id character varying(20),
    original_path character varying(255),
    custom_path character varying(255),
    fk_dashboard_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_dashboards_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_dashboards_v2 (
    id character varying(20) NOT NULL,
    fk_workspace_id character varying(20),
    base_id character varying(20) NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    meta text,
    "order" integer,
    created_by character varying(20),
    owned_by character varying(20),
    uuid character varying(255),
    password character varying(255),
    fk_custom_url_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_data_reflection; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_data_reflection (
    id character varying(20) NOT NULL,
    fk_workspace_id character varying(20),
    username character varying(255),
    password character varying(255),
    database character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_db_servers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_db_servers (
    id character varying(20) NOT NULL,
    title character varying(255),
    is_shared boolean DEFAULT true,
    max_tenant_count integer,
    current_tenant_count integer DEFAULT 0,
    config text,
    conditions text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_dependency_tracker; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_dependency_tracker (
    id character varying(20) NOT NULL,
    fk_workspace_id character varying(20),
    base_id character varying(20) NOT NULL,
    source_type character varying(50) NOT NULL,
    source_id character varying(20) NOT NULL,
    dependent_type character varying(50) NOT NULL,
    dependent_id character varying(20) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    queryable_field_0 text,
    queryable_field_1 text,
    meta text,
    queryable_field_2 timestamp with time zone
);


--
-- Name: nc_disabled_models_for_role_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_disabled_models_for_role_v2 (
    id character varying(20) NOT NULL,
    source_id character varying(20),
    base_id character varying(20) NOT NULL,
    fk_view_id character varying(20),
    role character varying(45),
    disabled boolean DEFAULT true,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_extensions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_extensions (
    id character varying(20) NOT NULL,
    base_id character varying(20) NOT NULL,
    fk_user_id character varying(20),
    extension_id character varying(255),
    title character varying(255),
    kv_store text,
    meta text,
    "order" real,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_file_references; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_file_references (
    id character varying(20) NOT NULL,
    storage character varying(255),
    file_url text,
    file_size integer,
    fk_user_id character varying(20),
    fk_workspace_id character varying(20),
    base_id character varying(20),
    source_id character varying(20),
    fk_model_id character varying(20),
    fk_column_id character varying(20),
    is_external boolean DEFAULT false,
    deleted boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_filter_exp_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_filter_exp_v2 (
    id character varying(20) NOT NULL,
    source_id character varying(20),
    base_id character varying(20) NOT NULL,
    fk_view_id character varying(20),
    fk_hook_id character varying(20),
    fk_column_id character varying(20),
    fk_parent_id character varying(20),
    logical_op character varying(255),
    comparison_op character varying(255),
    value text,
    is_group boolean,
    "order" real,
    comparison_sub_op character varying(255),
    fk_link_col_id character varying(20),
    fk_value_col_id character varying(20),
    fk_parent_column_id character varying(20),
    fk_workspace_id character varying(20),
    fk_row_color_condition_id character varying(20),
    fk_widget_id character varying(20),
    meta text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_follower; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_follower (
    fk_user_id character varying(20) NOT NULL,
    fk_follower_id character varying(20) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_form_view_columns_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_form_view_columns_v2 (
    id character varying(20) NOT NULL,
    source_id character varying(20),
    base_id character varying(20) NOT NULL,
    fk_view_id character varying(20),
    fk_column_id character varying(20),
    uuid character varying(255),
    label text,
    help text,
    description text,
    required boolean,
    show boolean,
    "order" real,
    meta text,
    enable_scanner boolean,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_form_view_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_form_view_v2 (
    source_id character varying(20),
    base_id character varying(20) NOT NULL,
    fk_view_id character varying(20) NOT NULL,
    heading character varying(255),
    subheading text,
    success_msg text,
    redirect_url text,
    redirect_after_secs character varying(255),
    email character varying(255),
    submit_another_form boolean,
    show_blank_form boolean,
    uuid character varying(255),
    banner_image_url text,
    logo_url text,
    meta text,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_gallery_view_columns_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_gallery_view_columns_v2 (
    id character varying(20) NOT NULL,
    source_id character varying(20),
    base_id character varying(20) NOT NULL,
    fk_view_id character varying(20),
    fk_column_id character varying(20),
    uuid character varying(255),
    label character varying(255),
    help character varying(255),
    show boolean,
    "order" real,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_gallery_view_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_gallery_view_v2 (
    source_id character varying(20),
    base_id character varying(20) NOT NULL,
    fk_view_id character varying(20) NOT NULL,
    next_enabled boolean,
    prev_enabled boolean,
    cover_image_idx integer,
    fk_cover_image_col_id character varying(20),
    cover_image character varying(255),
    restrict_types character varying(255),
    restrict_size character varying(255),
    restrict_number character varying(255),
    public boolean,
    dimensions character varying(255),
    responsive_columns character varying(255),
    meta text,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_grid_view_columns_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_grid_view_columns_v2 (
    id character varying(20) NOT NULL,
    fk_view_id character varying(20),
    fk_column_id character varying(20),
    source_id character varying(20),
    base_id character varying(20) NOT NULL,
    uuid character varying(255),
    label character varying(255),
    help character varying(255),
    width character varying(255) DEFAULT '200px'::character varying,
    show boolean,
    "order" real,
    group_by boolean,
    group_by_order real,
    group_by_sort character varying(255),
    aggregation character varying(30) DEFAULT NULL::character varying,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_grid_view_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_grid_view_v2 (
    fk_view_id character varying(20) NOT NULL,
    source_id character varying(20),
    base_id character varying(20) NOT NULL,
    uuid character varying(255),
    meta text,
    row_height integer,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_hook_logs_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_hook_logs_v2 (
    id character varying(20) NOT NULL,
    source_id character varying(20),
    base_id character varying(20) NOT NULL,
    fk_hook_id character varying(20),
    type character varying(255),
    event character varying(255),
    operation character varying(255),
    test_call boolean DEFAULT true,
    payload text,
    conditions text,
    notification text,
    error_code character varying(255),
    error_message character varying(255),
    error text,
    execution_time integer,
    response text,
    triggered_by character varying(255),
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_hook_trigger_fields; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_hook_trigger_fields (
    fk_hook_id character varying(20) NOT NULL,
    fk_column_id character varying(20) NOT NULL,
    base_id character varying(20) NOT NULL,
    fk_workspace_id character varying(20) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_hooks_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_hooks_v2 (
    id character varying(20) NOT NULL,
    source_id character varying(20),
    base_id character varying(20) NOT NULL,
    fk_model_id character varying(20),
    title character varying(255),
    description character varying(255),
    env character varying(255) DEFAULT 'all'::character varying,
    type character varying(255),
    event character varying(255),
    operation character varying(255),
    async boolean DEFAULT false,
    payload boolean DEFAULT true,
    url text,
    headers text,
    condition boolean DEFAULT false,
    notification text,
    retries integer DEFAULT 0,
    retry_interval integer DEFAULT 60000,
    timeout integer DEFAULT 60000,
    active boolean DEFAULT true,
    version character varying(255),
    trigger_field boolean DEFAULT false,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_installations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_installations (
    id character varying(20) NOT NULL,
    fk_subscription_id character varying(20),
    licensed_to character varying(255) NOT NULL,
    license_key character varying(255) NOT NULL,
    installation_secret character varying(255),
    installed_at timestamp with time zone,
    last_seen_at timestamp with time zone,
    expires_at timestamp with time zone,
    license_type character varying(255) NOT NULL,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    seat_count integer DEFAULT 0 NOT NULL,
    config text,
    meta text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_integrations_store_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_integrations_store_v2 (
    id character varying(20) NOT NULL,
    fk_integration_id character varying(20),
    type character varying(20),
    sub_type character varying(20),
    fk_workspace_id character varying(20),
    fk_user_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    slot_0 text,
    slot_1 text,
    slot_2 text,
    slot_3 text,
    slot_4 text,
    slot_5 integer,
    slot_6 integer,
    slot_7 integer,
    slot_8 integer,
    slot_9 integer
);


--
-- Name: nc_integrations_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_integrations_v2 (
    id character varying(20) NOT NULL,
    title character varying(128),
    config text,
    meta text,
    type character varying(20),
    sub_type character varying(20),
    fk_workspace_id character varying(20),
    is_private boolean DEFAULT false,
    deleted boolean DEFAULT false,
    created_by character varying(20),
    "order" real,
    is_default boolean DEFAULT false,
    is_encrypted boolean DEFAULT false,
    is_global boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_jobs (
    id character varying(20) NOT NULL,
    job character varying(255),
    status character varying(20),
    result text,
    fk_user_id character varying(20),
    fk_workspace_id character varying(20),
    base_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_kanban_view_columns_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_kanban_view_columns_v2 (
    id character varying(20) NOT NULL,
    source_id character varying(20),
    base_id character varying(20) NOT NULL,
    fk_view_id character varying(20),
    fk_column_id character varying(20),
    uuid character varying(255),
    label character varying(255),
    help character varying(255),
    show boolean,
    "order" real,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_kanban_view_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_kanban_view_v2 (
    fk_view_id character varying(20) NOT NULL,
    source_id character varying(20),
    base_id character varying(20) NOT NULL,
    show boolean,
    "order" real,
    uuid character varying(255),
    title character varying(255),
    public boolean,
    password character varying(255),
    show_all_fields boolean,
    fk_grp_col_id character varying(20),
    fk_cover_image_col_id character varying(20),
    meta text,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_map_view_columns_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_map_view_columns_v2 (
    id character varying(20) NOT NULL,
    base_id character varying(20) NOT NULL,
    project_id character varying(128),
    fk_view_id character varying(20),
    fk_column_id character varying(20),
    uuid character varying(255),
    label character varying(255),
    help character varying(255),
    show boolean,
    "order" real,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_map_view_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_map_view_v2 (
    fk_view_id character varying(20) NOT NULL,
    source_id character varying(20),
    base_id character varying(20) NOT NULL,
    uuid character varying(255),
    title character varying(255),
    fk_geo_data_col_id character varying(20),
    meta text,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: nc_mcp_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_mcp_tokens (
    id character varying(20) NOT NULL,
    title character varying(512),
    base_id character varying(20) NOT NULL,
    token character varying(32),
    fk_workspace_id character varying(20),
    "order" real,
    fk_user_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_model_stats_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_model_stats_v2 (
    fk_workspace_id character varying(20) NOT NULL,
    fk_model_id character varying(20) NOT NULL,
    row_count integer DEFAULT 0,
    is_external boolean DEFAULT false,
    base_id character varying(20) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_models_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_models_v2 (
    id character varying(20) NOT NULL,
    source_id character varying(20),
    base_id character varying(20) NOT NULL,
    table_name character varying(255),
    title character varying(255),
    type character varying(255) DEFAULT 'table'::character varying,
    meta text,
    schema text,
    enabled boolean DEFAULT true,
    mm boolean DEFAULT false,
    tags character varying(255),
    pinned boolean,
    deleted boolean,
    "order" real,
    description text,
    synced boolean DEFAULT false,
    fk_workspace_id character varying(20),
    created_by character varying(20),
    owned_by character varying(20),
    uuid character varying(255),
    password character varying(255),
    fk_custom_url_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_oauth_authorization_codes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_oauth_authorization_codes (
    code character varying(32) NOT NULL,
    fk_client_id character varying(32),
    fk_user_id character varying(20),
    code_challenge character varying(255),
    code_challenge_method character varying(10) DEFAULT 'S256'::character varying,
    redirect_uri character varying(255),
    scope character varying(255),
    state character varying(1024),
    resource character varying(255),
    granted_resources text,
    expires_at timestamp with time zone NOT NULL,
    is_used boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_oauth_clients; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_oauth_clients (
    client_id character varying(32) NOT NULL,
    client_secret character varying(128),
    client_type character varying(255),
    client_name character varying(255),
    client_description text,
    client_uri character varying(255),
    logo_uri character varying(255),
    redirect_uris text,
    allowed_grant_types text,
    response_types text,
    allowed_scopes text,
    registration_access_token character varying(255),
    registration_client_uri character varying(255),
    client_id_issued_at bigint,
    client_secret_expires_at bigint,
    fk_user_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_oauth_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_oauth_tokens (
    id character varying(20) NOT NULL,
    fk_client_id character varying(32),
    fk_user_id character varying(20),
    access_token text,
    access_token_expires_at timestamp with time zone,
    refresh_token text,
    refresh_token_expires_at timestamp with time zone,
    resource character varying(255),
    audience character varying(255),
    granted_resources text,
    scope character varying(255),
    is_revoked boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    last_used_at timestamp with time zone
);


--
-- Name: nc_org; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_org (
    id character varying(20) NOT NULL,
    title character varying(255),
    slug character varying(255),
    fk_user_id character varying(20),
    meta text,
    image character varying(255),
    is_share_enabled boolean DEFAULT false,
    deleted boolean DEFAULT false,
    "order" real,
    fk_db_instance_id character varying(20),
    stripe_customer_id character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_org_domain; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_org_domain (
    id character varying(20) NOT NULL,
    fk_org_id character varying(20),
    fk_user_id character varying(20),
    domain character varying(255),
    verified boolean,
    txt_value character varying(255),
    last_verified timestamp with time zone,
    deleted boolean DEFAULT false,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_org_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_org_users (
    fk_org_id character varying(20) NOT NULL,
    fk_user_id character varying(20),
    roles character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_permission_subjects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_permission_subjects (
    fk_permission_id character varying(20) NOT NULL,
    subject_type character varying(255) NOT NULL,
    subject_id character varying(255) NOT NULL,
    fk_workspace_id character varying(20),
    base_id character varying(20) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_permissions (
    id character varying(20) NOT NULL,
    fk_workspace_id character varying(20),
    base_id character varying(20) NOT NULL,
    entity character varying(255),
    entity_id character varying(255),
    permission character varying(255),
    created_by character varying(20),
    enforce_for_form boolean DEFAULT true,
    enforce_for_automation boolean DEFAULT true,
    granted_type character varying(255),
    granted_role character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_plans (
    id character varying(20) NOT NULL,
    title character varying(255),
    description text,
    stripe_product_id character varying(255) NOT NULL,
    is_active boolean DEFAULT true,
    prices text,
    meta text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_plugins_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_plugins_v2 (
    id character varying(20) NOT NULL,
    title character varying(45),
    description text,
    active boolean DEFAULT false,
    rating real,
    version character varying(255),
    docs character varying(255),
    status character varying(255) DEFAULT 'install'::character varying,
    status_details character varying(255),
    logo character varying(255),
    icon character varying(255),
    tags character varying(255),
    category character varying(255),
    input_schema text,
    input text,
    creator character varying(255),
    creator_website character varying(255),
    price character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_principal_assignments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_principal_assignments (
    resource_type character varying(20) NOT NULL,
    resource_id character varying(20) NOT NULL,
    principal_type character varying(20) NOT NULL,
    principal_ref_id character varying(20) NOT NULL,
    roles character varying(255) NOT NULL,
    deleted boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_row_color_conditions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_row_color_conditions (
    id character varying(20) NOT NULL,
    fk_view_id character varying(20),
    fk_workspace_id character varying(20),
    base_id character varying(20) NOT NULL,
    color character varying(20),
    nc_order real,
    is_set_as_background boolean,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_sandbox_deployment_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_sandbox_deployment_logs (
    id character varying(20) NOT NULL,
    fk_workspace_id character varying(20) NOT NULL,
    base_id character varying(20) NOT NULL,
    fk_sandbox_id character varying(20) NOT NULL,
    from_version_id character varying(20),
    to_version_id character varying(20) NOT NULL,
    status character varying(20) DEFAULT 'pending'::character varying NOT NULL,
    deployment_type character varying(20) NOT NULL,
    error_message text,
    deployment_log text,
    meta text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    started_at timestamp with time zone,
    completed_at timestamp with time zone
);


--
-- Name: nc_sandbox_versions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_sandbox_versions (
    id character varying(20) NOT NULL,
    fk_workspace_id character varying(20) NOT NULL,
    fk_sandbox_id character varying(20) NOT NULL,
    version character varying(20) NOT NULL,
    version_number integer NOT NULL,
    status character varying(20) DEFAULT 'draft'::character varying NOT NULL,
    schema text,
    release_notes text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    published_at timestamp with time zone
);


--
-- Name: nc_sandboxes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_sandboxes (
    id character varying(20) NOT NULL,
    fk_workspace_id character varying(20) NOT NULL,
    base_id character varying(20) NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    created_by character varying(20) NOT NULL,
    visibility character varying(20) DEFAULT 'private'::character varying NOT NULL,
    category character varying(255),
    install_count integer DEFAULT 0,
    meta text,
    deleted boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    published_at timestamp with time zone
);


--
-- Name: nc_scripts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_scripts (
    id character varying(20) NOT NULL,
    title text,
    description text,
    meta text,
    "order" real,
    base_id character varying(20) NOT NULL,
    fk_workspace_id character varying(20),
    script text,
    config text,
    created_by character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_snapshots; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_snapshots (
    id character varying(20) NOT NULL,
    title character varying(512),
    base_id character varying(20),
    snapshot_base_id character varying(20),
    fk_workspace_id character varying(20),
    created_by character varying(20),
    status character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_sort_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_sort_v2 (
    id character varying(20) NOT NULL,
    source_id character varying(20),
    base_id character varying(20) NOT NULL,
    fk_view_id character varying(20),
    fk_column_id character varying(20),
    direction character varying(255) DEFAULT 'false'::character varying,
    "order" real,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_sources_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_sources_v2 (
    id character varying(20) NOT NULL,
    base_id character varying(20) NOT NULL,
    alias character varying(255),
    config text,
    meta text,
    is_meta boolean,
    type character varying(255),
    inflection_column character varying(255),
    inflection_table character varying(255),
    enabled boolean DEFAULT true,
    "order" real,
    description character varying(255),
    erd_uuid character varying(255),
    deleted boolean DEFAULT false,
    is_schema_readonly boolean DEFAULT false,
    is_data_readonly boolean DEFAULT false,
    is_local boolean DEFAULT false,
    fk_sql_executor_id character varying(20),
    fk_workspace_id character varying(20),
    fk_integration_id character varying(20),
    is_encrypted boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_sql_executor_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_sql_executor_v2 (
    id character varying(20) NOT NULL,
    domain character varying(50),
    status character varying(20),
    priority integer,
    capacity integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_sso_client; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_sso_client (
    id character varying(20) NOT NULL,
    type character varying(20),
    title character varying(255),
    enabled boolean DEFAULT true,
    config text,
    fk_user_id character varying(20),
    fk_org_id character varying(20),
    deleted boolean DEFAULT false,
    "order" real,
    domain_name character varying(255),
    domain_name_verified boolean,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_sso_client_domain; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_sso_client_domain (
    fk_sso_client_id character varying(20) NOT NULL,
    fk_org_domain_id character varying(20),
    enabled boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_store; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_store (
    id integer NOT NULL,
    base_id character varying(255),
    db_alias character varying(255) DEFAULT 'db'::character varying,
    key character varying(255),
    value text,
    type character varying(255),
    env character varying(255),
    tag character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: nc_store_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.nc_store_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nc_store_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.nc_store_id_seq OWNED BY public.nc_store.id;


--
-- Name: nc_subscriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_subscriptions (
    id character varying(20) NOT NULL,
    fk_workspace_id character varying(20),
    fk_org_id character varying(20),
    fk_plan_id character varying(20) NOT NULL,
    fk_user_id character varying(20),
    stripe_subscription_id character varying(255),
    stripe_price_id character varying(255),
    seat_count integer DEFAULT 1 NOT NULL,
    status character varying(255),
    billing_cycle_anchor timestamp with time zone,
    start_at timestamp with time zone,
    trial_end_at timestamp with time zone,
    canceled_at timestamp with time zone,
    period character varying(255),
    upcoming_invoice_at timestamp with time zone,
    upcoming_invoice_due_at timestamp with time zone,
    upcoming_invoice_amount integer,
    upcoming_invoice_currency character varying(255),
    stripe_schedule_id character varying(255),
    schedule_phase_start timestamp with time zone,
    schedule_stripe_price_id character varying(255),
    schedule_fk_plan_id character varying(20),
    schedule_period character varying(255),
    schedule_type character varying(255),
    meta text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_sync_configs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_sync_configs (
    id character varying(20) NOT NULL,
    fk_workspace_id character varying(20),
    base_id character varying(20) NOT NULL,
    fk_integration_id character varying(20),
    fk_model_id character varying(20),
    sync_type character varying(255),
    sync_trigger character varying(255),
    sync_trigger_cron character varying(255),
    sync_trigger_secret character varying(255),
    sync_job_id character varying(255),
    last_sync_at timestamp with time zone,
    next_sync_at timestamp with time zone,
    title character varying(255),
    sync_category character varying(255),
    fk_parent_sync_config_id character varying(20),
    on_delete_action character varying(255) DEFAULT 'mark_deleted'::character varying,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying(20),
    updated_by character varying(20),
    meta text
);


--
-- Name: nc_sync_logs_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_sync_logs_v2 (
    id character varying(20) NOT NULL,
    base_id character varying(20) NOT NULL,
    fk_sync_source_id character varying(20),
    time_taken integer,
    status character varying(255),
    status_details text,
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_sync_mappings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_sync_mappings (
    id character varying(20) NOT NULL,
    fk_workspace_id character varying(20),
    base_id character varying(20) NOT NULL,
    fk_sync_config_id character varying(20),
    target_table character varying(255),
    fk_model_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_sync_source_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_sync_source_v2 (
    id character varying(20) NOT NULL,
    title character varying(255),
    type character varying(255),
    details text,
    deleted boolean,
    enabled boolean DEFAULT true,
    "order" real,
    base_id character varying(20) NOT NULL,
    fk_user_id character varying(20),
    source_id character varying(20),
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_teams (
    id character varying(20) NOT NULL,
    title character varying(255) NOT NULL,
    meta text,
    fk_org_id character varying(20),
    fk_workspace_id character varying(20),
    created_by character varying(20),
    deleted boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_usage_stats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_usage_stats (
    fk_workspace_id character varying(20) NOT NULL,
    usage_type character varying(255) NOT NULL,
    period_start timestamp with time zone NOT NULL,
    count integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_user_comment_notifications_preference; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_user_comment_notifications_preference (
    id character varying(20) NOT NULL,
    row_id character varying(255),
    user_id character varying(20),
    fk_model_id character varying(20),
    source_id character varying(20),
    base_id character varying(20),
    preferences character varying(255),
    fk_workspace_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_user_refresh_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_user_refresh_tokens (
    fk_user_id character varying(20),
    token character varying(255),
    meta text,
    expires_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_users_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_users_v2 (
    id character varying(20) NOT NULL,
    email character varying(255),
    password character varying(255),
    salt character varying(255),
    invite_token character varying(255),
    invite_token_expires character varying(255),
    reset_password_expires timestamp with time zone,
    reset_password_token character varying(255),
    email_verification_token character varying(255),
    email_verified boolean,
    roles character varying(255) DEFAULT 'editor'::character varying,
    token_version character varying(255),
    blocked boolean DEFAULT false,
    blocked_reason character varying(255),
    deleted_at timestamp with time zone,
    is_deleted boolean DEFAULT false,
    meta text,
    display_name character varying(255),
    user_name character varying(255),
    bio character varying(255),
    location character varying(255),
    website character varying(255),
    avatar character varying(255),
    is_new_user boolean,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_views_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_views_v2 (
    id character varying(20) NOT NULL,
    source_id character varying(20),
    base_id character varying(20) NOT NULL,
    fk_model_id character varying(20),
    title character varying(255),
    type integer,
    is_default boolean,
    show_system_fields boolean,
    lock_type character varying(255) DEFAULT 'collaborative'::character varying,
    uuid character varying(255),
    password character varying(255),
    show boolean,
    "order" real,
    meta text,
    description text,
    created_by character varying(20),
    owned_by character varying(20),
    fk_workspace_id character varying(20),
    attachment_mode_column_id character varying(20),
    expanded_record_mode character varying(255),
    fk_custom_url_id character varying(20),
    row_coloring_mode character varying(10),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_widgets_v2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_widgets_v2 (
    id character varying(20) NOT NULL,
    fk_workspace_id character varying(20),
    base_id character varying(20) NOT NULL,
    fk_dashboard_id character varying(20) NOT NULL,
    fk_model_id character varying(20),
    fk_view_id character varying(20),
    title character varying(255) NOT NULL,
    description text,
    type character varying(50) NOT NULL,
    config text,
    meta text,
    "order" integer,
    "position" text,
    error boolean,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: nc_workflows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nc_workflows (
    id character varying(20) NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    fk_workspace_id character varying(20),
    base_id character varying(20),
    enabled boolean DEFAULT false,
    nodes text,
    edges text,
    meta text,
    "order" real,
    created_by character varying(20),
    updated_by character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    draft text
);


--
-- Name: notification; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notification (
    id character varying(20) NOT NULL,
    type character varying(40),
    body text,
    is_read boolean DEFAULT false,
    is_deleted boolean DEFAULT false,
    fk_user_id character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: workspace; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.workspace (
    id character varying(20) NOT NULL,
    title character varying(255),
    description text,
    meta text,
    fk_user_id character varying(20),
    deleted boolean DEFAULT false,
    deleted_at timestamp with time zone,
    "order" real,
    status smallint DEFAULT '0'::smallint,
    message character varying(256),
    plan character varying(20) DEFAULT 'free'::character varying,
    infra_meta text,
    fk_org_id character varying(20),
    stripe_customer_id character varying(255),
    grace_period_start_at timestamp with time zone,
    api_grace_period_start_at timestamp with time zone,
    automation_grace_period_start_at timestamp with time zone,
    loyal boolean DEFAULT false,
    loyalty_discount_used boolean DEFAULT false,
    db_job_id character varying(20),
    fk_db_instance_id character varying(20),
    segment_code integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: workspace_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.workspace_user (
    fk_workspace_id character varying(20) NOT NULL,
    fk_user_id character varying(20) NOT NULL,
    roles character varying(255),
    invite_token character varying(255),
    invite_accepted boolean DEFAULT false,
    deleted boolean DEFAULT false,
    deleted_at timestamp with time zone,
    "order" real,
    invited_by character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: xc_knex_migrationsv0; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.xc_knex_migrationsv0 (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


--
-- Name: xc_knex_migrationsv0_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.xc_knex_migrationsv0_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: xc_knex_migrationsv0_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.xc_knex_migrationsv0_id_seq OWNED BY public.xc_knex_migrationsv0.id;


--
-- Name: xc_knex_migrationsv0_lock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.xc_knex_migrationsv0_lock (
    index integer NOT NULL,
    is_locked integer
);


--
-- Name: xc_knex_migrationsv0_lock_index_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.xc_knex_migrationsv0_lock_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: xc_knex_migrationsv0_lock_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.xc_knex_migrationsv0_lock_index_seq OWNED BY public.xc_knex_migrationsv0_lock.index;


--
-- Name: 1_CLIENTS; Type: TABLE; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE TABLE pupuc6ugup9dm03."1_CLIENTS" (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by character varying,
    updated_by character varying,
    nc_order numeric,
    "Company_Name" text,
    "VAT_ID" text,
    "Address" text,
    "Email" character varying,
    "Phone" character varying,
    "Notes" text
);


--
-- Name: 1_CLIENTS_csv_id_seq; Type: SEQUENCE; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE SEQUENCE pupuc6ugup9dm03."1_CLIENTS_csv_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: 1_CLIENTS_csv_id_seq; Type: SEQUENCE OWNED BY; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER SEQUENCE pupuc6ugup9dm03."1_CLIENTS_csv_id_seq" OWNED BY pupuc6ugup9dm03."1_CLIENTS".id;


--
-- Name: 2_CONTACTS; Type: TABLE; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE TABLE pupuc6ugup9dm03."2_CONTACTS" (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by character varying,
    updated_by character varying,
    nc_order numeric,
    "Full_Name" text,
    "Position" text,
    "Email" character varying,
    "Phone" character varying,
    "Primary_Contact" boolean DEFAULT false
);


--
-- Name: 2_CONTACTS_csv_id_seq; Type: SEQUENCE; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE SEQUENCE pupuc6ugup9dm03."2_CONTACTS_csv_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: 2_CONTACTS_csv_id_seq; Type: SEQUENCE OWNED BY; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER SEQUENCE pupuc6ugup9dm03."2_CONTACTS_csv_id_seq" OWNED BY pupuc6ugup9dm03."2_CONTACTS".id;


--
-- Name: 3_VEHICLES; Type: TABLE; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE TABLE pupuc6ugup9dm03."3_VEHICLES" (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by character varying,
    updated_by character varying,
    nc_order numeric,
    "Registration_Number" text,
    "Body_Type" text,
    "Capacity_kg" bigint,
    "Capacity_m3" bigint,
    "Pallet_Spaces" bigint,
    "ADR" boolean DEFAULT false,
    "ADR_Classes" text,
    "Inspection_Date" date,
    "Insurance_Expiry" date,
    "Notes" text
);


--
-- Name: 3_VEHICLES_csv_id_seq; Type: SEQUENCE; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE SEQUENCE pupuc6ugup9dm03."3_VEHICLES_csv_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: 3_VEHICLES_csv_id_seq; Type: SEQUENCE OWNED BY; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER SEQUENCE pupuc6ugup9dm03."3_VEHICLES_csv_id_seq" OWNED BY pupuc6ugup9dm03."3_VEHICLES".id;


--
-- Name: 4_DRIVERS; Type: TABLE; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE TABLE pupuc6ugup9dm03."4_DRIVERS" (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by character varying,
    updated_by character varying,
    nc_order numeric,
    "Full_Name" text,
    "Phone" character varying,
    "License_Categories" text,
    "ADR" boolean DEFAULT false,
    "ADR_Classes" text,
    "ADR_Expiry_Date" date,
    "Medical_Exam_Expiry" date,
    "Notes" text
);


--
-- Name: 4_DRIVERS_id_seq; Type: SEQUENCE; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE SEQUENCE pupuc6ugup9dm03."4_DRIVERS_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: 4_DRIVERS_id_seq; Type: SEQUENCE OWNED BY; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER SEQUENCE pupuc6ugup9dm03."4_DRIVERS_id_seq" OWNED BY pupuc6ugup9dm03."4_DRIVERS".id;


--
-- Name: 5_INQUIRIES; Type: TABLE; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE TABLE pupuc6ugup9dm03."5_INQUIRIES" (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by character varying,
    updated_by character varying,
    nc_order numeric,
    "Inquiry_Date" timestamp without time zone,
    "Origin_City_Postal" text,
    "Destination_City_Postal" text,
    "Loading_Date" date,
    "Delivery_Date" date,
    "Cargo_Type" text,
    "ADR" boolean DEFAULT false,
    "ADR_Class_UN" text,
    "Dimensions" text,
    "Weight_kg" bigint,
    "Status" text,
    "Source" text,
    "UTM_Source" text,
    "Notes" text
);


--
-- Name: 5_INQUIRIES_id_seq; Type: SEQUENCE; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE SEQUENCE pupuc6ugup9dm03."5_INQUIRIES_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: 5_INQUIRIES_id_seq; Type: SEQUENCE OWNED BY; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER SEQUENCE pupuc6ugup9dm03."5_INQUIRIES_id_seq" OWNED BY pupuc6ugup9dm03."5_INQUIRIES".id;


--
-- Name: 6_TRANSPORTS; Type: TABLE; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE TABLE pupuc6ugup9dm03."6_TRANSPORTS" (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by character varying,
    updated_by character varying,
    nc_order numeric,
    "Departure_Date" date,
    "Origin" text,
    "Destination" text,
    "Status" text,
    "Notes" text,
    "Transport_Capacity__" double precision
);


--
-- Name: 6_TRANSPORTS_id_seq; Type: SEQUENCE; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE SEQUENCE pupuc6ugup9dm03."6_TRANSPORTS_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: 6_TRANSPORTS_id_seq; Type: SEQUENCE OWNED BY; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER SEQUENCE pupuc6ugup9dm03."6_TRANSPORTS_id_seq" OWNED BY pupuc6ugup9dm03."6_TRANSPORTS".id;


--
-- Name: 7_FREIGHTS; Type: TABLE; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE TABLE pupuc6ugup9dm03."7_FREIGHTS" (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by character varying,
    updated_by character varying,
    nc_order numeric,
    "Client" text,
    "Unit_Type" text,
    "Quantity" bigint,
    "Cargo_Description" text,
    "Pickup_Address" text,
    "Delivery_Address" text,
    "Freight_Price_EUR" numeric,
    "Invoiced" boolean DEFAULT false,
    "Invoice_Number" text,
    "Notes" text
);


--
-- Name: 7_FREIGHTS_csv_id_seq; Type: SEQUENCE; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE SEQUENCE pupuc6ugup9dm03."7_FREIGHTS_csv_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: 7_FREIGHTS_csv_id_seq; Type: SEQUENCE OWNED BY; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER SEQUENCE pupuc6ugup9dm03."7_FREIGHTS_csv_id_seq" OWNED BY pupuc6ugup9dm03."7_FREIGHTS".id;


--
-- Name: _nc_m2m_2_CONTACTS_1_CLIENTS; Type: TABLE; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE TABLE pupuc6ugup9dm03."_nc_m2m_2_CONTACTS_1_CLIENTS" (
    "1_CLIENTS_id" integer NOT NULL,
    "2_CONTACTS_id" integer NOT NULL
);


--
-- Name: _nc_m2m_4_DRIVERS_3_VEHICLES; Type: TABLE; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE TABLE pupuc6ugup9dm03."_nc_m2m_4_DRIVERS_3_VEHICLES" (
    "3_VEHICLES_id" integer NOT NULL,
    "4_DRIVERS_id" integer NOT NULL
);


--
-- Name: _nc_m2m_5_INQUIRIES_1_CLIENTS; Type: TABLE; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE TABLE pupuc6ugup9dm03."_nc_m2m_5_INQUIRIES_1_CLIENTS" (
    "1_CLIENTS_id" integer NOT NULL,
    "5_INQUIRIES_id" integer NOT NULL
);


--
-- Name: _nc_m2m_5_INQUIRIES_2_CONTACTS; Type: TABLE; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE TABLE pupuc6ugup9dm03."_nc_m2m_5_INQUIRIES_2_CONTACTS" (
    "2_CONTACTS_id" integer NOT NULL,
    "5_INQUIRIES_id" integer NOT NULL
);


--
-- Name: _nc_m2m_6_TRANSPORTS_3_VEHICLES; Type: TABLE; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE TABLE pupuc6ugup9dm03."_nc_m2m_6_TRANSPORTS_3_VEHICLES" (
    "3_VEHICLES_id" integer NOT NULL,
    "6_TRANSPORTS_id" integer NOT NULL
);


--
-- Name: _nc_m2m_6_TRANSPORTS_4_DRIVERS; Type: TABLE; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE TABLE pupuc6ugup9dm03."_nc_m2m_6_TRANSPORTS_4_DRIVERS" (
    "4_DRIVERS_id" integer NOT NULL,
    "6_TRANSPORTS_id" integer NOT NULL
);


--
-- Name: _nc_m2m_7_FREIGHTS_1_CLIENTS; Type: TABLE; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE TABLE pupuc6ugup9dm03."_nc_m2m_7_FREIGHTS_1_CLIENTS" (
    "1_CLIENTS_id" integer NOT NULL,
    "7_FREIGHTS_id" integer NOT NULL
);


--
-- Name: _nc_m2m_7_FREIGHTS_6_TRANSPORTS; Type: TABLE; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE TABLE pupuc6ugup9dm03."_nc_m2m_7_FREIGHTS_6_TRANSPORTS" (
    "6_TRANSPORTS_id" integer NOT NULL,
    "7_FREIGHTS_id" integer NOT NULL
);


--
-- Name: 1_CLIENTS id; Type: DEFAULT; Schema: p3llodmezayxe7x; Owner: -
--

ALTER TABLE ONLY p3llodmezayxe7x."1_CLIENTS" ALTER COLUMN id SET DEFAULT nextval('p3llodmezayxe7x."1_CLIENTS_id_seq"'::regclass);


--
-- Name: 2_CONTACTS id; Type: DEFAULT; Schema: p3llodmezayxe7x; Owner: -
--

ALTER TABLE ONLY p3llodmezayxe7x."2_CONTACTS" ALTER COLUMN id SET DEFAULT nextval('p3llodmezayxe7x."2_CONTACTS_id_seq"'::regclass);


--
-- Name: 3_VEHICLES id; Type: DEFAULT; Schema: p3llodmezayxe7x; Owner: -
--

ALTER TABLE ONLY p3llodmezayxe7x."3_VEHICLES" ALTER COLUMN id SET DEFAULT nextval('p3llodmezayxe7x."3_VEHICLES_id_seq"'::regclass);


--
-- Name: 4_DRIVERS id; Type: DEFAULT; Schema: p3llodmezayxe7x; Owner: -
--

ALTER TABLE ONLY p3llodmezayxe7x."4_DRIVERS" ALTER COLUMN id SET DEFAULT nextval('p3llodmezayxe7x."4_DRIVERS_id_seq"'::regclass);


--
-- Name: 5_INQUIRIES id; Type: DEFAULT; Schema: p3llodmezayxe7x; Owner: -
--

ALTER TABLE ONLY p3llodmezayxe7x."5_INQUIRIES" ALTER COLUMN id SET DEFAULT nextval('p3llodmezayxe7x."5_INQUIRIES_id_seq"'::regclass);


--
-- Name: 6_TRANSPORTS id; Type: DEFAULT; Schema: p3llodmezayxe7x; Owner: -
--

ALTER TABLE ONLY p3llodmezayxe7x."6_TRANSPORTS" ALTER COLUMN id SET DEFAULT nextval('p3llodmezayxe7x."6_TRANSPORTS_id_seq"'::regclass);


--
-- Name: 7_FREIGHTS id; Type: DEFAULT; Schema: p3llodmezayxe7x; Owner: -
--

ALTER TABLE ONLY p3llodmezayxe7x."7_FREIGHTS" ALTER COLUMN id SET DEFAULT nextval('p3llodmezayxe7x."7_FREIGHTS_id_seq"'::regclass);


--
-- Name: Features id; Type: DEFAULT; Schema: ptbstfo5b36htsq; Owner: -
--

ALTER TABLE ONLY ptbstfo5b36htsq."Features" ALTER COLUMN id SET DEFAULT nextval('ptbstfo5b36htsq."Features_id_seq"'::regclass);


--
-- Name: nc_api_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.nc_api_tokens_id_seq'::regclass);


--
-- Name: nc_store id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_store ALTER COLUMN id SET DEFAULT nextval('public.nc_store_id_seq'::regclass);


--
-- Name: xc_knex_migrationsv0 id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xc_knex_migrationsv0 ALTER COLUMN id SET DEFAULT nextval('public.xc_knex_migrationsv0_id_seq'::regclass);


--
-- Name: xc_knex_migrationsv0_lock index; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xc_knex_migrationsv0_lock ALTER COLUMN index SET DEFAULT nextval('public.xc_knex_migrationsv0_lock_index_seq'::regclass);


--
-- Name: 1_CLIENTS id; Type: DEFAULT; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER TABLE ONLY pupuc6ugup9dm03."1_CLIENTS" ALTER COLUMN id SET DEFAULT nextval('pupuc6ugup9dm03."1_CLIENTS_csv_id_seq"'::regclass);


--
-- Name: 2_CONTACTS id; Type: DEFAULT; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER TABLE ONLY pupuc6ugup9dm03."2_CONTACTS" ALTER COLUMN id SET DEFAULT nextval('pupuc6ugup9dm03."2_CONTACTS_csv_id_seq"'::regclass);


--
-- Name: 3_VEHICLES id; Type: DEFAULT; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER TABLE ONLY pupuc6ugup9dm03."3_VEHICLES" ALTER COLUMN id SET DEFAULT nextval('pupuc6ugup9dm03."3_VEHICLES_csv_id_seq"'::regclass);


--
-- Name: 4_DRIVERS id; Type: DEFAULT; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER TABLE ONLY pupuc6ugup9dm03."4_DRIVERS" ALTER COLUMN id SET DEFAULT nextval('pupuc6ugup9dm03."4_DRIVERS_id_seq"'::regclass);


--
-- Name: 5_INQUIRIES id; Type: DEFAULT; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER TABLE ONLY pupuc6ugup9dm03."5_INQUIRIES" ALTER COLUMN id SET DEFAULT nextval('pupuc6ugup9dm03."5_INQUIRIES_id_seq"'::regclass);


--
-- Name: 6_TRANSPORTS id; Type: DEFAULT; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER TABLE ONLY pupuc6ugup9dm03."6_TRANSPORTS" ALTER COLUMN id SET DEFAULT nextval('pupuc6ugup9dm03."6_TRANSPORTS_id_seq"'::regclass);


--
-- Name: 7_FREIGHTS id; Type: DEFAULT; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER TABLE ONLY pupuc6ugup9dm03."7_FREIGHTS" ALTER COLUMN id SET DEFAULT nextval('pupuc6ugup9dm03."7_FREIGHTS_csv_id_seq"'::regclass);


--
-- Data for Name: 1_CLIENTS; Type: TABLE DATA; Schema: p3llodmezayxe7x; Owner: -
--

COPY p3llodmezayxe7x."1_CLIENTS" (id, created_at, updated_at, nc_order, "Company_Name", "VAT_ID", "Address", "Email", "Phone", "Notes") FROM stdin;
16	2026-02-16 15:41:42	\N	\N	Müller Logistik GmbH	DE112233445	Hafenstr. 22, 20095 Hamburg	info@mueller-logistik.de	+49 40 123 4567	Stammkunde - internationaler Transport
17	2026-02-16 15:41:42	\N	\N	Schneider Spedition GmbH & Co. KG	DE223344556	Industriestr. 8, 80331 München	kontakt@schneider-spedition.de	+49 89 234 5678	Komplettladungen DE-PL
18	2026-02-16 15:41:42	\N	\N	Weber Transporte GmbH	DE334455667	Am Containerhafen 3, 28195 Bremen	info@weber-transporte.de	+49 421 345 6789	Spezialisierung: See- und Containertransport
19	2026-02-16 15:41:42	\N	\N	Koch Kühllogistik GmbH	DE445566778	Kühlhausring 15, 50667 Köln	disposition@koch-kuehl.de	+49 221 456 7890	Kühllogistik - Tiefkühl- und Frischware
20	2026-02-16 15:41:42	\N	\N	Braun Chemie Transport AG	DE556677889	Rheinuferstr. 40, 40213 Düsseldorf	logistik@braun-chemie.de	+49 211 567 8901	ADR - Chemikalientransport Kl. 3 und 8
21	2026-02-16 15:41:42	\N	\N	Fischer Automotive Logistics GmbH	DE667788990	Werksallee 7, 70173 Stuttgart	spedition@fischer-auto.de	+49 711 678 9012	Automobilteile - JIT-Belieferung
22	2026-02-16 15:41:42	\N	\N	Example_Company	DE123456789	beispielStrasse	beispiel@gmail.com	49 123456789	\N
\.


--
-- Data for Name: 2_CONTACTS; Type: TABLE DATA; Schema: p3llodmezayxe7x; Owner: -
--

COPY p3llodmezayxe7x."2_CONTACTS" (id, created_at, updated_at, nc_order, "Full_Name", "Position", "Email", "Phone", "Primary_Contact") FROM stdin;
5	2026-02-16 15:41:43	\N	\N	Hans Müller	Geschäftsführer	h.mueller@mueller-logistik.de	+49 40 123 4560	t
6	2026-02-16 15:41:43	\N	\N	Petra Hoffmann	Disponentin	p.hoffmann@mueller-logistik.de	+49 40 123 4561	f
7	2026-02-16 15:41:43	\N	\N	Thomas Schneider	Leiter Spedition	t.schneider@schneider-spedition.de	+49 89 234 5670	t
8	2026-02-16 15:41:43	\N	\N	Sabine Lang	Sachbearbeiterin	s.lang@schneider-spedition.de	+49 89 234 5671	f
9	2026-02-16 15:41:43	\N	\N	Klaus Weber	Logistikleiter	k.weber@weber-transporte.de	+49 421 345 6780	t
10	2026-02-16 15:41:43	\N	\N	Monika Koch	Disposition Kühllogistik	m.koch@koch-kuehl.de	+49 221 456 7891	t
11	2026-02-16 15:41:43	\N	\N	Stefan Braun	Gefahrgutbeauftragter	s.braun@braun-chemie.de	+49 211 567 8902	t
12	2026-02-16 15:41:43	\N	\N	Katrin Fischer	Supply Chain Managerin	k.fischer@fischer-auto.de	+49 711 678 9013	t
13	2026-02-16 15:41:43	\N	\N	beispiel name	none	beispiel@gmail.com	49123456789	f
\.


--
-- Data for Name: 3_VEHICLES; Type: TABLE DATA; Schema: p3llodmezayxe7x; Owner: -
--

COPY p3llodmezayxe7x."3_VEHICLES" (id, created_at, updated_at, nc_order, "Registration_Number", "Body_Type", "Capacity_kg", "Capacity_m3", "Pallet_Spaces", "ADR", "ADR_Classes", "Inspection_Date", "Insurance_Expiry", "Notes") FROM stdin;
5	2026-02-16 15:41:43	\N	\N	HH-ML 1012	Plane/Tautliner	24000	86	33	t	3,4.2,5.1	2026-06-15	2026-12-31	MAN TGX 18.510
6	2026-02-16 15:41:43	\N	\N	M-SS 2034	Plane/Tautliner	24000	86	33	f	\N	2026-03-20	2026-09-30	Volvo FH 500
7	2026-02-16 15:41:43	\N	\N	HB-WT 3056	Containerchassis	26000	0	0	t	4.3,5.1	2026-08-10	2027-01-15	Für 20ft und 40ft Container
8	2026-02-16 15:41:43	\N	\N	K-KK 4078	Kühlkoffer	22000	76	33	f	\N	2026-05-01	2026-11-30	Thermo King SLXi 300 - Tiefkühlung
9	2026-02-16 15:41:43	\N	\N	D-BC 5090	Tankfahrzeug	25000	0	0	t	3,8	2026-09-20	2027-03-15	ADR Tankzulassung Kl. 3 und 8
10	2026-02-16 15:41:43	\N	\N	S-FA 6012	Kastenwagen	3500	22	8	f	\N	2026-04-10	2026-10-31	Mercedes Sprinter - JIT Zustellungen
\.


--
-- Data for Name: 4_DRIVERS; Type: TABLE DATA; Schema: p3llodmezayxe7x; Owner: -
--

COPY p3llodmezayxe7x."4_DRIVERS" (id, created_at, updated_at, nc_order, "Full_Name", "Phone", "License_Categories", "ADR", "ADR_Classes", "ADR_Expiry_Date", "Medical_Exam_Expiry", "Notes") FROM stdin;
5	2026-02-16 15:41:43	\N	\N	Jürgen Hartmann	+49 170 111 2233	B,C,C+E	f	\N	\N	2026-09-30	Fernverkehr - Erfahrung Skandinavien
6	2026-02-16 15:41:43	\N	\N	Michael Becker	+49 171 333 4455	B,C,C+E	f	\N	\N	2026-12-15	Fernverkehr DE-PL Strecke
7	2026-02-16 15:41:43	\N	\N	Andreas Richter	+49 172 555 6677	B,C,C+E	f	\N	\N	2027-06-20	Containerverkehr Hafen Bremen
8	2026-02-16 15:41:43	\N	\N	Frank Zimmermann	+49 173 777 8899	B,C,C+E	f	\N	\N	2026-08-10	Kühllogistik - Temperaturüberwachung
9	2026-02-16 15:41:43	\N	\N	Oliver Wagner	+49 174 999 0011	B,C,C+E	t	3,8	2027-05-30	2027-03-15	ADR-Schein Klasse 3 und 8 - Gefahrgut
10	2026-02-16 15:41:43	\N	\N	Lukas Schäfer	+49 175 222 3344	B,C	f	\N	\N	2026-11-20	Nahverkehr - JIT Zustellungen Stuttgart
\.


--
-- Data for Name: 5_INQUIRIES; Type: TABLE DATA; Schema: p3llodmezayxe7x; Owner: -
--

COPY p3llodmezayxe7x."5_INQUIRIES" (id, created_at, updated_at, nc_order, "Inquiry_Date", "Origin_City_Postal", "Destination_City_Postal", "Loading_Date", "Delivery_Date", "Cargo_Type", "ADR", "ADR_Class_UN", "Dimensions", "Weight_kg", "Status", "Source", "UTM_Source", "Notes") FROM stdin;
4	2026-02-16 15:41:43	\N	\N	2026-02-01 11:30:00	Hamburg 20095	Warschau 00-001	2026-02-10	2026-02-11	Paletten	f	\N	120x80x180 x 20 Stk.	12000	New	Phone	\N	20 Europaletten - Stückgut
5	2026-02-16 15:41:43	\N	\N	2026-02-02 13:30:00	München 80331	Poznań 60-001	2026-02-12	2026-02-13	Komplettladung	f	\N	Komplettladung LKW	23000	Quoted	Email	\N	FTL Plane - Maschinenteile
6	2026-02-16 15:41:43	\N	\N	2026-02-03 22:00:00	Köln 50667	Berlin 10115	2026-02-14	2026-02-14	Kühlware	f	\N	33 Paletten	18000	Accepted	Phone	\N	Frischware -2°C bis +4°C
7	2026-02-16 15:41:43	\N	\N	2026-02-04 11:30:00	Düsseldorf 40213	Frankfurt 60311	2026-02-15	2026-02-15	Gefahrgut	t	3,4.3	Tankfahrzeug	20000	New	Web Form	google_ads	Benzin - ADR Klasse 3
8	2026-02-16 15:41:43	\N	\N	2026-02-04 06:00:00	Stuttgart 70173	München 80331	2026-02-11	2026-02-11	Automobilteile	f	\N	8 Gitterboxen	2800	New	Email	\N	JIT-Lieferung an Produktionslinie
9	2026-02-16 15:41:43	\N	\N	2026-02-04 08:30:00	Bremen 28195	Hamburg 20095	2026-02-16	2026-02-16	Container	f	\N	1x 40ft Container	22000	Quoted	Phone	\N	Seecontainer - Umschlag Hafen
\.


--
-- Data for Name: 6_TRANSPORTS; Type: TABLE DATA; Schema: p3llodmezayxe7x; Owner: -
--

COPY p3llodmezayxe7x."6_TRANSPORTS" (id, created_at, updated_at, nc_order, "Departure_Date", "Origin", "Destination", "Status", "Notes", "Transport_Capacity__") FROM stdin;
3	2026-02-16 15:41:43	\N	\N	2026-02-19	Hamburg	Warschau	Planned	20 Europaletten Stückgut für Müller Logistik	50
4	2026-02-16 15:41:43	\N	\N	2026-02-12	München	Berlin	Planned	FTL Komplettladung Maschinenteile	40
5	2026-02-16 15:41:43	\N	\N	2026-02-14	Köln	Berlin	Planned	Kühlware Frischware -2°C bis +4°C	75
6	2026-02-16 15:41:43	\N	\N	2026-02-15	Düsseldorf	Frankfurt	Planned	ADR Kl. 3 - Benzintransport	80
7	2026-02-16 15:41:43	\N	\N	2026-02-11	Stuttgart	München	Planned	JIT Automobilteile - Gitterboxen	60
8	2026-02-16 15:41:43	\N	\N	2026-02-16	Bremen	Hamburg	Planned	40ft Seecontainer Umschlag	100
10	2026-02-16 15:41:43	\N	\N	2026-02-24	Munchen	Hamburg	Planned	\N	55
11	2026-02-16 15:41:43	\N	\N	2026-02-09	ABC	CBA	Planned	\N	30
\.


--
-- Data for Name: 7_FREIGHTS; Type: TABLE DATA; Schema: p3llodmezayxe7x; Owner: -
--

COPY p3llodmezayxe7x."7_FREIGHTS" (id, created_at, updated_at, nc_order, "Client", "Unit_Type", "Quantity", "Cargo_Description", "Pickup_Address", "Delivery_Address", "Freight_Price_EUR", "Invoiced", "Invoice_Number", "Notes") FROM stdin;
3	2026-02-16 15:41:43	\N	\N	Müller Logistik GmbH	Pallet	20	Europaletten Stückgut - Elektronikteile	Hafenstr. 22, 20095 Hamburg	ul. Przemyslowa 15, 00-001 Warschau	1850	f	\N	Teilladung - Restkapazität 13 Paletten frei
4	2026-02-16 15:41:43	\N	\N	Schneider Spedition GmbH & Co. KG	Pallet	33	Maschinenteile - Komplettladung	Industriestr. 8, 80331 München	Großmarktstr. 5, 10115 Berlin	2100	f	\N	FTL - Komplettladung
5	2026-02-16 15:41:43	\N	\N	Koch Kühllogistik GmbH	Pallet	33	Frischware - Molkereiprodukte	Kühlhausring 15, 50667 Köln	Großmarktstr. 5, 10115 Berlin	1400	f	\N	Temperaturgeführt -2°C bis +4°C
6	2026-02-16 15:41:43	\N	\N	Braun Chemie Transport AG	ADR	1	Benzin UN1203 Klasse 3 - Tanktransport	Rheinuferstr. 40, 40213 Düsseldorf	Industriepark Höchst, 60311 Frankfurt	1600	f	\N	ADR Tankbeförderung - Gefahrgutdokumente erforderlich
7	2026-02-16 15:41:43	\N	\N	Fischer Automotive Logistics GmbH	Box	8	Gitterboxen mit Automobilteilen - JIT	Werksallee 7, 70173 Stuttgart	BMW Werk, 80331 München	650	f	\N	JIT-Lieferung bis 06:00 Uhr
8	2026-02-16 15:41:43	\N	\N	Weber Transporte GmbH	Other	1	40ft Seecontainer - Importware aus Asien	Am Containerhafen 3, 28195 Bremen	Terminaltstr. 12, 20095 Hamburg	480	f	\N	Containerumschlag Hafen-Hafen
10	2026-02-16 15:41:43	\N	\N	Example_XYZ	ADR	55	Example_XYZ	Maschinenteile - Komplettladung	Am Containerhafen 3, 28195 Bremen	980	f	\N	\N
\.


--
-- Data for Name: _nc_m2m_1_CLIENTS_2_CONTACTS; Type: TABLE DATA; Schema: p3llodmezayxe7x; Owner: -
--

COPY p3llodmezayxe7x."_nc_m2m_1_CLIENTS_2_CONTACTS" ("2_CONTACTS_id", "1_CLIENTS_id") FROM stdin;
5	16
6	16
7	17
8	17
9	18
10	19
11	20
12	21
13	22
\.


--
-- Data for Name: _nc_m2m_1_CLIENTS_5_INQUIRIES; Type: TABLE DATA; Schema: p3llodmezayxe7x; Owner: -
--

COPY p3llodmezayxe7x."_nc_m2m_1_CLIENTS_5_INQUIRIES" ("5_INQUIRIES_id", "1_CLIENTS_id") FROM stdin;
4	16
5	17
6	19
7	20
8	21
9	18
\.


--
-- Data for Name: _nc_m2m_1_CLIENTS_7_FREIGHTS; Type: TABLE DATA; Schema: p3llodmezayxe7x; Owner: -
--

COPY p3llodmezayxe7x."_nc_m2m_1_CLIENTS_7_FREIGHTS" ("7_FREIGHTS_id", "1_CLIENTS_id") FROM stdin;
3	16
4	17
5	19
6	20
7	21
8	18
10	22
\.


--
-- Data for Name: _nc_m2m_2_CONTACTS_5_INQUIRIES; Type: TABLE DATA; Schema: p3llodmezayxe7x; Owner: -
--

COPY p3llodmezayxe7x."_nc_m2m_2_CONTACTS_5_INQUIRIES" ("5_INQUIRIES_id", "2_CONTACTS_id") FROM stdin;
4	5
5	7
6	10
7	11
8	12
9	9
\.


--
-- Data for Name: _nc_m2m_3_VEHICLES_4_DRIVERS; Type: TABLE DATA; Schema: p3llodmezayxe7x; Owner: -
--

COPY p3llodmezayxe7x."_nc_m2m_3_VEHICLES_4_DRIVERS" ("4_DRIVERS_id", "3_VEHICLES_id") FROM stdin;
5	5
6	6
7	7
8	8
9	9
10	10
\.


--
-- Data for Name: _nc_m2m_3_VEHICLES_6_TRANSPORTS; Type: TABLE DATA; Schema: p3llodmezayxe7x; Owner: -
--

COPY p3llodmezayxe7x."_nc_m2m_3_VEHICLES_6_TRANSPORTS" ("6_TRANSPORTS_id", "3_VEHICLES_id") FROM stdin;
3	5
4	6
5	8
6	9
7	10
8	7
10	9
11	10
\.


--
-- Data for Name: _nc_m2m_4_DRIVERS_6_TRANSPORTS; Type: TABLE DATA; Schema: p3llodmezayxe7x; Owner: -
--

COPY p3llodmezayxe7x."_nc_m2m_4_DRIVERS_6_TRANSPORTS" ("6_TRANSPORTS_id", "4_DRIVERS_id") FROM stdin;
3	5
4	6
5	8
6	9
7	10
8	7
10	6
11	6
\.


--
-- Data for Name: _nc_m2m_6_TRANSPORTS_7_FREIGHTS; Type: TABLE DATA; Schema: p3llodmezayxe7x; Owner: -
--

COPY p3llodmezayxe7x."_nc_m2m_6_TRANSPORTS_7_FREIGHTS" ("7_FREIGHTS_id", "6_TRANSPORTS_id") FROM stdin;
3	3
4	4
5	5
6	6
7	7
8	8
10	10
10	11
\.


--
-- Data for Name: Features; Type: TABLE DATA; Schema: ptbstfo5b36htsq; Owner: -
--

COPY ptbstfo5b36htsq."Features" (id, created_at, updated_at, created_by, updated_by, nc_order, title) FROM stdin;
\.


--
-- Data for Name: nc_api_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_api_tokens (id, base_id, db_alias, description, permissions, token, expiry, enabled, fk_user_id, fk_workspace_id, fk_sso_client_id, created_at, updated_at) FROM stdin;
1	\N	\N	Token-1	\N	oemr4pTEByLHqpTQDyyqG6K6CYPbeBApATFjEUZb	\N	t	us96d0spja9v6cqe	\N	\N	2026-02-10 16:28:50+00	2026-02-10 16:28:50+00
\.


--
-- Data for Name: nc_audit_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_audit_v2 (id, "user", ip, source_id, base_id, fk_model_id, row_id, op_type, op_sub_type, status, description, details, fk_user_id, fk_ref_id, fk_parent_id, fk_workspace_id, fk_org_id, user_agent, version, old_id, created_at, updated_at) FROM stdin;
019c28f0-4d73-73fc-8ccd-d3b43fe2bb87	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	\N	DATA_BULK_INSERT	\N	\N	\N	{"table_title":"1_CLIENTS_csv"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 13:56:03+00	2026-02-04 13:56:03+00
019c28f0-4d77-7103-bca4-c7c3447804f1	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	1	DATA_INSERT	\N	\N	\N	{"data":{"Company Name":"Spedycja Kowalski Sp. z o.o.","VAT ID":"PL5213000001","Address":"ul. Transportowa 12, 00-001 Warszawa","Email":"biuro@kowalski-sped.pl","Phone":"+48 22 111 2233","Notes":"Staly klient - transport krajowy"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"SingleLineText","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"SingleLineText","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS_csv"}	us96d0spja9v6cqe	\N	019c28f0-4d72-7648-b2b3-f3a5dbd7e39b	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 13:56:03+00	2026-02-04 13:56:03+00
019c28f0-4d77-7103-bca4-ca42848e82c0	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	2	DATA_INSERT	\N	\N	\N	{"data":{"Company Name":"LogiTrans GmbH","VAT ID":"DE123456789","Address":"Industriestr. 45, 10115 Berlin","Email":"info@logitrans.de","Phone":"+49 30 555 6677","Notes":"Partner niemiecki"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"SingleLineText","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"SingleLineText","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS_csv"}	us96d0spja9v6cqe	\N	019c28f0-4d72-7648-b2b3-f3a5dbd7e39b	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 13:56:03+00	2026-02-04 13:56:03+00
019c28f0-4d77-7103-bca4-ce1ac3f80ddc	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	3	DATA_INSERT	\N	\N	\N	{"data":{"Company Name":"Fresh Cargo S.A.","VAT ID":"PL7890123456","Address":"ul. Chlodnicza 8, 80-001 Gdansk","Email":"kontakt@freshcargo.pl","Phone":"+48 58 333 4455","Notes":"Specjalizacja: transport chlodniczy"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"SingleLineText","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"SingleLineText","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS_csv"}	us96d0spja9v6cqe	\N	019c28f0-4d72-7648-b2b3-f3a5dbd7e39b	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 13:56:03+00	2026-02-04 13:56:03+00
019c28f0-4d85-7529-80ce-2e7fc617d10d	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	\N	DATA_BULK_INSERT	\N	\N	\N	{"table_title":"2_CONTACTS_csv"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 13:56:03+00	2026-02-04 13:56:03+00
019c28f0-4d89-7375-abf3-6893f7851f76	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	1	DATA_INSERT	\N	\N	\N	{"data":{"Full Name":"Jan Kowalski","Position":"Dyrektor Logistyki","Email":"jan.kowalski@kowalski-sped.pl","Phone":"+48 601 111 222","Client":"Spedycja Kowalski Sp. z o.o.","Primary Contact":"true"},"column_meta":{"Full Name":{"id":"c2nbpggrn6owwf0","title":"Full Name","type":"SingleLineText","options":{}},"Position":{"id":"c6xwf0zvnc0i1wv","title":"Position","type":"SingleLineText","options":{}},"Email":{"id":"czjl2l2p4tdngdk","title":"Email","type":"SingleLineText","options":{}},"Phone":{"id":"cagos3j9ylye6h0","title":"Phone","type":"SingleLineText","options":{}},"Client":{"id":"c7qno17pnxmt5mn","title":"Client","type":"SingleLineText","options":{}},"Primary Contact":{"id":"cdu655wgil3odmm","title":"Primary Contact","type":"SingleLineText","options":{}}},"table_title":"2_CONTACTS_csv"}	us96d0spja9v6cqe	\N	019c28f0-4d85-7529-80ce-2a2b7b286889	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 13:56:03+00	2026-02-04 13:56:03+00
019c28f0-4d89-7375-abf3-6d0b0e291ea4	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	2	DATA_INSERT	\N	\N	\N	{"data":{"Full Name":"Anna Nowak","Position":"Spedytor","Email":"anna.nowak@kowalski-sped.pl","Phone":"+48 602 333 444","Client":"Spedycja Kowalski Sp. z o.o.","Primary Contact":"false"},"column_meta":{"Full Name":{"id":"c2nbpggrn6owwf0","title":"Full Name","type":"SingleLineText","options":{}},"Position":{"id":"c6xwf0zvnc0i1wv","title":"Position","type":"SingleLineText","options":{}},"Email":{"id":"czjl2l2p4tdngdk","title":"Email","type":"SingleLineText","options":{}},"Phone":{"id":"cagos3j9ylye6h0","title":"Phone","type":"SingleLineText","options":{}},"Client":{"id":"c7qno17pnxmt5mn","title":"Client","type":"SingleLineText","options":{}},"Primary Contact":{"id":"cdu655wgil3odmm","title":"Primary Contact","type":"SingleLineText","options":{}}},"table_title":"2_CONTACTS_csv"}	us96d0spja9v6cqe	\N	019c28f0-4d85-7529-80ce-2a2b7b286889	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 13:56:03+00	2026-02-04 13:56:03+00
019c28f0-4d89-7375-abf3-72d1745e6ade	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	3	DATA_INSERT	\N	\N	\N	{"data":{"Full Name":"Klaus Mueller","Position":"Disponent","Email":"k.mueller@logitrans.de","Phone":"+49 170 555 666","Client":"LogiTrans GmbH","Primary Contact":"true"},"column_meta":{"Full Name":{"id":"c2nbpggrn6owwf0","title":"Full Name","type":"SingleLineText","options":{}},"Position":{"id":"c6xwf0zvnc0i1wv","title":"Position","type":"SingleLineText","options":{}},"Email":{"id":"czjl2l2p4tdngdk","title":"Email","type":"SingleLineText","options":{}},"Phone":{"id":"cagos3j9ylye6h0","title":"Phone","type":"SingleLineText","options":{}},"Client":{"id":"c7qno17pnxmt5mn","title":"Client","type":"SingleLineText","options":{}},"Primary Contact":{"id":"cdu655wgil3odmm","title":"Primary Contact","type":"SingleLineText","options":{}}},"table_title":"2_CONTACTS_csv"}	us96d0spja9v6cqe	\N	019c28f0-4d85-7529-80ce-2a2b7b286889	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 13:56:03+00	2026-02-04 13:56:03+00
019c28f0-4d90-7100-a2e1-9ce8c9ba853a	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	\N	DATA_BULK_INSERT	\N	\N	\N	{"table_title":"3_VEHICLES_csv"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 13:56:03+00	2026-02-04 13:56:03+00
019c28f4-bb02-750d-a305-f6044967d61b	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	\N	DATA_BULK_INSERT	\N	\N	\N	{"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00
019c28f0-4d89-7375-abf3-75f0b4cb509e	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	4	DATA_INSERT	\N	\N	\N	{"data":{"Full Name":"Marta Wisniewska","Position":"Kierownik Spedycji","Email":"m.wisniewska@freshcargo.pl","Phone":"+48 603 777 888","Client":"Fresh Cargo S.A.","Primary Contact":"true"},"column_meta":{"Full Name":{"id":"c2nbpggrn6owwf0","title":"Full Name","type":"SingleLineText","options":{}},"Position":{"id":"c6xwf0zvnc0i1wv","title":"Position","type":"SingleLineText","options":{}},"Email":{"id":"czjl2l2p4tdngdk","title":"Email","type":"SingleLineText","options":{}},"Phone":{"id":"cagos3j9ylye6h0","title":"Phone","type":"SingleLineText","options":{}},"Client":{"id":"c7qno17pnxmt5mn","title":"Client","type":"SingleLineText","options":{}},"Primary Contact":{"id":"cdu655wgil3odmm","title":"Primary Contact","type":"SingleLineText","options":{}}},"table_title":"2_CONTACTS_csv"}	us96d0spja9v6cqe	\N	019c28f0-4d85-7529-80ce-2a2b7b286889	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 13:56:03+00	2026-02-04 13:56:03+00
019c28f0-4d93-707f-981e-22f4ba5d4be9	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	1	DATA_INSERT	\N	\N	\N	{"data":{"Registration Number":"WGM 12345","Body Type":"Firanka","Capacity kg":"24000","Capacity m3":"86","Pallet Spaces":"33","ADR":"false","Insurance Expiry":"2026-06-15","Notes":"2026-12-31"},"column_meta":{"Registration Number":{"id":"cdfgt6v8nwr9y3i","title":"Registration Number","type":"SingleLineText","options":{}},"Body Type":{"id":"c0jnjk2odll3lua","title":"Body Type","type":"SingleLineText","options":{}},"Capacity kg":{"id":"ckaouubcd7i4gyu","title":"Capacity kg","type":"SingleLineText","options":{}},"Capacity m3":{"id":"cesdp9nw5n67yxk","title":"Capacity m3","type":"SingleLineText","options":{}},"Pallet Spaces":{"id":"cq97xn3cuh3mohw","title":"Pallet Spaces","type":"SingleLineText","options":{}},"ADR":{"id":"c66lc7ur0u96fqs","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"cqn3y5r2szclrrt","title":"ADR Classes","type":"SingleLineText","options":{}},"Inspection Date":{"id":"ca5tehxb5qu3trm","title":"Inspection Date","type":"SingleLineText","options":{}},"Insurance Expiry":{"id":"c6iwsnpecti6kwh","title":"Insurance Expiry","type":"SingleLineText","options":{}},"Notes":{"id":"c4zvkx95ndqle16","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"3_VEHICLES_csv"}	us96d0spja9v6cqe	\N	019c28f0-4d90-7100-a2e1-99d4cf2f0470	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 13:56:03+00	2026-02-04 13:56:03+00
019c28f0-4d93-707f-981e-26260498b4ee	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	2	DATA_INSERT	\N	\N	\N	{"data":{"Registration Number":"KR 67890","Body Type":"Chlodnia","Capacity kg":"22000","Capacity m3":"76","Pallet Spaces":"33","ADR":"false","Insurance Expiry":"2026-03-20","Notes":"2026-09-30"},"column_meta":{"Registration Number":{"id":"cdfgt6v8nwr9y3i","title":"Registration Number","type":"SingleLineText","options":{}},"Body Type":{"id":"c0jnjk2odll3lua","title":"Body Type","type":"SingleLineText","options":{}},"Capacity kg":{"id":"ckaouubcd7i4gyu","title":"Capacity kg","type":"SingleLineText","options":{}},"Capacity m3":{"id":"cesdp9nw5n67yxk","title":"Capacity m3","type":"SingleLineText","options":{}},"Pallet Spaces":{"id":"cq97xn3cuh3mohw","title":"Pallet Spaces","type":"SingleLineText","options":{}},"ADR":{"id":"c66lc7ur0u96fqs","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"cqn3y5r2szclrrt","title":"ADR Classes","type":"SingleLineText","options":{}},"Inspection Date":{"id":"ca5tehxb5qu3trm","title":"Inspection Date","type":"SingleLineText","options":{}},"Insurance Expiry":{"id":"c6iwsnpecti6kwh","title":"Insurance Expiry","type":"SingleLineText","options":{}},"Notes":{"id":"c4zvkx95ndqle16","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"3_VEHICLES_csv"}	us96d0spja9v6cqe	\N	019c28f0-4d90-7100-a2e1-99d4cf2f0470	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 13:56:03+00	2026-02-04 13:56:03+00
019c28f0-4d93-707f-981e-290f4584c6ee	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	3	DATA_INSERT	\N	\N	\N	{"data":{"Registration Number":"GD 11223","Body Type":"Mega","Capacity kg":"24000","Capacity m3":"100","Pallet Spaces":"36","ADR":"true","ADR Classes":"2,3","Inspection Date":"2026-08-10","Insurance Expiry":"2027-01-15","Notes":"Certyfikat ADR do 2027"},"column_meta":{"Registration Number":{"id":"cdfgt6v8nwr9y3i","title":"Registration Number","type":"SingleLineText","options":{}},"Body Type":{"id":"c0jnjk2odll3lua","title":"Body Type","type":"SingleLineText","options":{}},"Capacity kg":{"id":"ckaouubcd7i4gyu","title":"Capacity kg","type":"SingleLineText","options":{}},"Capacity m3":{"id":"cesdp9nw5n67yxk","title":"Capacity m3","type":"SingleLineText","options":{}},"Pallet Spaces":{"id":"cq97xn3cuh3mohw","title":"Pallet Spaces","type":"SingleLineText","options":{}},"ADR":{"id":"c66lc7ur0u96fqs","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"cqn3y5r2szclrrt","title":"ADR Classes","type":"SingleLineText","options":{}},"Inspection Date":{"id":"ca5tehxb5qu3trm","title":"Inspection Date","type":"SingleLineText","options":{}},"Insurance Expiry":{"id":"c6iwsnpecti6kwh","title":"Insurance Expiry","type":"SingleLineText","options":{}},"Notes":{"id":"c4zvkx95ndqle16","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"3_VEHICLES_csv"}	us96d0spja9v6cqe	\N	019c28f0-4d90-7100-a2e1-99d4cf2f0470	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 13:56:03+00	2026-02-04 13:56:03+00
019c28f0-4d93-707f-981e-2ee97e91750a	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	4	DATA_INSERT	\N	\N	\N	{"data":{"Registration Number":"WE 44556","Body Type":"Bus","Capacity kg":"3500","Capacity m3":"22","Pallet Spaces":"8","ADR":"false","Insurance Expiry":"2026-05-01","Notes":"2026-11-30"},"column_meta":{"Registration Number":{"id":"cdfgt6v8nwr9y3i","title":"Registration Number","type":"SingleLineText","options":{}},"Body Type":{"id":"c0jnjk2odll3lua","title":"Body Type","type":"SingleLineText","options":{}},"Capacity kg":{"id":"ckaouubcd7i4gyu","title":"Capacity kg","type":"SingleLineText","options":{}},"Capacity m3":{"id":"cesdp9nw5n67yxk","title":"Capacity m3","type":"SingleLineText","options":{}},"Pallet Spaces":{"id":"cq97xn3cuh3mohw","title":"Pallet Spaces","type":"SingleLineText","options":{}},"ADR":{"id":"c66lc7ur0u96fqs","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"cqn3y5r2szclrrt","title":"ADR Classes","type":"SingleLineText","options":{}},"Inspection Date":{"id":"ca5tehxb5qu3trm","title":"Inspection Date","type":"SingleLineText","options":{}},"Insurance Expiry":{"id":"c6iwsnpecti6kwh","title":"Insurance Expiry","type":"SingleLineText","options":{}},"Notes":{"id":"c4zvkx95ndqle16","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"3_VEHICLES_csv"}	us96d0spja9v6cqe	\N	019c28f0-4d90-7100-a2e1-99d4cf2f0470	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 13:56:03+00	2026-02-04 13:56:03+00
019c28f4-bae6-749a-9737-be2f219784ef	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	\N	DATA_BULK_INSERT	\N	\N	\N	{"table_title":"4_DRIVERS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00
019c28f4-baf5-77cd-98bc-5b4f597fa943	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	\N	DATA_BULK_INSERT	\N	\N	\N	{"table_title":"5_INQUIRIES"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00
019c28f4-bafa-72b7-90d9-649c8ac67ea9	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	3	DATA_INSERT	\N	\N	\N	{"data":{"Inquiry Date":"2026-02-04","Client":"Fresh Cargo S.A.","Contact":"Marta Wisniewska","Origin City/Postal":"Gdynia 81-300","Destination City/Postal":"Munchen 80331","Loading Date":"2026-02-15","Delivery Date":"2026-02-16","Cargo Type":"ADR","ADR":"true","ADR Class/UN":"3, UN1203","Dimensions":"120x80x120 x 10szt","Weight kg":"8000","Status":"New","Source":"Web Form","UTM Source":"google_ads","Notes":"Paliwo - wymaga ADR"},"column_meta":{"Inquiry Date":{"id":"cmn1ybxtu5x8dir","title":"Inquiry Date","type":"SingleLineText","options":{}},"Client":{"id":"cevrryyz232x8ki","title":"Client","type":"SingleLineText","options":{}},"Contact":{"id":"cvsbar5bv0dgw0d","title":"Contact","type":"SingleLineText","options":{}},"Origin City/Postal":{"id":"cpqf815rcewemca","title":"Origin City/Postal","type":"SingleLineText","options":{}},"Destination City/Postal":{"id":"co2p76yxmu15j0c","title":"Destination City/Postal","type":"SingleLineText","options":{}},"Loading Date":{"id":"chn4jquzl3h28zo","title":"Loading Date","type":"SingleLineText","options":{}},"Delivery Date":{"id":"c8sm408mq0rdcto","title":"Delivery Date","type":"SingleLineText","options":{}},"Cargo Type":{"id":"c235bwvy3tdxwf6","title":"Cargo Type","type":"SingleLineText","options":{}},"ADR":{"id":"c0ym69tqbt8gwt3","title":"ADR","type":"SingleLineText","options":{}},"ADR Class/UN":{"id":"c6zwoo8y63ltyv3","title":"ADR Class/UN","type":"SingleLineText","options":{}},"Dimensions":{"id":"cjghtnwgjnrzevk","title":"Dimensions","type":"SingleLineText","options":{}},"Weight kg":{"id":"cjbz903x16h3fxq","title":"Weight kg","type":"SingleLineText","options":{}},"Status":{"id":"cd389hjyxspaaxb","title":"Status","type":"SingleLineText","options":{}},"Source":{"id":"cc24y3hh7vpd4dj","title":"Source","type":"SingleLineText","options":{}},"UTM Source":{"id":"cmf6l7fe8gjbnxj","title":"UTM Source","type":"SingleLineText","options":{}},"Notes":{"id":"c9o7z61oc3yjk9a","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"5_INQUIRIES"}	us96d0spja9v6cqe	\N	019c28f4-baf4-764e-b6e9-cad240479489	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00
019c28f4-bae9-723e-b3f8-76508d109e8f	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	1	DATA_INSERT	\N	\N	\N	{"data":{"Full Name":"Tomasz Zielinski","Phone":"+48 604 111 222","License Categories":"B,C,C+E","ADR":"true","ADR Classes":"2,3","ADR Expiry Date":"2027-03-15","Medical Exam Expiry":"2026-09-30","Vehicle":"GD 11223","Notes":"Doswiadczony kierowca miedzynarodowy"},"column_meta":{"Full Name":{"id":"cbq31ueyugq2iav","title":"Full Name","type":"SingleLineText","options":{}},"Phone":{"id":"cqrt8an0urr8w35","title":"Phone","type":"SingleLineText","options":{}},"License Categories":{"id":"codggsij3km6lx8","title":"License Categories","type":"SingleLineText","options":{}},"ADR":{"id":"cqjeqj5psqekap9","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"czg2afeptb6je6u","title":"ADR Classes","type":"SingleLineText","options":{}},"ADR Expiry Date":{"id":"choxwcuo6pmcyk6","title":"ADR Expiry Date","type":"SingleLineText","options":{}},"Medical Exam Expiry":{"id":"c3uybhwo4d34h36","title":"Medical Exam Expiry","type":"SingleLineText","options":{}},"Vehicle":{"id":"cma3jbdrqttl8za","title":"Vehicle","type":"SingleLineText","options":{}},"Notes":{"id":"crc6aim561n4s9s","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"4_DRIVERS"}	us96d0spja9v6cqe	\N	019c28f4-bae6-749a-9737-b90273166388	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00
019c28f4-bae9-723e-b3f8-7aba0f7c9f4d	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	2	DATA_INSERT	\N	\N	\N	{"data":{"Full Name":"Pawel Mazur","Phone":"+48 605 333 444","License Categories":"B,C,C+E","ADR":"false","Medical Exam Expiry":"2026-12-15","Vehicle":"WGM 12345","Notes":"Trasy krajowe"},"column_meta":{"Full Name":{"id":"cbq31ueyugq2iav","title":"Full Name","type":"SingleLineText","options":{}},"Phone":{"id":"cqrt8an0urr8w35","title":"Phone","type":"SingleLineText","options":{}},"License Categories":{"id":"codggsij3km6lx8","title":"License Categories","type":"SingleLineText","options":{}},"ADR":{"id":"cqjeqj5psqekap9","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"czg2afeptb6je6u","title":"ADR Classes","type":"SingleLineText","options":{}},"ADR Expiry Date":{"id":"choxwcuo6pmcyk6","title":"ADR Expiry Date","type":"SingleLineText","options":{}},"Medical Exam Expiry":{"id":"c3uybhwo4d34h36","title":"Medical Exam Expiry","type":"SingleLineText","options":{}},"Vehicle":{"id":"cma3jbdrqttl8za","title":"Vehicle","type":"SingleLineText","options":{}},"Notes":{"id":"crc6aim561n4s9s","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"4_DRIVERS"}	us96d0spja9v6cqe	\N	019c28f4-bae6-749a-9737-b90273166388	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00
019c28f4-bae9-723e-b3f8-7dbf2f97f850	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	3	DATA_INSERT	\N	\N	\N	{"data":{"Full Name":"Robert Kaczmarek","Phone":"+48 606 555 666","License Categories":"B,C,C+E","ADR":"false","Medical Exam Expiry":"2027-06-20","Vehicle":"KR 67890","Notes":"Specjalizacja: transport chlodniczy"},"column_meta":{"Full Name":{"id":"cbq31ueyugq2iav","title":"Full Name","type":"SingleLineText","options":{}},"Phone":{"id":"cqrt8an0urr8w35","title":"Phone","type":"SingleLineText","options":{}},"License Categories":{"id":"codggsij3km6lx8","title":"License Categories","type":"SingleLineText","options":{}},"ADR":{"id":"cqjeqj5psqekap9","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"czg2afeptb6je6u","title":"ADR Classes","type":"SingleLineText","options":{}},"ADR Expiry Date":{"id":"choxwcuo6pmcyk6","title":"ADR Expiry Date","type":"SingleLineText","options":{}},"Medical Exam Expiry":{"id":"c3uybhwo4d34h36","title":"Medical Exam Expiry","type":"SingleLineText","options":{}},"Vehicle":{"id":"cma3jbdrqttl8za","title":"Vehicle","type":"SingleLineText","options":{}},"Notes":{"id":"crc6aim561n4s9s","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"4_DRIVERS"}	us96d0spja9v6cqe	\N	019c28f4-bae6-749a-9737-b90273166388	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00
019c28f4-bae9-723e-b3f8-831447dca3c6	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	4	DATA_INSERT	\N	\N	\N	{"data":{"Full Name":"Marek Duda","Phone":"+48 607 777 888","License Categories":"B,C","ADR":"false","Medical Exam Expiry":"2026-08-10","Vehicle":"WE 44556","Notes":"Dostawy lokalne"},"column_meta":{"Full Name":{"id":"cbq31ueyugq2iav","title":"Full Name","type":"SingleLineText","options":{}},"Phone":{"id":"cqrt8an0urr8w35","title":"Phone","type":"SingleLineText","options":{}},"License Categories":{"id":"codggsij3km6lx8","title":"License Categories","type":"SingleLineText","options":{}},"ADR":{"id":"cqjeqj5psqekap9","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"czg2afeptb6je6u","title":"ADR Classes","type":"SingleLineText","options":{}},"ADR Expiry Date":{"id":"choxwcuo6pmcyk6","title":"ADR Expiry Date","type":"SingleLineText","options":{}},"Medical Exam Expiry":{"id":"c3uybhwo4d34h36","title":"Medical Exam Expiry","type":"SingleLineText","options":{}},"Vehicle":{"id":"cma3jbdrqttl8za","title":"Vehicle","type":"SingleLineText","options":{}},"Notes":{"id":"crc6aim561n4s9s","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"4_DRIVERS"}	us96d0spja9v6cqe	\N	019c28f4-bae6-749a-9737-b90273166388	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00
019c28f4-baf9-700f-9ef5-29218c5b0d07	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	1	DATA_INSERT	\N	\N	\N	{"data":{"Inquiry Date":"2026-02-01","Client":"Spedycja Kowalski Sp. z o.o.","Contact":"Jan Kowalski","Origin City/Postal":"Warszawa 00-001","Destination City/Postal":"Berlin 10115","Loading Date":"2026-02-10","Delivery Date":"2026-02-11","Cargo Type":"Palety","ADR":"false","Dimensions":"120x80x180 x 20szt","Weight kg":"12000","Status":"New","Source":"Phone","Notes":"20 palet euro"},"column_meta":{"Inquiry Date":{"id":"cmn1ybxtu5x8dir","title":"Inquiry Date","type":"SingleLineText","options":{}},"Client":{"id":"cevrryyz232x8ki","title":"Client","type":"SingleLineText","options":{}},"Contact":{"id":"cvsbar5bv0dgw0d","title":"Contact","type":"SingleLineText","options":{}},"Origin City/Postal":{"id":"cpqf815rcewemca","title":"Origin City/Postal","type":"SingleLineText","options":{}},"Destination City/Postal":{"id":"co2p76yxmu15j0c","title":"Destination City/Postal","type":"SingleLineText","options":{}},"Loading Date":{"id":"chn4jquzl3h28zo","title":"Loading Date","type":"SingleLineText","options":{}},"Delivery Date":{"id":"c8sm408mq0rdcto","title":"Delivery Date","type":"SingleLineText","options":{}},"Cargo Type":{"id":"c235bwvy3tdxwf6","title":"Cargo Type","type":"SingleLineText","options":{}},"ADR":{"id":"c0ym69tqbt8gwt3","title":"ADR","type":"SingleLineText","options":{}},"ADR Class/UN":{"id":"c6zwoo8y63ltyv3","title":"ADR Class/UN","type":"SingleLineText","options":{}},"Dimensions":{"id":"cjghtnwgjnrzevk","title":"Dimensions","type":"SingleLineText","options":{}},"Weight kg":{"id":"cjbz903x16h3fxq","title":"Weight kg","type":"SingleLineText","options":{}},"Status":{"id":"cd389hjyxspaaxb","title":"Status","type":"SingleLineText","options":{}},"Source":{"id":"cc24y3hh7vpd4dj","title":"Source","type":"SingleLineText","options":{}},"UTM Source":{"id":"cmf6l7fe8gjbnxj","title":"UTM Source","type":"SingleLineText","options":{}},"Notes":{"id":"c9o7z61oc3yjk9a","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"5_INQUIRIES"}	us96d0spja9v6cqe	\N	019c28f4-baf4-764e-b6e9-cad240479489	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00
019c28f4-bafa-72b7-90d9-635e756feccf	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	2	DATA_INSERT	\N	\N	\N	{"data":{"Inquiry Date":"2026-02-03","Client":"LogiTrans GmbH","Contact":"Klaus Mueller","Origin City/Postal":"Hamburg 20095","Destination City/Postal":"Gdansk 80-001","Loading Date":"2026-02-12","Delivery Date":"2026-02-13","Cargo Type":"Chlodnia","ADR":"false","Dimensions":"Calopojazdowy","Weight kg":"18000","Status":"Quoted","Source":"Email","Notes":"Temperatura -18C"},"column_meta":{"Inquiry Date":{"id":"cmn1ybxtu5x8dir","title":"Inquiry Date","type":"SingleLineText","options":{}},"Client":{"id":"cevrryyz232x8ki","title":"Client","type":"SingleLineText","options":{}},"Contact":{"id":"cvsbar5bv0dgw0d","title":"Contact","type":"SingleLineText","options":{}},"Origin City/Postal":{"id":"cpqf815rcewemca","title":"Origin City/Postal","type":"SingleLineText","options":{}},"Destination City/Postal":{"id":"co2p76yxmu15j0c","title":"Destination City/Postal","type":"SingleLineText","options":{}},"Loading Date":{"id":"chn4jquzl3h28zo","title":"Loading Date","type":"SingleLineText","options":{}},"Delivery Date":{"id":"c8sm408mq0rdcto","title":"Delivery Date","type":"SingleLineText","options":{}},"Cargo Type":{"id":"c235bwvy3tdxwf6","title":"Cargo Type","type":"SingleLineText","options":{}},"ADR":{"id":"c0ym69tqbt8gwt3","title":"ADR","type":"SingleLineText","options":{}},"ADR Class/UN":{"id":"c6zwoo8y63ltyv3","title":"ADR Class/UN","type":"SingleLineText","options":{}},"Dimensions":{"id":"cjghtnwgjnrzevk","title":"Dimensions","type":"SingleLineText","options":{}},"Weight kg":{"id":"cjbz903x16h3fxq","title":"Weight kg","type":"SingleLineText","options":{}},"Status":{"id":"cd389hjyxspaaxb","title":"Status","type":"SingleLineText","options":{}},"Source":{"id":"cc24y3hh7vpd4dj","title":"Source","type":"SingleLineText","options":{}},"UTM Source":{"id":"cmf6l7fe8gjbnxj","title":"UTM Source","type":"SingleLineText","options":{}},"Notes":{"id":"c9o7z61oc3yjk9a","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"5_INQUIRIES"}	us96d0spja9v6cqe	\N	019c28f4-baf4-764e-b6e9-cad240479489	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00
019c28f4-bb03-712b-84d7-c6d80d5f8f36	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	1	DATA_INSERT	\N	\N	\N	{"data":{"Departure Date":"2026-02-10","Origin":"Warszawa","Destination":"Berlin","Vehicle":"WGM 12345","Driver":"Pawel Mazur","Status":"Planned","Notes":"Ladunek: 20 palet euro"},"column_meta":{"Departure Date":{"id":"ckfllneskfstzzf","title":"Departure Date","type":"SingleLineText","options":{}},"Origin":{"id":"c77cudldn2ldi4z","title":"Origin","type":"SingleLineText","options":{}},"Destination":{"id":"ct1zt0dav2juhz2","title":"Destination","type":"SingleLineText","options":{}},"Vehicle":{"id":"clu2kxul7iexnie","title":"Vehicle","type":"SingleLineText","options":{}},"Driver":{"id":"ctr4ur50y1rt0pa","title":"Driver","type":"SingleLineText","options":{}},"Status":{"id":"cmy7ib7lxogr0wy","title":"Status","type":"SingleLineText","options":{}},"Notes":{"id":"chtfkfr68ef5chk","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	019c28f4-bb01-775f-8fe3-929af9ae4ea3	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00
019c28f4-bb03-712b-84d7-c951e103711b	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	2	DATA_INSERT	\N	\N	\N	{"data":{"Departure Date":"2026-02-12","Origin":"Hamburg","Destination":"Gdansk","Vehicle":"KR 67890","Driver":"Robert Kaczmarek","Status":"Planned","Notes":"Transport chlodniczy -18C"},"column_meta":{"Departure Date":{"id":"ckfllneskfstzzf","title":"Departure Date","type":"SingleLineText","options":{}},"Origin":{"id":"c77cudldn2ldi4z","title":"Origin","type":"SingleLineText","options":{}},"Destination":{"id":"ct1zt0dav2juhz2","title":"Destination","type":"SingleLineText","options":{}},"Vehicle":{"id":"clu2kxul7iexnie","title":"Vehicle","type":"SingleLineText","options":{}},"Driver":{"id":"ctr4ur50y1rt0pa","title":"Driver","type":"SingleLineText","options":{}},"Status":{"id":"cmy7ib7lxogr0wy","title":"Status","type":"SingleLineText","options":{}},"Notes":{"id":"chtfkfr68ef5chk","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	019c28f4-bb01-775f-8fe3-929af9ae4ea3	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00
019c28f5-8da2-7008-8b12-1cd0ca30c706	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	\N	DATA_BULK_INSERT	\N	\N	\N	{"table_title":"7_FREIGHTS_csv"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:01:47+00	2026-02-04 14:01:47+00
019c28f5-8da8-71ea-b5ac-4570bbdf944d	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	1	DATA_INSERT	\N	\N	\N	{"data":{"Client":"Spedycja Kowalski Sp. z o.o.","Transport":"Warszawa-Berlin 2026-02-10","Unit Type":"Pallet","Quantity":"20","Cargo Description":"Czesci samochodowe na paletach euro","Pickup Address":"ul. Transportowa 12, Warszawa","Delivery Address":"Industriestr. 45, Berlin","Transport Capacity %":"60","Freight Price EUR":"1800.00","Invoiced":"false","Notes":"Czesc ladunku - reszta wolna"},"column_meta":{"Client":{"id":"c2l6l8py4xjuu7j","title":"Client","type":"SingleLineText","options":{}},"Transport":{"id":"ct2tnxus061vk9f","title":"Transport","type":"SingleLineText","options":{}},"Unit Type":{"id":"ciizexx8gnmmh8u","title":"Unit Type","type":"SingleLineText","options":{}},"Quantity":{"id":"c0c98b5g14umg7j","title":"Quantity","type":"SingleLineText","options":{}},"Cargo Description":{"id":"cz4rzid030j5ukx","title":"Cargo Description","type":"SingleLineText","options":{}},"Pickup Address":{"id":"c4fz8qjifateuuv","title":"Pickup Address","type":"SingleLineText","options":{}},"Delivery Address":{"id":"c6h4pr6nf24v55t","title":"Delivery Address","type":"SingleLineText","options":{}},"Transport Capacity %":{"id":"cqak82rc3kgncjz","title":"Transport Capacity %","type":"SingleLineText","options":{}},"Freight Price EUR":{"id":"cwmv5m3yjc4vjgd","title":"Freight Price EUR","type":"SingleLineText","options":{}},"Invoiced":{"id":"c1ao0fait4zsa1t","title":"Invoiced","type":"SingleLineText","options":{}},"Invoice Number":{"id":"cvk3wq35dagvfah","title":"Invoice Number","type":"SingleLineText","options":{}},"Notes":{"id":"cve6so9t8q8g5en","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"7_FREIGHTS_csv"}	us96d0spja9v6cqe	\N	019c28f5-8da0-77cd-9464-d8c351abca68	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:01:47+00	2026-02-04 14:01:47+00
019c28f5-8da8-71ea-b5ac-485e177dffc0	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	2	DATA_INSERT	\N	\N	\N	{"data":{"Client":"LogiTrans GmbH","Transport":"Hamburg-Gdansk 2026-02-12","Unit Type":"Other","Quantity":"1","Cargo Description":"Mrozonki - calopojazdowy","Pickup Address":"Hafenstr. 10, Hamburg","Delivery Address":"ul. Portowa 5, Gdansk","Transport Capacity %":"100","Freight Price EUR":"2200.00","Invoiced":"false","Notes":"FTL chlodnia"},"column_meta":{"Client":{"id":"c2l6l8py4xjuu7j","title":"Client","type":"SingleLineText","options":{}},"Transport":{"id":"ct2tnxus061vk9f","title":"Transport","type":"SingleLineText","options":{}},"Unit Type":{"id":"ciizexx8gnmmh8u","title":"Unit Type","type":"SingleLineText","options":{}},"Quantity":{"id":"c0c98b5g14umg7j","title":"Quantity","type":"SingleLineText","options":{}},"Cargo Description":{"id":"cz4rzid030j5ukx","title":"Cargo Description","type":"SingleLineText","options":{}},"Pickup Address":{"id":"c4fz8qjifateuuv","title":"Pickup Address","type":"SingleLineText","options":{}},"Delivery Address":{"id":"c6h4pr6nf24v55t","title":"Delivery Address","type":"SingleLineText","options":{}},"Transport Capacity %":{"id":"cqak82rc3kgncjz","title":"Transport Capacity %","type":"SingleLineText","options":{}},"Freight Price EUR":{"id":"cwmv5m3yjc4vjgd","title":"Freight Price EUR","type":"SingleLineText","options":{}},"Invoiced":{"id":"c1ao0fait4zsa1t","title":"Invoiced","type":"SingleLineText","options":{}},"Invoice Number":{"id":"cvk3wq35dagvfah","title":"Invoice Number","type":"SingleLineText","options":{}},"Notes":{"id":"cve6so9t8q8g5en","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"7_FREIGHTS_csv"}	us96d0spja9v6cqe	\N	019c28f5-8da0-77cd-9464-d8c351abca68	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:01:47+00	2026-02-04 14:01:47+00
019c2908-8fe4-70aa-87d8-3e650ba3ee33	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	\N	DATA_BULK_INSERT	\N	\N	\N	{"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:22:32+00	2026-02-04 14:22:32+00
019c2908-8fe9-7096-8be4-b1ff692ad396	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	4	DATA_INSERT	\N	\N	\N	{"data":{"Company Name":"Müller Logistik GmbH","VAT ID":"DE112233445","Address":"Hafenstr. 22, 20095 Hamburg","Email":"info@mueller-logistik.de","Phone":"+49 40 123 4567","Notes":"Staly klient - transport miedzynarodowy"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c2908-8fe4-70aa-87d8-38481a29f879	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:22:32+00	2026-02-04 14:22:32+00
019c2908-8fea-74a8-ab71-5dbed559eb2c	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	5	DATA_INSERT	\N	\N	\N	{"data":{"Company Name":"Schneider Spedition GmbH & Co. KG","VAT ID":"DE223344556","Address":"Industriestr. 8, 80331 München","Email":"kontakt@schneider-spedition.de","Phone":"+49 89 234 5678","Notes":"Transport calopojazdowy DE-PL"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c2908-8fe4-70aa-87d8-38481a29f879	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:22:32+00	2026-02-04 14:22:32+00
019c2908-8fea-74a8-ab71-630eed68adde	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	6	DATA_INSERT	\N	\N	\N	{"data":{"Company Name":"Weber Transporte GmbH","VAT ID":"DE334455667","Address":"Am Containerhafen 3, 28195 Bremen","Email":"info@weber-transporte.de","Phone":"+49 421 345 6789","Notes":"Specjalizacja: transport morski/kontenerowy"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c2908-8fe4-70aa-87d8-38481a29f879	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:22:32+00	2026-02-04 14:22:32+00
019c2908-8fea-74a8-ab71-664b6a439fce	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	7	DATA_INSERT	\N	\N	\N	{"data":{"Company Name":"Koch Kühllogistik GmbH","VAT ID":"DE445566778","Address":"Kühlhausring 15, 50667 Köln","Email":"disposition@koch-kuehl.de","Phone":"+49 221 456 7890","Notes":"Transport chlodniczy - mrozonki i swieze"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c2908-8fe4-70aa-87d8-38481a29f879	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:22:32+00	2026-02-04 14:22:32+00
019c2908-8fea-74a8-ab71-6853c5d14eab	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	8	DATA_INSERT	\N	\N	\N	{"data":{"Company Name":"Braun Chemie Transport AG","VAT ID":"DE556677889","Address":"Rheinuferstr. 40, 40213 Düsseldorf","Email":"logistik@braun-chemie.de","Phone":"+49 211 567 8901","Notes":"ADR - transport chemikaliow kl. 3 i 8"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c2908-8fe4-70aa-87d8-38481a29f879	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:22:32+00	2026-02-04 14:22:32+00
019c2908-8fea-74a8-ab71-6f1bdee9bbe1	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	9	DATA_INSERT	\N	\N	\N	{"data":{"Company Name":"Fischer Automotive Logistics GmbH","VAT ID":"DE667788990","Address":"Werksallee 7, 70173 Stuttgart","Email":"spedition@fischer-auto.de","Phone":"+49 711 678 9012","Notes":"Czesci samochodowe - JIT delivery"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c2908-8fe4-70aa-87d8-38481a29f879	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:22:32+00	2026-02-04 14:22:32+00
019c290b-37b6-77de-bad7-bbb66f83c2c8	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	\N	DATA_BULK_DELETE	\N	\N	\N	{"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:25:26+00	2026-02-04 14:25:26+00
019c290b-37b8-702f-9396-e8110daf1af4	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	1	DATA_DELETE	\N	\N	\N	{"data":{"Company Name":"Spedycja Kowalski Sp. z o.o.","VAT ID":"PL5213000001","Address":"ul. Transportowa 12, 00-001 Warszawa","Email":"biuro@kowalski-sped.pl","Phone":"+48 22 111 2233","Notes":"Staly klient - transport krajowy"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c290b-37b5-740e-b925-4cc518f4d59f	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:25:26+00	2026-02-04 14:25:26+00
019c290b-37ba-76c3-ae94-75a3f3a8e14e	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	2	DATA_DELETE	\N	\N	\N	{"data":{"Company Name":"LogiTrans GmbH","VAT ID":"DE123456789","Address":"Industriestr. 45, 10115 Berlin","Email":"info@logitrans.de","Phone":"+49 30 555 6677","Notes":"Partner niemiecki"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c290b-37b5-740e-b925-4cc518f4d59f	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:25:26+00	2026-02-04 14:25:26+00
019c290b-37ba-76c3-ae94-79276dc6f2b1	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	3	DATA_DELETE	\N	\N	\N	{"data":{"Company Name":"Fresh Cargo S.A.","VAT ID":"PL7890123456","Address":"ul. Chlodnicza 8, 80-001 Gdansk","Email":"kontakt@freshcargo.pl","Phone":"+48 58 333 4455","Notes":"Specjalizacja: transport chlodniczy"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c290b-37b5-740e-b925-4cc518f4d59f	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:25:26+00	2026-02-04 14:25:26+00
019c290b-37ba-76c3-ae94-7c324174ba88	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	4	DATA_DELETE	\N	\N	\N	{"data":{"Company Name":"Müller Logistik GmbH","VAT ID":"DE112233445","Address":"Hafenstr. 22, 20095 Hamburg","Email":"info@mueller-logistik.de","Phone":"+49 40 123 4567","Notes":"Staly klient - transport miedzynarodowy"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c290b-37b5-740e-b925-4cc518f4d59f	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:25:26+00	2026-02-04 14:25:26+00
019c290b-37ba-76c3-ae94-8044f685bb5b	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	5	DATA_DELETE	\N	\N	\N	{"data":{"Company Name":"Schneider Spedition GmbH & Co. KG","VAT ID":"DE223344556","Address":"Industriestr. 8, 80331 München","Email":"kontakt@schneider-spedition.de","Phone":"+49 89 234 5678","Notes":"Transport calopojazdowy DE-PL"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c290b-37b5-740e-b925-4cc518f4d59f	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:25:26+00	2026-02-04 14:25:26+00
019c290b-37ba-76c3-ae94-872c025e9b67	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	6	DATA_DELETE	\N	\N	\N	{"data":{"Company Name":"Weber Transporte GmbH","VAT ID":"DE334455667","Address":"Am Containerhafen 3, 28195 Bremen","Email":"info@weber-transporte.de","Phone":"+49 421 345 6789","Notes":"Specjalizacja: transport morski/kontenerowy"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c290b-37b5-740e-b925-4cc518f4d59f	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:25:26+00	2026-02-04 14:25:26+00
019c290b-37ba-76c3-ae94-894b34a9b498	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	7	DATA_DELETE	\N	\N	\N	{"data":{"Company Name":"Koch Kühllogistik GmbH","VAT ID":"DE445566778","Address":"Kühlhausring 15, 50667 Köln","Email":"disposition@koch-kuehl.de","Phone":"+49 221 456 7890","Notes":"Transport chlodniczy - mrozonki i swieze"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c290b-37b5-740e-b925-4cc518f4d59f	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:25:26+00	2026-02-04 14:25:26+00
019c290b-37ba-76c3-ae94-8c52edfb25c9	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	8	DATA_DELETE	\N	\N	\N	{"data":{"Company Name":"Braun Chemie Transport AG","VAT ID":"DE556677889","Address":"Rheinuferstr. 40, 40213 Düsseldorf","Email":"logistik@braun-chemie.de","Phone":"+49 211 567 8901","Notes":"ADR - transport chemikaliow kl. 3 i 8"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c290b-37b5-740e-b925-4cc518f4d59f	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:25:26+00	2026-02-04 14:25:26+00
019c290b-37ba-76c3-ae94-91e75ac2250b	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	9	DATA_DELETE	\N	\N	\N	{"data":{"Company Name":"Fischer Automotive Logistics GmbH","VAT ID":"DE667788990","Address":"Werksallee 7, 70173 Stuttgart","Email":"spedition@fischer-auto.de","Phone":"+49 711 678 9012","Notes":"Czesci samochodowe - JIT delivery"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c290b-37b5-740e-b925-4cc518f4d59f	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:25:26+00	2026-02-04 14:25:26+00
019c290f-92b9-7052-a206-7d5c075b4441	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	\N	DATA_BULK_DELETE	\N	\N	\N	{"table_title":"2_CONTACTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:30:12+00	2026-02-04 14:30:12+00
019c290f-92bb-723a-bf97-aa4dadc51bc8	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	1	DATA_DELETE	\N	\N	\N	{"data":{"Full Name":"Jan Kowalski","Position":"Dyrektor Logistyki","Email":"jan.kowalski@kowalski-sped.pl","Phone":"+48 601 111 222","Client":"Spedycja Kowalski Sp. z o.o.","Primary Contact":true},"column_meta":{"Full Name":{"id":"c2nbpggrn6owwf0","title":"Full Name","type":"SingleLineText","options":{}},"Position":{"id":"c6xwf0zvnc0i1wv","title":"Position","type":"SingleLineText","options":{}},"Email":{"id":"czjl2l2p4tdngdk","title":"Email","type":"Email","options":{}},"Phone":{"id":"cagos3j9ylye6h0","title":"Phone","type":"PhoneNumber","options":{}},"Client":{"id":"c7qno17pnxmt5mn","title":"Client","type":"SingleLineText","options":{"default_view_col_visibility":true}},"Primary Contact":{"id":"cdu655wgil3odmm","title":"Primary Contact","type":"Checkbox","default_value":"false","options":{"color":"#27D665","default_view_col_visibility":true,"icon":"circle-check"}}},"table_title":"2_CONTACTS"}	us96d0spja9v6cqe	\N	019c290f-92b9-7052-a206-7a369de474e4	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:30:12+00	2026-02-04 14:30:12+00
019c290f-92bb-723a-bf97-afc6f9a86c75	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	2	DATA_DELETE	\N	\N	\N	{"data":{"Full Name":"Anna Nowak","Position":"Spedytor","Email":"anna.nowak@kowalski-sped.pl","Phone":"+48 602 333 444","Client":"Spedycja Kowalski Sp. z o.o.","Primary Contact":false},"column_meta":{"Full Name":{"id":"c2nbpggrn6owwf0","title":"Full Name","type":"SingleLineText","options":{}},"Position":{"id":"c6xwf0zvnc0i1wv","title":"Position","type":"SingleLineText","options":{}},"Email":{"id":"czjl2l2p4tdngdk","title":"Email","type":"Email","options":{}},"Phone":{"id":"cagos3j9ylye6h0","title":"Phone","type":"PhoneNumber","options":{}},"Client":{"id":"c7qno17pnxmt5mn","title":"Client","type":"SingleLineText","options":{"default_view_col_visibility":true}},"Primary Contact":{"id":"cdu655wgil3odmm","title":"Primary Contact","type":"Checkbox","default_value":"false","options":{"color":"#27D665","default_view_col_visibility":true,"icon":"circle-check"}}},"table_title":"2_CONTACTS"}	us96d0spja9v6cqe	\N	019c290f-92b9-7052-a206-7a369de474e4	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:30:12+00	2026-02-04 14:30:12+00
019c290f-92bb-723a-bf97-b1935f000726	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	3	DATA_DELETE	\N	\N	\N	{"data":{"Full Name":"Klaus Mueller","Position":"Disponent","Email":"k.mueller@logitrans.de","Phone":"+49 170 555 666","Client":"LogiTrans GmbH","Primary Contact":true},"column_meta":{"Full Name":{"id":"c2nbpggrn6owwf0","title":"Full Name","type":"SingleLineText","options":{}},"Position":{"id":"c6xwf0zvnc0i1wv","title":"Position","type":"SingleLineText","options":{}},"Email":{"id":"czjl2l2p4tdngdk","title":"Email","type":"Email","options":{}},"Phone":{"id":"cagos3j9ylye6h0","title":"Phone","type":"PhoneNumber","options":{}},"Client":{"id":"c7qno17pnxmt5mn","title":"Client","type":"SingleLineText","options":{"default_view_col_visibility":true}},"Primary Contact":{"id":"cdu655wgil3odmm","title":"Primary Contact","type":"Checkbox","default_value":"false","options":{"color":"#27D665","default_view_col_visibility":true,"icon":"circle-check"}}},"table_title":"2_CONTACTS"}	us96d0spja9v6cqe	\N	019c290f-92b9-7052-a206-7a369de474e4	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:30:12+00	2026-02-04 14:30:12+00
019c290f-92bb-723a-bf97-b7e5693d9fd1	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	4	DATA_DELETE	\N	\N	\N	{"data":{"Full Name":"Marta Wisniewska","Position":"Kierownik Spedycji","Email":"m.wisniewska@freshcargo.pl","Phone":"+48 603 777 888","Client":"Fresh Cargo S.A.","Primary Contact":true},"column_meta":{"Full Name":{"id":"c2nbpggrn6owwf0","title":"Full Name","type":"SingleLineText","options":{}},"Position":{"id":"c6xwf0zvnc0i1wv","title":"Position","type":"SingleLineText","options":{}},"Email":{"id":"czjl2l2p4tdngdk","title":"Email","type":"Email","options":{}},"Phone":{"id":"cagos3j9ylye6h0","title":"Phone","type":"PhoneNumber","options":{}},"Client":{"id":"c7qno17pnxmt5mn","title":"Client","type":"SingleLineText","options":{"default_view_col_visibility":true}},"Primary Contact":{"id":"cdu655wgil3odmm","title":"Primary Contact","type":"Checkbox","default_value":"false","options":{"color":"#27D665","default_view_col_visibility":true,"icon":"circle-check"}}},"table_title":"2_CONTACTS"}	us96d0spja9v6cqe	\N	019c290f-92b9-7052-a206-7a369de474e4	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:30:12+00	2026-02-04 14:30:12+00
019c290f-a930-716a-b999-bf38bca3006c	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	1	DATA_DELETE	\N	\N	\N	{"data":{"Registration Number":"WGM 12345","Body Type":"Firanka","Capacity kg":"24000","Capacity m3":"86","Pallet Spaces":"33","ADR":"false","Insurance Expiry":"2026-06-15","Notes":"2026-12-31"},"column_meta":{"Registration Number":{"id":"cdfgt6v8nwr9y3i","title":"Registration Number","type":"SingleLineText","options":{}},"Body Type":{"id":"c0jnjk2odll3lua","title":"Body Type","type":"SingleLineText","options":{}},"Capacity kg":{"id":"ckaouubcd7i4gyu","title":"Capacity kg","type":"SingleLineText","options":{}},"Capacity m3":{"id":"cesdp9nw5n67yxk","title":"Capacity m3","type":"SingleLineText","options":{}},"Pallet Spaces":{"id":"cq97xn3cuh3mohw","title":"Pallet Spaces","type":"SingleLineText","options":{}},"ADR":{"id":"c66lc7ur0u96fqs","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"cqn3y5r2szclrrt","title":"ADR Classes","type":"SingleLineText","options":{}},"Inspection Date":{"id":"ca5tehxb5qu3trm","title":"Inspection Date","type":"SingleLineText","options":{}},"Insurance Expiry":{"id":"c6iwsnpecti6kwh","title":"Insurance Expiry","type":"SingleLineText","options":{}},"Notes":{"id":"c4zvkx95ndqle16","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"3_VEHICLES"}	us96d0spja9v6cqe	\N	019c290f-a92c-748b-a0f2-0ef28f1530f2	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:30:18+00	2026-02-04 14:30:18+00
019c290f-a931-777c-9195-3e1b5b4d5bf3	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	2	DATA_DELETE	\N	\N	\N	{"data":{"Registration Number":"KR 67890","Body Type":"Chlodnia","Capacity kg":"22000","Capacity m3":"76","Pallet Spaces":"33","ADR":"false","Insurance Expiry":"2026-03-20","Notes":"2026-09-30"},"column_meta":{"Registration Number":{"id":"cdfgt6v8nwr9y3i","title":"Registration Number","type":"SingleLineText","options":{}},"Body Type":{"id":"c0jnjk2odll3lua","title":"Body Type","type":"SingleLineText","options":{}},"Capacity kg":{"id":"ckaouubcd7i4gyu","title":"Capacity kg","type":"SingleLineText","options":{}},"Capacity m3":{"id":"cesdp9nw5n67yxk","title":"Capacity m3","type":"SingleLineText","options":{}},"Pallet Spaces":{"id":"cq97xn3cuh3mohw","title":"Pallet Spaces","type":"SingleLineText","options":{}},"ADR":{"id":"c66lc7ur0u96fqs","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"cqn3y5r2szclrrt","title":"ADR Classes","type":"SingleLineText","options":{}},"Inspection Date":{"id":"ca5tehxb5qu3trm","title":"Inspection Date","type":"SingleLineText","options":{}},"Insurance Expiry":{"id":"c6iwsnpecti6kwh","title":"Insurance Expiry","type":"SingleLineText","options":{}},"Notes":{"id":"c4zvkx95ndqle16","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"3_VEHICLES"}	us96d0spja9v6cqe	\N	019c290f-a92c-748b-a0f2-0ef28f1530f2	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:30:18+00	2026-02-04 14:30:18+00
019c290f-a92d-74d2-ab04-7963e3121ca3	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	\N	DATA_BULK_DELETE	\N	\N	\N	{"table_title":"3_VEHICLES"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:30:18+00	2026-02-04 14:30:18+00
019c290f-cdd3-7489-be73-9411ee3f8e17	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	1	DATA_DELETE	\N	\N	\N	{"data":{"Full Name":"Tomasz Zielinski","Phone":"+48 604 111 222","License Categories":"B,C,C+E","ADR":"true","ADR Classes":"2,3","ADR Expiry Date":"2027-03-15","Medical Exam Expiry":"2026-09-30","Vehicle":"GD 11223","Notes":"Doswiadczony kierowca miedzynarodowy"},"column_meta":{"Full Name":{"id":"cbq31ueyugq2iav","title":"Full Name","type":"SingleLineText","options":{}},"Phone":{"id":"cqrt8an0urr8w35","title":"Phone","type":"SingleLineText","options":{}},"License Categories":{"id":"codggsij3km6lx8","title":"License Categories","type":"SingleLineText","options":{}},"ADR":{"id":"cqjeqj5psqekap9","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"czg2afeptb6je6u","title":"ADR Classes","type":"SingleLineText","options":{}},"ADR Expiry Date":{"id":"choxwcuo6pmcyk6","title":"ADR Expiry Date","type":"SingleLineText","options":{}},"Medical Exam Expiry":{"id":"c3uybhwo4d34h36","title":"Medical Exam Expiry","type":"SingleLineText","options":{}},"Vehicle":{"id":"cma3jbdrqttl8za","title":"Vehicle","type":"SingleLineText","options":{}},"Notes":{"id":"crc6aim561n4s9s","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"4_DRIVERS"}	us96d0spja9v6cqe	\N	019c290f-cdd2-72de-bd04-b5034dba89f5	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:30:27+00	2026-02-04 14:30:27+00
019c290f-cdd4-76e6-af8a-32927320c621	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	2	DATA_DELETE	\N	\N	\N	{"data":{"Full Name":"Pawel Mazur","Phone":"+48 605 333 444","License Categories":"B,C,C+E","ADR":"false","Medical Exam Expiry":"2026-12-15","Vehicle":"WGM 12345","Notes":"Trasy krajowe"},"column_meta":{"Full Name":{"id":"cbq31ueyugq2iav","title":"Full Name","type":"SingleLineText","options":{}},"Phone":{"id":"cqrt8an0urr8w35","title":"Phone","type":"SingleLineText","options":{}},"License Categories":{"id":"codggsij3km6lx8","title":"License Categories","type":"SingleLineText","options":{}},"ADR":{"id":"cqjeqj5psqekap9","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"czg2afeptb6je6u","title":"ADR Classes","type":"SingleLineText","options":{}},"ADR Expiry Date":{"id":"choxwcuo6pmcyk6","title":"ADR Expiry Date","type":"SingleLineText","options":{}},"Medical Exam Expiry":{"id":"c3uybhwo4d34h36","title":"Medical Exam Expiry","type":"SingleLineText","options":{}},"Vehicle":{"id":"cma3jbdrqttl8za","title":"Vehicle","type":"SingleLineText","options":{}},"Notes":{"id":"crc6aim561n4s9s","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"4_DRIVERS"}	us96d0spja9v6cqe	\N	019c290f-cdd2-72de-bd04-b5034dba89f5	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:30:27+00	2026-02-04 14:30:27+00
019c290f-cdd4-76e6-af8a-3410c1247639	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	3	DATA_DELETE	\N	\N	\N	{"data":{"Full Name":"Robert Kaczmarek","Phone":"+48 606 555 666","License Categories":"B,C,C+E","ADR":"false","Medical Exam Expiry":"2027-06-20","Vehicle":"KR 67890","Notes":"Specjalizacja: transport chlodniczy"},"column_meta":{"Full Name":{"id":"cbq31ueyugq2iav","title":"Full Name","type":"SingleLineText","options":{}},"Phone":{"id":"cqrt8an0urr8w35","title":"Phone","type":"SingleLineText","options":{}},"License Categories":{"id":"codggsij3km6lx8","title":"License Categories","type":"SingleLineText","options":{}},"ADR":{"id":"cqjeqj5psqekap9","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"czg2afeptb6je6u","title":"ADR Classes","type":"SingleLineText","options":{}},"ADR Expiry Date":{"id":"choxwcuo6pmcyk6","title":"ADR Expiry Date","type":"SingleLineText","options":{}},"Medical Exam Expiry":{"id":"c3uybhwo4d34h36","title":"Medical Exam Expiry","type":"SingleLineText","options":{}},"Vehicle":{"id":"cma3jbdrqttl8za","title":"Vehicle","type":"SingleLineText","options":{}},"Notes":{"id":"crc6aim561n4s9s","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"4_DRIVERS"}	us96d0spja9v6cqe	\N	019c290f-cdd2-72de-bd04-b5034dba89f5	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:30:27+00	2026-02-04 14:30:27+00
019c290f-cdd4-76e6-af8a-3b710edce31f	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	4	DATA_DELETE	\N	\N	\N	{"data":{"Full Name":"Marek Duda","Phone":"+48 607 777 888","License Categories":"B,C","ADR":"false","Medical Exam Expiry":"2026-08-10","Vehicle":"WE 44556","Notes":"Dostawy lokalne"},"column_meta":{"Full Name":{"id":"cbq31ueyugq2iav","title":"Full Name","type":"SingleLineText","options":{}},"Phone":{"id":"cqrt8an0urr8w35","title":"Phone","type":"SingleLineText","options":{}},"License Categories":{"id":"codggsij3km6lx8","title":"License Categories","type":"SingleLineText","options":{}},"ADR":{"id":"cqjeqj5psqekap9","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"czg2afeptb6je6u","title":"ADR Classes","type":"SingleLineText","options":{}},"ADR Expiry Date":{"id":"choxwcuo6pmcyk6","title":"ADR Expiry Date","type":"SingleLineText","options":{}},"Medical Exam Expiry":{"id":"c3uybhwo4d34h36","title":"Medical Exam Expiry","type":"SingleLineText","options":{}},"Vehicle":{"id":"cma3jbdrqttl8za","title":"Vehicle","type":"SingleLineText","options":{}},"Notes":{"id":"crc6aim561n4s9s","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"4_DRIVERS"}	us96d0spja9v6cqe	\N	019c290f-cdd2-72de-bd04-b5034dba89f5	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:30:27+00	2026-02-04 14:30:27+00
019c290f-e969-704e-8866-5e999e9fba99	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	\N	DATA_BULK_DELETE	\N	\N	\N	{"table_title":"5_INQUIRIES"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:30:34+00	2026-02-04 14:30:34+00
019c2910-10f8-717b-824b-09d9736df66e	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	1	DATA_DELETE	\N	\N	\N	{"data":{"Departure Date":"2026-02-10","Origin":"Warszawa","Destination":"Berlin","Vehicle":"WGM 12345","Driver":"Pawel Mazur","Status":"Planned","Notes":"Ladunek: 20 palet euro"},"column_meta":{"Departure Date":{"id":"ckfllneskfstzzf","title":"Departure Date","type":"SingleLineText","options":{}},"Origin":{"id":"c77cudldn2ldi4z","title":"Origin","type":"SingleLineText","options":{}},"Destination":{"id":"ct1zt0dav2juhz2","title":"Destination","type":"SingleLineText","options":{}},"Vehicle":{"id":"clu2kxul7iexnie","title":"Vehicle","type":"SingleLineText","options":{}},"Driver":{"id":"ctr4ur50y1rt0pa","title":"Driver","type":"SingleLineText","options":{}},"Status":{"id":"cmy7ib7lxogr0wy","title":"Status","type":"SingleLineText","options":{}},"Notes":{"id":"chtfkfr68ef5chk","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	019c2910-10f5-76ca-82cf-78be7cce9aeb	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:30:44+00	2026-02-04 14:30:44+00
019c437c-12cd-760e-a165-d871a6a4d95a	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"2_CONTACTS","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"16","ref_row_id":"6","display_value":"Müller Logistik GmbH","ref_display_value":"Petra Hoffmann","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:38:50+00	2026-02-09 17:38:50+00
019c290f-a931-777c-9195-41da7df77c2b	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	3	DATA_DELETE	\N	\N	\N	{"data":{"Registration Number":"GD 11223","Body Type":"Mega","Capacity kg":"24000","Capacity m3":"100","Pallet Spaces":"36","ADR":"true","ADR Classes":"2,3","Inspection Date":"2026-08-10","Insurance Expiry":"2027-01-15","Notes":"Certyfikat ADR do 2027"},"column_meta":{"Registration Number":{"id":"cdfgt6v8nwr9y3i","title":"Registration Number","type":"SingleLineText","options":{}},"Body Type":{"id":"c0jnjk2odll3lua","title":"Body Type","type":"SingleLineText","options":{}},"Capacity kg":{"id":"ckaouubcd7i4gyu","title":"Capacity kg","type":"SingleLineText","options":{}},"Capacity m3":{"id":"cesdp9nw5n67yxk","title":"Capacity m3","type":"SingleLineText","options":{}},"Pallet Spaces":{"id":"cq97xn3cuh3mohw","title":"Pallet Spaces","type":"SingleLineText","options":{}},"ADR":{"id":"c66lc7ur0u96fqs","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"cqn3y5r2szclrrt","title":"ADR Classes","type":"SingleLineText","options":{}},"Inspection Date":{"id":"ca5tehxb5qu3trm","title":"Inspection Date","type":"SingleLineText","options":{}},"Insurance Expiry":{"id":"c6iwsnpecti6kwh","title":"Insurance Expiry","type":"SingleLineText","options":{}},"Notes":{"id":"c4zvkx95ndqle16","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"3_VEHICLES"}	us96d0spja9v6cqe	\N	019c290f-a92c-748b-a0f2-0ef28f1530f2	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:30:18+00	2026-02-04 14:30:18+00
019c290f-a931-777c-9195-46208143d424	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	4	DATA_DELETE	\N	\N	\N	{"data":{"Registration Number":"WE 44556","Body Type":"Bus","Capacity kg":"3500","Capacity m3":"22","Pallet Spaces":"8","ADR":"false","Insurance Expiry":"2026-05-01","Notes":"2026-11-30"},"column_meta":{"Registration Number":{"id":"cdfgt6v8nwr9y3i","title":"Registration Number","type":"SingleLineText","options":{}},"Body Type":{"id":"c0jnjk2odll3lua","title":"Body Type","type":"SingleLineText","options":{}},"Capacity kg":{"id":"ckaouubcd7i4gyu","title":"Capacity kg","type":"SingleLineText","options":{}},"Capacity m3":{"id":"cesdp9nw5n67yxk","title":"Capacity m3","type":"SingleLineText","options":{}},"Pallet Spaces":{"id":"cq97xn3cuh3mohw","title":"Pallet Spaces","type":"SingleLineText","options":{}},"ADR":{"id":"c66lc7ur0u96fqs","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"cqn3y5r2szclrrt","title":"ADR Classes","type":"SingleLineText","options":{}},"Inspection Date":{"id":"ca5tehxb5qu3trm","title":"Inspection Date","type":"SingleLineText","options":{}},"Insurance Expiry":{"id":"c6iwsnpecti6kwh","title":"Insurance Expiry","type":"SingleLineText","options":{}},"Notes":{"id":"c4zvkx95ndqle16","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"3_VEHICLES"}	us96d0spja9v6cqe	\N	019c290f-a92c-748b-a0f2-0ef28f1530f2	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:30:18+00	2026-02-04 14:30:18+00
019c290f-cdd2-72de-bd04-b96d4ffef4ce	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	\N	DATA_BULK_DELETE	\N	\N	\N	{"table_title":"4_DRIVERS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:30:27+00	2026-02-04 14:30:27+00
019c290f-e96d-75c9-bee3-dbf745553891	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	1	DATA_DELETE	\N	\N	\N	{"data":{"Inquiry Date":"2026-02-01","Client":"Spedycja Kowalski Sp. z o.o.","Contact":"Jan Kowalski","Origin City/Postal":"Warszawa 00-001","Destination City/Postal":"Berlin 10115","Loading Date":"2026-02-10","Delivery Date":"2026-02-11","Cargo Type":"Palety","ADR":"false","Dimensions":"120x80x180 x 20szt","Weight kg":"12000","Status":"New","Source":"Phone","Notes":"20 palet euro"},"column_meta":{"Inquiry Date":{"id":"cmn1ybxtu5x8dir","title":"Inquiry Date","type":"SingleLineText","options":{}},"Client":{"id":"cevrryyz232x8ki","title":"Client","type":"SingleLineText","options":{}},"Contact":{"id":"cvsbar5bv0dgw0d","title":"Contact","type":"SingleLineText","options":{}},"Origin City/Postal":{"id":"cpqf815rcewemca","title":"Origin City/Postal","type":"SingleLineText","options":{}},"Destination City/Postal":{"id":"co2p76yxmu15j0c","title":"Destination City/Postal","type":"SingleLineText","options":{}},"Loading Date":{"id":"chn4jquzl3h28zo","title":"Loading Date","type":"SingleLineText","options":{}},"Delivery Date":{"id":"c8sm408mq0rdcto","title":"Delivery Date","type":"SingleLineText","options":{}},"Cargo Type":{"id":"c235bwvy3tdxwf6","title":"Cargo Type","type":"SingleLineText","options":{}},"ADR":{"id":"c0ym69tqbt8gwt3","title":"ADR","type":"SingleLineText","options":{}},"ADR Class/UN":{"id":"c6zwoo8y63ltyv3","title":"ADR Class/UN","type":"SingleLineText","options":{}},"Dimensions":{"id":"cjghtnwgjnrzevk","title":"Dimensions","type":"SingleLineText","options":{}},"Weight kg":{"id":"cjbz903x16h3fxq","title":"Weight kg","type":"SingleLineText","options":{}},"Status":{"id":"cd389hjyxspaaxb","title":"Status","type":"SingleLineText","options":{}},"Source":{"id":"cc24y3hh7vpd4dj","title":"Source","type":"SingleLineText","options":{}},"UTM Source":{"id":"cmf6l7fe8gjbnxj","title":"UTM Source","type":"SingleLineText","options":{}},"Notes":{"id":"c9o7z61oc3yjk9a","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"5_INQUIRIES"}	us96d0spja9v6cqe	\N	019c290f-e968-7468-b955-391fc0a831ba	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:30:34+00	2026-02-04 14:30:34+00
019c290f-e96e-73ad-aa6a-75400a2238d0	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	2	DATA_DELETE	\N	\N	\N	{"data":{"Inquiry Date":"2026-02-03","Client":"LogiTrans GmbH","Contact":"Klaus Mueller","Origin City/Postal":"Hamburg 20095","Destination City/Postal":"Gdansk 80-001","Loading Date":"2026-02-12","Delivery Date":"2026-02-13","Cargo Type":"Chlodnia","ADR":"false","Dimensions":"Calopojazdowy","Weight kg":"18000","Status":"Quoted","Source":"Email","Notes":"Temperatura -18C"},"column_meta":{"Inquiry Date":{"id":"cmn1ybxtu5x8dir","title":"Inquiry Date","type":"SingleLineText","options":{}},"Client":{"id":"cevrryyz232x8ki","title":"Client","type":"SingleLineText","options":{}},"Contact":{"id":"cvsbar5bv0dgw0d","title":"Contact","type":"SingleLineText","options":{}},"Origin City/Postal":{"id":"cpqf815rcewemca","title":"Origin City/Postal","type":"SingleLineText","options":{}},"Destination City/Postal":{"id":"co2p76yxmu15j0c","title":"Destination City/Postal","type":"SingleLineText","options":{}},"Loading Date":{"id":"chn4jquzl3h28zo","title":"Loading Date","type":"SingleLineText","options":{}},"Delivery Date":{"id":"c8sm408mq0rdcto","title":"Delivery Date","type":"SingleLineText","options":{}},"Cargo Type":{"id":"c235bwvy3tdxwf6","title":"Cargo Type","type":"SingleLineText","options":{}},"ADR":{"id":"c0ym69tqbt8gwt3","title":"ADR","type":"SingleLineText","options":{}},"ADR Class/UN":{"id":"c6zwoo8y63ltyv3","title":"ADR Class/UN","type":"SingleLineText","options":{}},"Dimensions":{"id":"cjghtnwgjnrzevk","title":"Dimensions","type":"SingleLineText","options":{}},"Weight kg":{"id":"cjbz903x16h3fxq","title":"Weight kg","type":"SingleLineText","options":{}},"Status":{"id":"cd389hjyxspaaxb","title":"Status","type":"SingleLineText","options":{}},"Source":{"id":"cc24y3hh7vpd4dj","title":"Source","type":"SingleLineText","options":{}},"UTM Source":{"id":"cmf6l7fe8gjbnxj","title":"UTM Source","type":"SingleLineText","options":{}},"Notes":{"id":"c9o7z61oc3yjk9a","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"5_INQUIRIES"}	us96d0spja9v6cqe	\N	019c290f-e968-7468-b955-391fc0a831ba	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:30:34+00	2026-02-04 14:30:34+00
019c290f-e96e-73ad-aa6a-7bb51037af39	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	3	DATA_DELETE	\N	\N	\N	{"data":{"Inquiry Date":"2026-02-04","Client":"Fresh Cargo S.A.","Contact":"Marta Wisniewska","Origin City/Postal":"Gdynia 81-300","Destination City/Postal":"Munchen 80331","Loading Date":"2026-02-15","Delivery Date":"2026-02-16","Cargo Type":"ADR","ADR":"true","ADR Class/UN":"3, UN1203","Dimensions":"120x80x120 x 10szt","Weight kg":"8000","Status":"New","Source":"Web Form","UTM Source":"google_ads","Notes":"Paliwo - wymaga ADR"},"column_meta":{"Inquiry Date":{"id":"cmn1ybxtu5x8dir","title":"Inquiry Date","type":"SingleLineText","options":{}},"Client":{"id":"cevrryyz232x8ki","title":"Client","type":"SingleLineText","options":{}},"Contact":{"id":"cvsbar5bv0dgw0d","title":"Contact","type":"SingleLineText","options":{}},"Origin City/Postal":{"id":"cpqf815rcewemca","title":"Origin City/Postal","type":"SingleLineText","options":{}},"Destination City/Postal":{"id":"co2p76yxmu15j0c","title":"Destination City/Postal","type":"SingleLineText","options":{}},"Loading Date":{"id":"chn4jquzl3h28zo","title":"Loading Date","type":"SingleLineText","options":{}},"Delivery Date":{"id":"c8sm408mq0rdcto","title":"Delivery Date","type":"SingleLineText","options":{}},"Cargo Type":{"id":"c235bwvy3tdxwf6","title":"Cargo Type","type":"SingleLineText","options":{}},"ADR":{"id":"c0ym69tqbt8gwt3","title":"ADR","type":"SingleLineText","options":{}},"ADR Class/UN":{"id":"c6zwoo8y63ltyv3","title":"ADR Class/UN","type":"SingleLineText","options":{}},"Dimensions":{"id":"cjghtnwgjnrzevk","title":"Dimensions","type":"SingleLineText","options":{}},"Weight kg":{"id":"cjbz903x16h3fxq","title":"Weight kg","type":"SingleLineText","options":{}},"Status":{"id":"cd389hjyxspaaxb","title":"Status","type":"SingleLineText","options":{}},"Source":{"id":"cc24y3hh7vpd4dj","title":"Source","type":"SingleLineText","options":{}},"UTM Source":{"id":"cmf6l7fe8gjbnxj","title":"UTM Source","type":"SingleLineText","options":{}},"Notes":{"id":"c9o7z61oc3yjk9a","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"5_INQUIRIES"}	us96d0spja9v6cqe	\N	019c290f-e968-7468-b955-391fc0a831ba	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:30:34+00	2026-02-04 14:30:34+00
019c2910-10f5-76ca-82cf-7ef0d71b8634	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	\N	DATA_BULK_DELETE	\N	\N	\N	{"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:30:44+00	2026-02-04 14:30:44+00
019c2910-2c28-7791-8afc-4bf4ea0e026b	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	\N	DATA_BULK_DELETE	\N	\N	\N	{"table_title":"7_FREIGHTS_csv"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:30:51+00	2026-02-04 14:30:51+00
019c2910-10f9-717c-b4e1-6f398fcfe3ff	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	2	DATA_DELETE	\N	\N	\N	{"data":{"Departure Date":"2026-02-12","Origin":"Hamburg","Destination":"Gdansk","Vehicle":"KR 67890","Driver":"Robert Kaczmarek","Status":"Planned","Notes":"Transport chlodniczy -18C"},"column_meta":{"Departure Date":{"id":"ckfllneskfstzzf","title":"Departure Date","type":"SingleLineText","options":{}},"Origin":{"id":"c77cudldn2ldi4z","title":"Origin","type":"SingleLineText","options":{}},"Destination":{"id":"ct1zt0dav2juhz2","title":"Destination","type":"SingleLineText","options":{}},"Vehicle":{"id":"clu2kxul7iexnie","title":"Vehicle","type":"SingleLineText","options":{}},"Driver":{"id":"ctr4ur50y1rt0pa","title":"Driver","type":"SingleLineText","options":{}},"Status":{"id":"cmy7ib7lxogr0wy","title":"Status","type":"SingleLineText","options":{}},"Notes":{"id":"chtfkfr68ef5chk","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	019c2910-10f5-76ca-82cf-78be7cce9aeb	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:30:44+00	2026-02-04 14:30:44+00
019c2910-2c2a-738d-b951-967e2bda2ddd	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	1	DATA_DELETE	\N	\N	\N	{"data":{"Client":"Spedycja Kowalski Sp. z o.o.","Transport":"Warszawa-Berlin 2026-02-10","Unit Type":"Pallet","Quantity":"20","Cargo Description":"Czesci samochodowe na paletach euro","Pickup Address":"ul. Transportowa 12, Warszawa","Delivery Address":"Industriestr. 45, Berlin","Transport Capacity %":"60","Freight Price EUR":"1800.00","Invoiced":"false","Notes":"Czesc ladunku - reszta wolna"},"column_meta":{"Client":{"id":"c2l6l8py4xjuu7j","title":"Client","type":"SingleLineText","options":{}},"Transport":{"id":"ct2tnxus061vk9f","title":"Transport","type":"SingleLineText","options":{}},"Unit Type":{"id":"ciizexx8gnmmh8u","title":"Unit Type","type":"SingleLineText","options":{}},"Quantity":{"id":"c0c98b5g14umg7j","title":"Quantity","type":"SingleLineText","options":{}},"Cargo Description":{"id":"cz4rzid030j5ukx","title":"Cargo Description","type":"SingleLineText","options":{}},"Pickup Address":{"id":"c4fz8qjifateuuv","title":"Pickup Address","type":"SingleLineText","options":{}},"Delivery Address":{"id":"c6h4pr6nf24v55t","title":"Delivery Address","type":"SingleLineText","options":{}},"Transport Capacity %":{"id":"cqak82rc3kgncjz","title":"Transport Capacity %","type":"SingleLineText","options":{}},"Freight Price EUR":{"id":"cwmv5m3yjc4vjgd","title":"Freight Price EUR","type":"SingleLineText","options":{}},"Invoiced":{"id":"c1ao0fait4zsa1t","title":"Invoiced","type":"SingleLineText","options":{}},"Invoice Number":{"id":"cvk3wq35dagvfah","title":"Invoice Number","type":"SingleLineText","options":{}},"Notes":{"id":"cve6so9t8q8g5en","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"7_FREIGHTS_csv"}	us96d0spja9v6cqe	\N	019c2910-2c28-7791-8afc-46374358dac9	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:30:51+00	2026-02-04 14:30:51+00
019c2910-2c2b-754e-b5ab-decee3bb0b10	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	2	DATA_DELETE	\N	\N	\N	{"data":{"Client":"LogiTrans GmbH","Transport":"Hamburg-Gdansk 2026-02-12","Unit Type":"Other","Quantity":"1","Cargo Description":"Mrozonki - calopojazdowy","Pickup Address":"Hafenstr. 10, Hamburg","Delivery Address":"ul. Portowa 5, Gdansk","Transport Capacity %":"100","Freight Price EUR":"2200.00","Invoiced":"false","Notes":"FTL chlodnia"},"column_meta":{"Client":{"id":"c2l6l8py4xjuu7j","title":"Client","type":"SingleLineText","options":{}},"Transport":{"id":"ct2tnxus061vk9f","title":"Transport","type":"SingleLineText","options":{}},"Unit Type":{"id":"ciizexx8gnmmh8u","title":"Unit Type","type":"SingleLineText","options":{}},"Quantity":{"id":"c0c98b5g14umg7j","title":"Quantity","type":"SingleLineText","options":{}},"Cargo Description":{"id":"cz4rzid030j5ukx","title":"Cargo Description","type":"SingleLineText","options":{}},"Pickup Address":{"id":"c4fz8qjifateuuv","title":"Pickup Address","type":"SingleLineText","options":{}},"Delivery Address":{"id":"c6h4pr6nf24v55t","title":"Delivery Address","type":"SingleLineText","options":{}},"Transport Capacity %":{"id":"cqak82rc3kgncjz","title":"Transport Capacity %","type":"SingleLineText","options":{}},"Freight Price EUR":{"id":"cwmv5m3yjc4vjgd","title":"Freight Price EUR","type":"SingleLineText","options":{}},"Invoiced":{"id":"c1ao0fait4zsa1t","title":"Invoiced","type":"SingleLineText","options":{}},"Invoice Number":{"id":"cvk3wq35dagvfah","title":"Invoice Number","type":"SingleLineText","options":{}},"Notes":{"id":"cve6so9t8q8g5en","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"7_FREIGHTS_csv"}	us96d0spja9v6cqe	\N	019c2910-2c28-7791-8afc-46374358dac9	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:30:51+00	2026-02-04 14:30:51+00
019c2911-4f36-744b-9309-b27422b1a89c	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	\N	DATA_BULK_INSERT	\N	\N	\N	{"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:32:06+00	2026-02-04 14:32:06+00
019c2911-4f3e-77ad-96f6-65392ae97a79	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	10	DATA_INSERT	\N	\N	\N	{"data":{"Company Name":"Müller Logistik GmbH","VAT ID":"DE112233445","Address":"Hafenstr. 22, 20095 Hamburg","Email":"info@mueller-logistik.de","Phone":"+49 40 123 4567","Notes":"Staly klient - transport miedzynarodowy"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c2911-4f36-744b-9309-ac07c92596ab	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:32:06+00	2026-02-04 14:32:06+00
019c2911-4f3e-77ad-96f6-690a492765f7	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	11	DATA_INSERT	\N	\N	\N	{"data":{"Company Name":"Schneider Spedition GmbH & Co. KG","VAT ID":"DE223344556","Address":"Industriestr. 8, 80331 München","Email":"kontakt@schneider-spedition.de","Phone":"+49 89 234 5678","Notes":"Transport calopojazdowy DE-PL"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c2911-4f36-744b-9309-ac07c92596ab	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:32:06+00	2026-02-04 14:32:06+00
019c437d-3c63-7409-a2fd-20e77aa9ec08	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"2_CONTACTS","link_field_title":"2_CONTACTS_id","link_field_id":"c9xxtsju519a60b","row_id":"16","ref_row_id":"5","display_value":"Müller Logistik GmbH","ref_display_value":"Hans Müller","type":"oo"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:40:06+00	2026-02-09 17:40:06+00
019c2911-4f3e-77ad-96f6-6fde0750f07b	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	12	DATA_INSERT	\N	\N	\N	{"data":{"Company Name":"Weber Transporte GmbH","VAT ID":"DE334455667","Address":"Am Containerhafen 3, 28195 Bremen","Email":"info@weber-transporte.de","Phone":"+49 421 345 6789","Notes":"Specjalizacja: transport morski/kontenerowy"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c2911-4f36-744b-9309-ac07c92596ab	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:32:06+00	2026-02-04 14:32:06+00
019c2911-4f3f-70fa-8db7-c110daa44bd1	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	13	DATA_INSERT	\N	\N	\N	{"data":{"Company Name":"Koch Kühllogistik GmbH","VAT ID":"DE445566778","Address":"Kühlhausring 15, 50667 Köln","Email":"disposition@koch-kuehl.de","Phone":"+49 221 456 7890","Notes":"Transport chlodniczy - mrozonki i swieze"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c2911-4f36-744b-9309-ac07c92596ab	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:32:06+00	2026-02-04 14:32:06+00
019c2911-4f3f-70fa-8db7-c65f9cbf4f3e	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	14	DATA_INSERT	\N	\N	\N	{"data":{"Company Name":"Braun Chemie Transport AG","VAT ID":"DE556677889","Address":"Rheinuferstr. 40, 40213 Düsseldorf","Email":"logistik@braun-chemie.de","Phone":"+49 211 567 8901","Notes":"ADR - transport chemikaliow kl. 3 i 8"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c2911-4f36-744b-9309-ac07c92596ab	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:32:06+00	2026-02-04 14:32:06+00
019c2911-4f3f-70fa-8db7-c911b5c19aae	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	15	DATA_INSERT	\N	\N	\N	{"data":{"Company Name":"Fischer Automotive Logistics GmbH","VAT ID":"DE667788990","Address":"Werksallee 7, 70173 Stuttgart","Email":"spedition@fischer-auto.de","Phone":"+49 711 678 9012","Notes":"Czesci samochodowe - JIT delivery"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c2911-4f36-744b-9309-ac07c92596ab	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:32:06+00	2026-02-04 14:32:06+00
019c2912-2267-71a8-9cd4-5a4485ac3e96	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	\N	DATA_BULK_INSERT	\N	\N	\N	{"table_title":"2_CONTACTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:33:00+00	2026-02-04 14:33:00+00
019c2912-226d-705d-80f0-dcfb8b153eae	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	5	DATA_INSERT	\N	\N	\N	{"data":{"Full Name":"Hans Müller","Position":"Geschäftsführer","Email":"h.mueller@mueller-logistik.de","Phone":"+49 40 123 4560","Client":"Müller Logistik GmbH","Primary Contact":true},"column_meta":{"Full Name":{"id":"c2nbpggrn6owwf0","title":"Full Name","type":"SingleLineText","options":{}},"Position":{"id":"c6xwf0zvnc0i1wv","title":"Position","type":"SingleLineText","options":{}},"Email":{"id":"czjl2l2p4tdngdk","title":"Email","type":"Email","options":{}},"Phone":{"id":"cagos3j9ylye6h0","title":"Phone","type":"PhoneNumber","options":{}},"Client":{"id":"c7qno17pnxmt5mn","title":"Client","type":"SingleLineText","options":{"default_view_col_visibility":true}},"Primary Contact":{"id":"cdu655wgil3odmm","title":"Primary Contact","type":"Checkbox","default_value":"false","options":{"color":"#27D665","default_view_col_visibility":true,"icon":"circle-check"}}},"table_title":"2_CONTACTS"}	us96d0spja9v6cqe	\N	019c2912-2267-71a8-9cd4-569dd24d0d86	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:33:00+00	2026-02-04 14:33:00+00
019c2912-226d-705d-80f0-e17607e6a730	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	6	DATA_INSERT	\N	\N	\N	{"data":{"Full Name":"Petra Hoffmann","Position":"Disponentin","Email":"p.hoffmann@mueller-logistik.de","Phone":"+49 40 123 4561","Client":"Müller Logistik GmbH","Primary Contact":false},"column_meta":{"Full Name":{"id":"c2nbpggrn6owwf0","title":"Full Name","type":"SingleLineText","options":{}},"Position":{"id":"c6xwf0zvnc0i1wv","title":"Position","type":"SingleLineText","options":{}},"Email":{"id":"czjl2l2p4tdngdk","title":"Email","type":"Email","options":{}},"Phone":{"id":"cagos3j9ylye6h0","title":"Phone","type":"PhoneNumber","options":{}},"Client":{"id":"c7qno17pnxmt5mn","title":"Client","type":"SingleLineText","options":{"default_view_col_visibility":true}},"Primary Contact":{"id":"cdu655wgil3odmm","title":"Primary Contact","type":"Checkbox","default_value":"false","options":{"color":"#27D665","default_view_col_visibility":true,"icon":"circle-check"}}},"table_title":"2_CONTACTS"}	us96d0spja9v6cqe	\N	019c2912-2267-71a8-9cd4-569dd24d0d86	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:33:00+00	2026-02-04 14:33:00+00
019c2912-226d-705d-80f0-e6924e0cba7c	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	7	DATA_INSERT	\N	\N	\N	{"data":{"Full Name":"Thomas Schneider","Position":"Leiter Spedition","Email":"t.schneider@schneider-spedition.de","Phone":"+49 89 234 5670","Client":"Schneider Spedition GmbH & Co. KG","Primary Contact":true},"column_meta":{"Full Name":{"id":"c2nbpggrn6owwf0","title":"Full Name","type":"SingleLineText","options":{}},"Position":{"id":"c6xwf0zvnc0i1wv","title":"Position","type":"SingleLineText","options":{}},"Email":{"id":"czjl2l2p4tdngdk","title":"Email","type":"Email","options":{}},"Phone":{"id":"cagos3j9ylye6h0","title":"Phone","type":"PhoneNumber","options":{}},"Client":{"id":"c7qno17pnxmt5mn","title":"Client","type":"SingleLineText","options":{"default_view_col_visibility":true}},"Primary Contact":{"id":"cdu655wgil3odmm","title":"Primary Contact","type":"Checkbox","default_value":"false","options":{"color":"#27D665","default_view_col_visibility":true,"icon":"circle-check"}}},"table_title":"2_CONTACTS"}	us96d0spja9v6cqe	\N	019c2912-2267-71a8-9cd4-569dd24d0d86	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:33:00+00	2026-02-04 14:33:00+00
019c2912-226d-705d-80f0-eb125dcef21f	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	8	DATA_INSERT	\N	\N	\N	{"data":{"Full Name":"Sabine Lang","Position":"Sachbearbeiterin","Email":"s.lang@schneider-spedition.de","Phone":"+49 89 234 5671","Client":"Schneider Spedition GmbH & Co. KG","Primary Contact":false},"column_meta":{"Full Name":{"id":"c2nbpggrn6owwf0","title":"Full Name","type":"SingleLineText","options":{}},"Position":{"id":"c6xwf0zvnc0i1wv","title":"Position","type":"SingleLineText","options":{}},"Email":{"id":"czjl2l2p4tdngdk","title":"Email","type":"Email","options":{}},"Phone":{"id":"cagos3j9ylye6h0","title":"Phone","type":"PhoneNumber","options":{}},"Client":{"id":"c7qno17pnxmt5mn","title":"Client","type":"SingleLineText","options":{"default_view_col_visibility":true}},"Primary Contact":{"id":"cdu655wgil3odmm","title":"Primary Contact","type":"Checkbox","default_value":"false","options":{"color":"#27D665","default_view_col_visibility":true,"icon":"circle-check"}}},"table_title":"2_CONTACTS"}	us96d0spja9v6cqe	\N	019c2912-2267-71a8-9cd4-569dd24d0d86	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:33:00+00	2026-02-04 14:33:00+00
019c2912-226d-705d-80f0-ec2303a597ba	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	9	DATA_INSERT	\N	\N	\N	{"data":{"Full Name":"Klaus Weber","Position":"Logistikleiter","Email":"k.weber@weber-transporte.de","Phone":"+49 421 345 6780","Client":"Weber Transporte GmbH","Primary Contact":true},"column_meta":{"Full Name":{"id":"c2nbpggrn6owwf0","title":"Full Name","type":"SingleLineText","options":{}},"Position":{"id":"c6xwf0zvnc0i1wv","title":"Position","type":"SingleLineText","options":{}},"Email":{"id":"czjl2l2p4tdngdk","title":"Email","type":"Email","options":{}},"Phone":{"id":"cagos3j9ylye6h0","title":"Phone","type":"PhoneNumber","options":{}},"Client":{"id":"c7qno17pnxmt5mn","title":"Client","type":"SingleLineText","options":{"default_view_col_visibility":true}},"Primary Contact":{"id":"cdu655wgil3odmm","title":"Primary Contact","type":"Checkbox","default_value":"false","options":{"color":"#27D665","default_view_col_visibility":true,"icon":"circle-check"}}},"table_title":"2_CONTACTS"}	us96d0spja9v6cqe	\N	019c2912-2267-71a8-9cd4-569dd24d0d86	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:33:00+00	2026-02-04 14:33:00+00
019c2912-226d-705d-80f0-f250e0b2908f	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	10	DATA_INSERT	\N	\N	\N	{"data":{"Full Name":"Monika Koch","Position":"Disposition Kühllogistik","Email":"m.koch@koch-kuehl.de","Phone":"+49 221 456 7891","Client":"Koch Kühllogistik GmbH","Primary Contact":true},"column_meta":{"Full Name":{"id":"c2nbpggrn6owwf0","title":"Full Name","type":"SingleLineText","options":{}},"Position":{"id":"c6xwf0zvnc0i1wv","title":"Position","type":"SingleLineText","options":{}},"Email":{"id":"czjl2l2p4tdngdk","title":"Email","type":"Email","options":{}},"Phone":{"id":"cagos3j9ylye6h0","title":"Phone","type":"PhoneNumber","options":{}},"Client":{"id":"c7qno17pnxmt5mn","title":"Client","type":"SingleLineText","options":{"default_view_col_visibility":true}},"Primary Contact":{"id":"cdu655wgil3odmm","title":"Primary Contact","type":"Checkbox","default_value":"false","options":{"color":"#27D665","default_view_col_visibility":true,"icon":"circle-check"}}},"table_title":"2_CONTACTS"}	us96d0spja9v6cqe	\N	019c2912-2267-71a8-9cd4-569dd24d0d86	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:33:00+00	2026-02-04 14:33:00+00
019c4359-3558-702f-9982-4257e05fd6c4	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	5	DATA_UPDATE	\N	\N	\N	{"old_data":{"ADR Classes":["3","4.2"]},"data":{"ADR Classes":["3","4.2","5.1"]},"column_meta":{"ADR Classes":{"id":"cqn3y5r2szclrrt","title":"ADR Classes","type":"MultiSelect","options":{"choices":[{"title":"1","color":"#cfdffe","id":"sx1nu0aozpdpshy"},{"title":"2","color":"#d0f1fd","id":"szlw6ktnthmnk3m"},{"title":"3","color":"#c2f5e8","id":"s54tbxmlkx60fji"},{"title":"4.2","color":"#ffdce5","id":"sxr6ld3gbt6678p"},{"title":"5.1","color":"#ffeab6","id":"szuh26m6ay4qngv"}]}}},"table_title":"3_VEHICLES"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:00:45+00	2026-02-09 17:00:45+00
019c2912-226d-705d-80f0-f5f04824b0a1	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	11	DATA_INSERT	\N	\N	\N	{"data":{"Full Name":"Stefan Braun","Position":"Gefahrgutbeauftragter","Email":"s.braun@braun-chemie.de","Phone":"+49 211 567 8902","Client":"Braun Chemie Transport AG","Primary Contact":true},"column_meta":{"Full Name":{"id":"c2nbpggrn6owwf0","title":"Full Name","type":"SingleLineText","options":{}},"Position":{"id":"c6xwf0zvnc0i1wv","title":"Position","type":"SingleLineText","options":{}},"Email":{"id":"czjl2l2p4tdngdk","title":"Email","type":"Email","options":{}},"Phone":{"id":"cagos3j9ylye6h0","title":"Phone","type":"PhoneNumber","options":{}},"Client":{"id":"c7qno17pnxmt5mn","title":"Client","type":"SingleLineText","options":{"default_view_col_visibility":true}},"Primary Contact":{"id":"cdu655wgil3odmm","title":"Primary Contact","type":"Checkbox","default_value":"false","options":{"color":"#27D665","default_view_col_visibility":true,"icon":"circle-check"}}},"table_title":"2_CONTACTS"}	us96d0spja9v6cqe	\N	019c2912-2267-71a8-9cd4-569dd24d0d86	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:33:00+00	2026-02-04 14:33:00+00
019c2912-226d-705d-80f0-fb6884911190	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	12	DATA_INSERT	\N	\N	\N	{"data":{"Full Name":"Katrin Fischer","Position":"Supply Chain Managerin","Email":"k.fischer@fischer-auto.de","Phone":"+49 711 678 9013","Client":"Fischer Automotive Logistics GmbH","Primary Contact":true},"column_meta":{"Full Name":{"id":"c2nbpggrn6owwf0","title":"Full Name","type":"SingleLineText","options":{}},"Position":{"id":"c6xwf0zvnc0i1wv","title":"Position","type":"SingleLineText","options":{}},"Email":{"id":"czjl2l2p4tdngdk","title":"Email","type":"Email","options":{}},"Phone":{"id":"cagos3j9ylye6h0","title":"Phone","type":"PhoneNumber","options":{}},"Client":{"id":"c7qno17pnxmt5mn","title":"Client","type":"SingleLineText","options":{"default_view_col_visibility":true}},"Primary Contact":{"id":"cdu655wgil3odmm","title":"Primary Contact","type":"Checkbox","default_value":"false","options":{"color":"#27D665","default_view_col_visibility":true,"icon":"circle-check"}}},"table_title":"2_CONTACTS"}	us96d0spja9v6cqe	\N	019c2912-2267-71a8-9cd4-569dd24d0d86	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:33:00+00	2026-02-04 14:33:00+00
019c2915-d497-73ff-bc84-d15d3baca882	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	\N	DATA_BULK_INSERT	\N	\N	\N	{"table_title":"4_DRIVERS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:37:02+00	2026-02-04 14:37:02+00
019c2915-d49d-740a-a7a5-08f95724dd01	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	5	DATA_INSERT	\N	\N	\N	{"data":{"Full Name":"Jürgen Hartmann","Phone":"+49 170 111 2233","License Categories":"B,C,CE","ADR":"false","Medical Exam Expiry":"2026-09-30","Vehicle":"HH-ML 1012","Notes":"Fernverkehr - Erfahrung Skandinavien"},"column_meta":{"Full Name":{"id":"cbq31ueyugq2iav","title":"Full Name","type":"SingleLineText","options":{}},"Phone":{"id":"cqrt8an0urr8w35","title":"Phone","type":"SingleLineText","options":{}},"License Categories":{"id":"codggsij3km6lx8","title":"License Categories","type":"SingleLineText","options":{}},"ADR":{"id":"cqjeqj5psqekap9","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"czg2afeptb6je6u","title":"ADR Classes","type":"SingleLineText","options":{}},"ADR Expiry Date":{"id":"choxwcuo6pmcyk6","title":"ADR Expiry Date","type":"SingleLineText","options":{}},"Medical Exam Expiry":{"id":"c3uybhwo4d34h36","title":"Medical Exam Expiry","type":"SingleLineText","options":{}},"Vehicle":{"id":"cma3jbdrqttl8za","title":"Vehicle","type":"SingleLineText","options":{}},"Notes":{"id":"crc6aim561n4s9s","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"4_DRIVERS"}	us96d0spja9v6cqe	\N	019c2915-d497-73ff-bc84-cf5fa9c44917	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:37:02+00	2026-02-04 14:37:02+00
019c2915-d49d-740a-a7a5-0ff66643c024	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	6	DATA_INSERT	\N	\N	\N	{"data":{"Full Name":"Michael Becker","Phone":"+49 171 333 4455","License Categories":"B,C,CE","ADR":"false","Medical Exam Expiry":"2026-12-15","Vehicle":"M-SS 2034","Notes":"Fernverkehr DE-PL Strecke"},"column_meta":{"Full Name":{"id":"cbq31ueyugq2iav","title":"Full Name","type":"SingleLineText","options":{}},"Phone":{"id":"cqrt8an0urr8w35","title":"Phone","type":"SingleLineText","options":{}},"License Categories":{"id":"codggsij3km6lx8","title":"License Categories","type":"SingleLineText","options":{}},"ADR":{"id":"cqjeqj5psqekap9","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"czg2afeptb6je6u","title":"ADR Classes","type":"SingleLineText","options":{}},"ADR Expiry Date":{"id":"choxwcuo6pmcyk6","title":"ADR Expiry Date","type":"SingleLineText","options":{}},"Medical Exam Expiry":{"id":"c3uybhwo4d34h36","title":"Medical Exam Expiry","type":"SingleLineText","options":{}},"Vehicle":{"id":"cma3jbdrqttl8za","title":"Vehicle","type":"SingleLineText","options":{}},"Notes":{"id":"crc6aim561n4s9s","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"4_DRIVERS"}	us96d0spja9v6cqe	\N	019c2915-d497-73ff-bc84-cf5fa9c44917	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:37:02+00	2026-02-04 14:37:02+00
019c2915-d49d-740a-a7a5-12a3987c5dd6	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	7	DATA_INSERT	\N	\N	\N	{"data":{"Full Name":"Andreas Richter","Phone":"+49 172 555 6677","License Categories":"B,C,CE","ADR":"false","Medical Exam Expiry":"2027-06-20","Vehicle":"HB-WT 3056","Notes":"Containerverkehr Hafen Bremen"},"column_meta":{"Full Name":{"id":"cbq31ueyugq2iav","title":"Full Name","type":"SingleLineText","options":{}},"Phone":{"id":"cqrt8an0urr8w35","title":"Phone","type":"SingleLineText","options":{}},"License Categories":{"id":"codggsij3km6lx8","title":"License Categories","type":"SingleLineText","options":{}},"ADR":{"id":"cqjeqj5psqekap9","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"czg2afeptb6je6u","title":"ADR Classes","type":"SingleLineText","options":{}},"ADR Expiry Date":{"id":"choxwcuo6pmcyk6","title":"ADR Expiry Date","type":"SingleLineText","options":{}},"Medical Exam Expiry":{"id":"c3uybhwo4d34h36","title":"Medical Exam Expiry","type":"SingleLineText","options":{}},"Vehicle":{"id":"cma3jbdrqttl8za","title":"Vehicle","type":"SingleLineText","options":{}},"Notes":{"id":"crc6aim561n4s9s","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"4_DRIVERS"}	us96d0spja9v6cqe	\N	019c2915-d497-73ff-bc84-cf5fa9c44917	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:37:02+00	2026-02-04 14:37:02+00
019c4359-47eb-7219-9f5f-4c0043fb39b7	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	5	DATA_UPDATE	\N	\N	\N	{"old_data":{"ADR":false},"data":{"ADR":true},"column_meta":{"ADR":{"id":"c66lc7ur0u96fqs","title":"ADR","type":"Checkbox","default_value":"false","options":{"color":"#27D665","default_view_col_visibility":true,"icon":"circle-check"}}},"table_title":"3_VEHICLES"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:00:50+00	2026-02-09 17:00:50+00
019c437d-3c65-7798-aa82-2120ed31694d	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	5	DATA_LINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":"5","ref_row_id":"16","display_value":"Hans Müller","ref_display_value":"Müller Logistik GmbH","type":"oo"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:40:06+00	2026-02-09 17:40:06+00
019c2915-d49d-740a-a7a5-17ef16f397f2	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	8	DATA_INSERT	\N	\N	\N	{"data":{"Full Name":"Frank Zimmermann","Phone":"+49 173 777 8899","License Categories":"B,C,CE","ADR":"false","Medical Exam Expiry":"2026-08-10","Vehicle":"K-KK 4078","Notes":"Kühllogistik - Temperaturüberwachung"},"column_meta":{"Full Name":{"id":"cbq31ueyugq2iav","title":"Full Name","type":"SingleLineText","options":{}},"Phone":{"id":"cqrt8an0urr8w35","title":"Phone","type":"SingleLineText","options":{}},"License Categories":{"id":"codggsij3km6lx8","title":"License Categories","type":"SingleLineText","options":{}},"ADR":{"id":"cqjeqj5psqekap9","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"czg2afeptb6je6u","title":"ADR Classes","type":"SingleLineText","options":{}},"ADR Expiry Date":{"id":"choxwcuo6pmcyk6","title":"ADR Expiry Date","type":"SingleLineText","options":{}},"Medical Exam Expiry":{"id":"c3uybhwo4d34h36","title":"Medical Exam Expiry","type":"SingleLineText","options":{}},"Vehicle":{"id":"cma3jbdrqttl8za","title":"Vehicle","type":"SingleLineText","options":{}},"Notes":{"id":"crc6aim561n4s9s","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"4_DRIVERS"}	us96d0spja9v6cqe	\N	019c2915-d497-73ff-bc84-cf5fa9c44917	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:37:02+00	2026-02-04 14:37:02+00
019c2915-d49d-740a-a7a5-1801c25cc345	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	9	DATA_INSERT	\N	\N	\N	{"data":{"Full Name":"Oliver Wagner","Phone":"+49 174 999 0011","License Categories":"B,C,CE","ADR":"true","ADR Classes":"3,8","ADR Expiry Date":"2027-05-30","Medical Exam Expiry":"2027-03-15","Vehicle":"D-BC 5090","Notes":"ADR-Schein Klasse 3 und 8 - Gefahrgut"},"column_meta":{"Full Name":{"id":"cbq31ueyugq2iav","title":"Full Name","type":"SingleLineText","options":{}},"Phone":{"id":"cqrt8an0urr8w35","title":"Phone","type":"SingleLineText","options":{}},"License Categories":{"id":"codggsij3km6lx8","title":"License Categories","type":"SingleLineText","options":{}},"ADR":{"id":"cqjeqj5psqekap9","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"czg2afeptb6je6u","title":"ADR Classes","type":"SingleLineText","options":{}},"ADR Expiry Date":{"id":"choxwcuo6pmcyk6","title":"ADR Expiry Date","type":"SingleLineText","options":{}},"Medical Exam Expiry":{"id":"c3uybhwo4d34h36","title":"Medical Exam Expiry","type":"SingleLineText","options":{}},"Vehicle":{"id":"cma3jbdrqttl8za","title":"Vehicle","type":"SingleLineText","options":{}},"Notes":{"id":"crc6aim561n4s9s","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"4_DRIVERS"}	us96d0spja9v6cqe	\N	019c2915-d497-73ff-bc84-cf5fa9c44917	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:37:02+00	2026-02-04 14:37:02+00
019c2915-d49d-740a-a7a5-1c6df6c95bd3	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	10	DATA_INSERT	\N	\N	\N	{"data":{"Full Name":"Lukas Schäfer","Phone":"+49 175 222 3344","License Categories":"B,C","ADR":"false","Medical Exam Expiry":"2026-11-20","Vehicle":"S-FA 6012","Notes":"Nahverkehr - JIT Zustellungen Stuttgart"},"column_meta":{"Full Name":{"id":"cbq31ueyugq2iav","title":"Full Name","type":"SingleLineText","options":{}},"Phone":{"id":"cqrt8an0urr8w35","title":"Phone","type":"SingleLineText","options":{}},"License Categories":{"id":"codggsij3km6lx8","title":"License Categories","type":"SingleLineText","options":{}},"ADR":{"id":"cqjeqj5psqekap9","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"czg2afeptb6je6u","title":"ADR Classes","type":"SingleLineText","options":{}},"ADR Expiry Date":{"id":"choxwcuo6pmcyk6","title":"ADR Expiry Date","type":"SingleLineText","options":{}},"Medical Exam Expiry":{"id":"c3uybhwo4d34h36","title":"Medical Exam Expiry","type":"SingleLineText","options":{}},"Vehicle":{"id":"cma3jbdrqttl8za","title":"Vehicle","type":"SingleLineText","options":{}},"Notes":{"id":"crc6aim561n4s9s","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"4_DRIVERS"}	us96d0spja9v6cqe	\N	019c2915-d497-73ff-bc84-cf5fa9c44917	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:37:02+00	2026-02-04 14:37:02+00
019c2916-60fd-7479-b7c2-7fbd5c15b221	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	\N	DATA_BULK_INSERT	\N	\N	\N	{"table_title":"5_INQUIRIES"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:37:38+00	2026-02-04 14:37:38+00
019c2916-6107-7567-850b-7dedf57de737	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	4	DATA_INSERT	\N	\N	\N	{"data":{"Inquiry Date":"2026-02-01","Client":"Müller Logistik GmbH","Contact":"Hans Müller","Origin City/Postal":"Hamburg 20095","Destination City/Postal":"Warschau 00-001","Loading Date":"2026-02-10","Delivery Date":"2026-02-11","Cargo Type":"Paletten","ADR":"false","Dimensions":"120x80x180 x 20 Stk.","Weight kg":"12000","Status":"New","Source":"Phone","Notes":"20 Europaletten - Stückgut"},"column_meta":{"Inquiry Date":{"id":"cmn1ybxtu5x8dir","title":"Inquiry Date","type":"SingleLineText","options":{}},"Client":{"id":"cevrryyz232x8ki","title":"Client","type":"SingleLineText","options":{}},"Contact":{"id":"cvsbar5bv0dgw0d","title":"Contact","type":"SingleLineText","options":{}},"Origin City/Postal":{"id":"cpqf815rcewemca","title":"Origin City/Postal","type":"SingleLineText","options":{}},"Destination City/Postal":{"id":"co2p76yxmu15j0c","title":"Destination City/Postal","type":"SingleLineText","options":{}},"Loading Date":{"id":"chn4jquzl3h28zo","title":"Loading Date","type":"SingleLineText","options":{}},"Delivery Date":{"id":"c8sm408mq0rdcto","title":"Delivery Date","type":"SingleLineText","options":{}},"Cargo Type":{"id":"c235bwvy3tdxwf6","title":"Cargo Type","type":"SingleLineText","options":{}},"ADR":{"id":"c0ym69tqbt8gwt3","title":"ADR","type":"SingleLineText","options":{}},"ADR Class/UN":{"id":"c6zwoo8y63ltyv3","title":"ADR Class/UN","type":"SingleLineText","options":{}},"Dimensions":{"id":"cjghtnwgjnrzevk","title":"Dimensions","type":"SingleLineText","options":{}},"Weight kg":{"id":"cjbz903x16h3fxq","title":"Weight kg","type":"SingleLineText","options":{}},"Status":{"id":"cd389hjyxspaaxb","title":"Status","type":"SingleLineText","options":{}},"Source":{"id":"cc24y3hh7vpd4dj","title":"Source","type":"SingleLineText","options":{}},"UTM Source":{"id":"cmf6l7fe8gjbnxj","title":"UTM Source","type":"SingleLineText","options":{}},"Notes":{"id":"c9o7z61oc3yjk9a","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"5_INQUIRIES"}	us96d0spja9v6cqe	\N	019c2916-60fd-7479-b7c2-7b72c8dd6981	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:37:38+00	2026-02-04 14:37:38+00
019c2916-6107-7567-850b-80bc4cf1e52d	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	5	DATA_INSERT	\N	\N	\N	{"data":{"Inquiry Date":"2026-02-02","Client":"Schneider Spedition GmbH & Co. KG","Contact":"Thomas Schneider","Origin City/Postal":"München 80331","Destination City/Postal":"Poznań 60-001","Loading Date":"2026-02-12","Delivery Date":"2026-02-13","Cargo Type":"Komplettladung","ADR":"false","Dimensions":"Komplettladung LKW","Weight kg":"23000","Status":"Quoted","Source":"Email","Notes":"FTL Plane - Maschinenteile"},"column_meta":{"Inquiry Date":{"id":"cmn1ybxtu5x8dir","title":"Inquiry Date","type":"SingleLineText","options":{}},"Client":{"id":"cevrryyz232x8ki","title":"Client","type":"SingleLineText","options":{}},"Contact":{"id":"cvsbar5bv0dgw0d","title":"Contact","type":"SingleLineText","options":{}},"Origin City/Postal":{"id":"cpqf815rcewemca","title":"Origin City/Postal","type":"SingleLineText","options":{}},"Destination City/Postal":{"id":"co2p76yxmu15j0c","title":"Destination City/Postal","type":"SingleLineText","options":{}},"Loading Date":{"id":"chn4jquzl3h28zo","title":"Loading Date","type":"SingleLineText","options":{}},"Delivery Date":{"id":"c8sm408mq0rdcto","title":"Delivery Date","type":"SingleLineText","options":{}},"Cargo Type":{"id":"c235bwvy3tdxwf6","title":"Cargo Type","type":"SingleLineText","options":{}},"ADR":{"id":"c0ym69tqbt8gwt3","title":"ADR","type":"SingleLineText","options":{}},"ADR Class/UN":{"id":"c6zwoo8y63ltyv3","title":"ADR Class/UN","type":"SingleLineText","options":{}},"Dimensions":{"id":"cjghtnwgjnrzevk","title":"Dimensions","type":"SingleLineText","options":{}},"Weight kg":{"id":"cjbz903x16h3fxq","title":"Weight kg","type":"SingleLineText","options":{}},"Status":{"id":"cd389hjyxspaaxb","title":"Status","type":"SingleLineText","options":{}},"Source":{"id":"cc24y3hh7vpd4dj","title":"Source","type":"SingleLineText","options":{}},"UTM Source":{"id":"cmf6l7fe8gjbnxj","title":"UTM Source","type":"SingleLineText","options":{}},"Notes":{"id":"c9o7z61oc3yjk9a","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"5_INQUIRIES"}	us96d0spja9v6cqe	\N	019c2916-60fd-7479-b7c2-7b72c8dd6981	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:37:38+00	2026-02-04 14:37:38+00
019c4359-5244-747a-b095-993592f1e124	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	7	DATA_UPDATE	\N	\N	\N	{"old_data":{"ADR Classes":null},"data":{"ADR Classes":["4.3"]},"column_meta":{"ADR Classes":{"id":"cqn3y5r2szclrrt","title":"ADR Classes","type":"MultiSelect","options":{"choices":[{"title":"3","color":"#c2f5e8","id":"s54tbxmlkx60fji"},{"title":"4.3","color":"#fee2d5","id":"snphtt9w11oqggs"}]}}},"table_title":"3_VEHICLES"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:00:53+00	2026-02-09 17:00:53+00
019c2916-6107-7567-850b-84cf8e3fdc00	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	6	DATA_INSERT	\N	\N	\N	{"data":{"Inquiry Date":"2026-02-03","Client":"Koch Kühllogistik GmbH","Contact":"Monika Koch","Origin City/Postal":"Köln 50667","Destination City/Postal":"Berlin 10115","Loading Date":"2026-02-14","Delivery Date":"2026-02-14","Cargo Type":"Kühlware","ADR":"false","Dimensions":"33 Paletten","Weight kg":"18000","Status":"Accepted","Source":"Phone","Notes":"Frischware -2°C bis +4°C"},"column_meta":{"Inquiry Date":{"id":"cmn1ybxtu5x8dir","title":"Inquiry Date","type":"SingleLineText","options":{}},"Client":{"id":"cevrryyz232x8ki","title":"Client","type":"SingleLineText","options":{}},"Contact":{"id":"cvsbar5bv0dgw0d","title":"Contact","type":"SingleLineText","options":{}},"Origin City/Postal":{"id":"cpqf815rcewemca","title":"Origin City/Postal","type":"SingleLineText","options":{}},"Destination City/Postal":{"id":"co2p76yxmu15j0c","title":"Destination City/Postal","type":"SingleLineText","options":{}},"Loading Date":{"id":"chn4jquzl3h28zo","title":"Loading Date","type":"SingleLineText","options":{}},"Delivery Date":{"id":"c8sm408mq0rdcto","title":"Delivery Date","type":"SingleLineText","options":{}},"Cargo Type":{"id":"c235bwvy3tdxwf6","title":"Cargo Type","type":"SingleLineText","options":{}},"ADR":{"id":"c0ym69tqbt8gwt3","title":"ADR","type":"SingleLineText","options":{}},"ADR Class/UN":{"id":"c6zwoo8y63ltyv3","title":"ADR Class/UN","type":"SingleLineText","options":{}},"Dimensions":{"id":"cjghtnwgjnrzevk","title":"Dimensions","type":"SingleLineText","options":{}},"Weight kg":{"id":"cjbz903x16h3fxq","title":"Weight kg","type":"SingleLineText","options":{}},"Status":{"id":"cd389hjyxspaaxb","title":"Status","type":"SingleLineText","options":{}},"Source":{"id":"cc24y3hh7vpd4dj","title":"Source","type":"SingleLineText","options":{}},"UTM Source":{"id":"cmf6l7fe8gjbnxj","title":"UTM Source","type":"SingleLineText","options":{}},"Notes":{"id":"c9o7z61oc3yjk9a","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"5_INQUIRIES"}	us96d0spja9v6cqe	\N	019c2916-60fd-7479-b7c2-7b72c8dd6981	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:37:38+00	2026-02-04 14:37:38+00
019c2916-6107-7567-850b-8a83bc76fe7b	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	7	DATA_INSERT	\N	\N	\N	{"data":{"Inquiry Date":"2026-02-04","Client":"Braun Chemie Transport AG","Contact":"Stefan Braun","Origin City/Postal":"Düsseldorf 40213","Destination City/Postal":"Frankfurt 60311","Loading Date":"2026-02-15","Delivery Date":"2026-02-15","Cargo Type":"Gefahrgut","ADR":"true","ADR Class/UN":"3, UN1203","Dimensions":"Tankfahrzeug","Weight kg":"20000","Status":"New","Source":"Web Form","UTM Source":"google_ads","Notes":"Benzin - ADR Klasse 3"},"column_meta":{"Inquiry Date":{"id":"cmn1ybxtu5x8dir","title":"Inquiry Date","type":"SingleLineText","options":{}},"Client":{"id":"cevrryyz232x8ki","title":"Client","type":"SingleLineText","options":{}},"Contact":{"id":"cvsbar5bv0dgw0d","title":"Contact","type":"SingleLineText","options":{}},"Origin City/Postal":{"id":"cpqf815rcewemca","title":"Origin City/Postal","type":"SingleLineText","options":{}},"Destination City/Postal":{"id":"co2p76yxmu15j0c","title":"Destination City/Postal","type":"SingleLineText","options":{}},"Loading Date":{"id":"chn4jquzl3h28zo","title":"Loading Date","type":"SingleLineText","options":{}},"Delivery Date":{"id":"c8sm408mq0rdcto","title":"Delivery Date","type":"SingleLineText","options":{}},"Cargo Type":{"id":"c235bwvy3tdxwf6","title":"Cargo Type","type":"SingleLineText","options":{}},"ADR":{"id":"c0ym69tqbt8gwt3","title":"ADR","type":"SingleLineText","options":{}},"ADR Class/UN":{"id":"c6zwoo8y63ltyv3","title":"ADR Class/UN","type":"SingleLineText","options":{}},"Dimensions":{"id":"cjghtnwgjnrzevk","title":"Dimensions","type":"SingleLineText","options":{}},"Weight kg":{"id":"cjbz903x16h3fxq","title":"Weight kg","type":"SingleLineText","options":{}},"Status":{"id":"cd389hjyxspaaxb","title":"Status","type":"SingleLineText","options":{}},"Source":{"id":"cc24y3hh7vpd4dj","title":"Source","type":"SingleLineText","options":{}},"UTM Source":{"id":"cmf6l7fe8gjbnxj","title":"UTM Source","type":"SingleLineText","options":{}},"Notes":{"id":"c9o7z61oc3yjk9a","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"5_INQUIRIES"}	us96d0spja9v6cqe	\N	019c2916-60fd-7479-b7c2-7b72c8dd6981	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:37:38+00	2026-02-04 14:37:38+00
019c2916-6107-7567-850b-8c331923647a	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	8	DATA_INSERT	\N	\N	\N	{"data":{"Inquiry Date":"2026-02-04","Client":"Fischer Automotive Logistics GmbH","Contact":"Katrin Fischer","Origin City/Postal":"Stuttgart 70173","Destination City/Postal":"München 80331","Loading Date":"2026-02-11","Delivery Date":"2026-02-11","Cargo Type":"Automobilteile","ADR":"false","Dimensions":"8 Gitterboxen","Weight kg":"2800","Status":"New","Source":"Email","Notes":"JIT-Lieferung an Produktionslinie"},"column_meta":{"Inquiry Date":{"id":"cmn1ybxtu5x8dir","title":"Inquiry Date","type":"SingleLineText","options":{}},"Client":{"id":"cevrryyz232x8ki","title":"Client","type":"SingleLineText","options":{}},"Contact":{"id":"cvsbar5bv0dgw0d","title":"Contact","type":"SingleLineText","options":{}},"Origin City/Postal":{"id":"cpqf815rcewemca","title":"Origin City/Postal","type":"SingleLineText","options":{}},"Destination City/Postal":{"id":"co2p76yxmu15j0c","title":"Destination City/Postal","type":"SingleLineText","options":{}},"Loading Date":{"id":"chn4jquzl3h28zo","title":"Loading Date","type":"SingleLineText","options":{}},"Delivery Date":{"id":"c8sm408mq0rdcto","title":"Delivery Date","type":"SingleLineText","options":{}},"Cargo Type":{"id":"c235bwvy3tdxwf6","title":"Cargo Type","type":"SingleLineText","options":{}},"ADR":{"id":"c0ym69tqbt8gwt3","title":"ADR","type":"SingleLineText","options":{}},"ADR Class/UN":{"id":"c6zwoo8y63ltyv3","title":"ADR Class/UN","type":"SingleLineText","options":{}},"Dimensions":{"id":"cjghtnwgjnrzevk","title":"Dimensions","type":"SingleLineText","options":{}},"Weight kg":{"id":"cjbz903x16h3fxq","title":"Weight kg","type":"SingleLineText","options":{}},"Status":{"id":"cd389hjyxspaaxb","title":"Status","type":"SingleLineText","options":{}},"Source":{"id":"cc24y3hh7vpd4dj","title":"Source","type":"SingleLineText","options":{}},"UTM Source":{"id":"cmf6l7fe8gjbnxj","title":"UTM Source","type":"SingleLineText","options":{}},"Notes":{"id":"c9o7z61oc3yjk9a","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"5_INQUIRIES"}	us96d0spja9v6cqe	\N	019c2916-60fd-7479-b7c2-7b72c8dd6981	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:37:38+00	2026-02-04 14:37:38+00
019c2916-6107-7567-850b-911f4d627ae9	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	9	DATA_INSERT	\N	\N	\N	{"data":{"Inquiry Date":"2026-02-04","Client":"Weber Transporte GmbH","Contact":"Klaus Weber","Origin City/Postal":"Bremen 28195","Destination City/Postal":"Hamburg 20095","Loading Date":"2026-02-16","Delivery Date":"2026-02-16","Cargo Type":"Container","ADR":"false","Dimensions":"1x 40ft Container","Weight kg":"22000","Status":"Quoted","Source":"Phone","Notes":"Seecontainer - Umschlag Hafen"},"column_meta":{"Inquiry Date":{"id":"cmn1ybxtu5x8dir","title":"Inquiry Date","type":"SingleLineText","options":{}},"Client":{"id":"cevrryyz232x8ki","title":"Client","type":"SingleLineText","options":{}},"Contact":{"id":"cvsbar5bv0dgw0d","title":"Contact","type":"SingleLineText","options":{}},"Origin City/Postal":{"id":"cpqf815rcewemca","title":"Origin City/Postal","type":"SingleLineText","options":{}},"Destination City/Postal":{"id":"co2p76yxmu15j0c","title":"Destination City/Postal","type":"SingleLineText","options":{}},"Loading Date":{"id":"chn4jquzl3h28zo","title":"Loading Date","type":"SingleLineText","options":{}},"Delivery Date":{"id":"c8sm408mq0rdcto","title":"Delivery Date","type":"SingleLineText","options":{}},"Cargo Type":{"id":"c235bwvy3tdxwf6","title":"Cargo Type","type":"SingleLineText","options":{}},"ADR":{"id":"c0ym69tqbt8gwt3","title":"ADR","type":"SingleLineText","options":{}},"ADR Class/UN":{"id":"c6zwoo8y63ltyv3","title":"ADR Class/UN","type":"SingleLineText","options":{}},"Dimensions":{"id":"cjghtnwgjnrzevk","title":"Dimensions","type":"SingleLineText","options":{}},"Weight kg":{"id":"cjbz903x16h3fxq","title":"Weight kg","type":"SingleLineText","options":{}},"Status":{"id":"cd389hjyxspaaxb","title":"Status","type":"SingleLineText","options":{}},"Source":{"id":"cc24y3hh7vpd4dj","title":"Source","type":"SingleLineText","options":{}},"UTM Source":{"id":"cmf6l7fe8gjbnxj","title":"UTM Source","type":"SingleLineText","options":{}},"Notes":{"id":"c9o7z61oc3yjk9a","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"5_INQUIRIES"}	us96d0spja9v6cqe	\N	019c2916-60fd-7479-b7c2-7b72c8dd6981	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:37:38+00	2026-02-04 14:37:38+00
019c2916-9581-76c2-8a0f-0917883f00a1	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	\N	DATA_BULK_INSERT	\N	\N	\N	{"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:37:51+00	2026-02-04 14:37:51+00
019c2916-9587-74ac-9c63-b1fb57a76531	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	3	DATA_INSERT	\N	\N	\N	{"data":{"Departure Date":"2026-02-10","Origin":"Hamburg","Destination":"Warschau","Vehicle":"HH-ML 1012","Driver":"Jürgen Hartmann","Status":"Planned","Notes":"20 Europaletten Stückgut für Müller Logistik"},"column_meta":{"Departure Date":{"id":"ckfllneskfstzzf","title":"Departure Date","type":"SingleLineText","options":{}},"Origin":{"id":"c77cudldn2ldi4z","title":"Origin","type":"SingleLineText","options":{}},"Destination":{"id":"ct1zt0dav2juhz2","title":"Destination","type":"SingleLineText","options":{}},"Vehicle":{"id":"clu2kxul7iexnie","title":"Vehicle","type":"SingleLineText","options":{}},"Driver":{"id":"ctr4ur50y1rt0pa","title":"Driver","type":"SingleLineText","options":{}},"Status":{"id":"cmy7ib7lxogr0wy","title":"Status","type":"SingleLineText","options":{}},"Notes":{"id":"chtfkfr68ef5chk","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	019c2916-9581-76c2-8a0f-06293063b179	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:37:51+00	2026-02-04 14:37:51+00
019c2916-9587-74ac-9c63-b59393201d70	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	4	DATA_INSERT	\N	\N	\N	{"data":{"Departure Date":"2026-02-12","Origin":"München","Destination":"Poznań","Vehicle":"M-SS 2034","Driver":"Michael Becker","Status":"Planned","Notes":"FTL Komplettladung Maschinenteile"},"column_meta":{"Departure Date":{"id":"ckfllneskfstzzf","title":"Departure Date","type":"SingleLineText","options":{}},"Origin":{"id":"c77cudldn2ldi4z","title":"Origin","type":"SingleLineText","options":{}},"Destination":{"id":"ct1zt0dav2juhz2","title":"Destination","type":"SingleLineText","options":{}},"Vehicle":{"id":"clu2kxul7iexnie","title":"Vehicle","type":"SingleLineText","options":{}},"Driver":{"id":"ctr4ur50y1rt0pa","title":"Driver","type":"SingleLineText","options":{}},"Status":{"id":"cmy7ib7lxogr0wy","title":"Status","type":"SingleLineText","options":{}},"Notes":{"id":"chtfkfr68ef5chk","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	019c2916-9581-76c2-8a0f-06293063b179	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:37:51+00	2026-02-04 14:37:51+00
019c2916-ed1d-70f9-9936-ca1fb4ddaec6	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	\N	DATA_BULK_INSERT	\N	\N	\N	{"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:38:14+00	2026-02-04 14:38:14+00
019c2916-9587-74ac-9c63-b9026c3f247d	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	5	DATA_INSERT	\N	\N	\N	{"data":{"Departure Date":"2026-02-14","Origin":"Köln","Destination":"Berlin","Vehicle":"K-KK 4078","Driver":"Frank Zimmermann","Status":"Planned","Notes":"Kühlware Frischware -2°C bis +4°C"},"column_meta":{"Departure Date":{"id":"ckfllneskfstzzf","title":"Departure Date","type":"SingleLineText","options":{}},"Origin":{"id":"c77cudldn2ldi4z","title":"Origin","type":"SingleLineText","options":{}},"Destination":{"id":"ct1zt0dav2juhz2","title":"Destination","type":"SingleLineText","options":{}},"Vehicle":{"id":"clu2kxul7iexnie","title":"Vehicle","type":"SingleLineText","options":{}},"Driver":{"id":"ctr4ur50y1rt0pa","title":"Driver","type":"SingleLineText","options":{}},"Status":{"id":"cmy7ib7lxogr0wy","title":"Status","type":"SingleLineText","options":{}},"Notes":{"id":"chtfkfr68ef5chk","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	019c2916-9581-76c2-8a0f-06293063b179	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:37:51+00	2026-02-04 14:37:51+00
019c2916-9587-74ac-9c63-bddcc8727dcb	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	6	DATA_INSERT	\N	\N	\N	{"data":{"Departure Date":"2026-02-15","Origin":"Düsseldorf","Destination":"Frankfurt","Vehicle":"D-BC 5090","Driver":"Oliver Wagner","Status":"Planned","Notes":"ADR Kl. 3 - Benzintransport"},"column_meta":{"Departure Date":{"id":"ckfllneskfstzzf","title":"Departure Date","type":"SingleLineText","options":{}},"Origin":{"id":"c77cudldn2ldi4z","title":"Origin","type":"SingleLineText","options":{}},"Destination":{"id":"ct1zt0dav2juhz2","title":"Destination","type":"SingleLineText","options":{}},"Vehicle":{"id":"clu2kxul7iexnie","title":"Vehicle","type":"SingleLineText","options":{}},"Driver":{"id":"ctr4ur50y1rt0pa","title":"Driver","type":"SingleLineText","options":{}},"Status":{"id":"cmy7ib7lxogr0wy","title":"Status","type":"SingleLineText","options":{}},"Notes":{"id":"chtfkfr68ef5chk","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	019c2916-9581-76c2-8a0f-06293063b179	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:37:51+00	2026-02-04 14:37:51+00
019c2916-9587-74ac-9c63-c03040f27fdf	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	7	DATA_INSERT	\N	\N	\N	{"data":{"Departure Date":"2026-02-11","Origin":"Stuttgart","Destination":"München","Vehicle":"S-FA 6012","Driver":"Lukas Schäfer","Status":"Planned","Notes":"JIT Automobilteile - Gitterboxen"},"column_meta":{"Departure Date":{"id":"ckfllneskfstzzf","title":"Departure Date","type":"SingleLineText","options":{}},"Origin":{"id":"c77cudldn2ldi4z","title":"Origin","type":"SingleLineText","options":{}},"Destination":{"id":"ct1zt0dav2juhz2","title":"Destination","type":"SingleLineText","options":{}},"Vehicle":{"id":"clu2kxul7iexnie","title":"Vehicle","type":"SingleLineText","options":{}},"Driver":{"id":"ctr4ur50y1rt0pa","title":"Driver","type":"SingleLineText","options":{}},"Status":{"id":"cmy7ib7lxogr0wy","title":"Status","type":"SingleLineText","options":{}},"Notes":{"id":"chtfkfr68ef5chk","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	019c2916-9581-76c2-8a0f-06293063b179	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:37:51+00	2026-02-04 14:37:51+00
019c2916-9587-74ac-9c63-c712bb49ef6e	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	8	DATA_INSERT	\N	\N	\N	{"data":{"Departure Date":"2026-02-16","Origin":"Bremen","Destination":"Hamburg","Vehicle":"HB-WT 3056","Driver":"Andreas Richter","Status":"Planned","Notes":"40ft Seecontainer Umschlag"},"column_meta":{"Departure Date":{"id":"ckfllneskfstzzf","title":"Departure Date","type":"SingleLineText","options":{}},"Origin":{"id":"c77cudldn2ldi4z","title":"Origin","type":"SingleLineText","options":{}},"Destination":{"id":"ct1zt0dav2juhz2","title":"Destination","type":"SingleLineText","options":{}},"Vehicle":{"id":"clu2kxul7iexnie","title":"Vehicle","type":"SingleLineText","options":{}},"Driver":{"id":"ctr4ur50y1rt0pa","title":"Driver","type":"SingleLineText","options":{}},"Status":{"id":"cmy7ib7lxogr0wy","title":"Status","type":"SingleLineText","options":{}},"Notes":{"id":"chtfkfr68ef5chk","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	019c2916-9581-76c2-8a0f-06293063b179	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:37:51+00	2026-02-04 14:37:51+00
019c2916-ed27-715b-ae66-5308b6aed666	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	3	DATA_INSERT	\N	\N	\N	{"data":{"Client":"Müller Logistik GmbH","Transport":"Hamburg-Warschau 2026-02-10","Unit Type":"Pallet","Quantity":"20","Cargo Description":"Europaletten Stückgut - Elektronikteile","Pickup Address":"Hafenstr. 22, 20095 Hamburg","Delivery Address":"ul. Przemyslowa 15, 00-001 Warschau","Transport Capacity %":"60","Freight Price EUR":"1850.00","Invoiced":"false","Notes":"Teilladung - Restkapazität 13 Paletten frei"},"column_meta":{"Client":{"id":"c2l6l8py4xjuu7j","title":"Client","type":"SingleLineText","options":{}},"Transport":{"id":"ct2tnxus061vk9f","title":"Transport","type":"SingleLineText","options":{}},"Unit Type":{"id":"ciizexx8gnmmh8u","title":"Unit Type","type":"SingleLineText","options":{}},"Quantity":{"id":"c0c98b5g14umg7j","title":"Quantity","type":"SingleLineText","options":{}},"Cargo Description":{"id":"cz4rzid030j5ukx","title":"Cargo Description","type":"SingleLineText","options":{}},"Pickup Address":{"id":"c4fz8qjifateuuv","title":"Pickup Address","type":"SingleLineText","options":{}},"Delivery Address":{"id":"c6h4pr6nf24v55t","title":"Delivery Address","type":"SingleLineText","options":{}},"Transport Capacity %":{"id":"cqak82rc3kgncjz","title":"Transport Capacity %","type":"SingleLineText","options":{}},"Freight Price EUR":{"id":"cwmv5m3yjc4vjgd","title":"Freight Price EUR","type":"SingleLineText","options":{}},"Invoiced":{"id":"c1ao0fait4zsa1t","title":"Invoiced","type":"SingleLineText","options":{}},"Invoice Number":{"id":"cvk3wq35dagvfah","title":"Invoice Number","type":"SingleLineText","options":{}},"Notes":{"id":"cve6so9t8q8g5en","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	019c2916-ed1d-70f9-9936-c6932424a89c	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:38:14+00	2026-02-04 14:38:14+00
019c2919-1272-75d2-9d5b-15628643c53a	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	12	DATA_DELETE	\N	\N	\N	{"data":{"Company Name":"Weber Transporte GmbH","VAT ID":"DE334455667","Address":"Am Containerhafen 3, 28195 Bremen","Email":"info@weber-transporte.de","Phone":"+49 421 345 6789","Notes":"Specjalizacja: transport morski/kontenerowy"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c2919-1271-7310-a1f5-b715a5046c4a	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:40:34+00	2026-02-04 14:40:34+00
019c2916-ed27-715b-ae66-55aa88c60373	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	4	DATA_INSERT	\N	\N	\N	{"data":{"Client":"Schneider Spedition GmbH & Co. KG","Transport":"München-Poznań 2026-02-12","Unit Type":"Pallet","Quantity":"33","Cargo Description":"Maschinenteile - Komplettladung","Pickup Address":"Industriestr. 8, 80331 München","Delivery Address":"ul. Fabryczna 22, 60-001 Poznań","Transport Capacity %":"100","Freight Price EUR":"2100.00","Invoiced":"false","Notes":"FTL - Komplettladung"},"column_meta":{"Client":{"id":"c2l6l8py4xjuu7j","title":"Client","type":"SingleLineText","options":{}},"Transport":{"id":"ct2tnxus061vk9f","title":"Transport","type":"SingleLineText","options":{}},"Unit Type":{"id":"ciizexx8gnmmh8u","title":"Unit Type","type":"SingleLineText","options":{}},"Quantity":{"id":"c0c98b5g14umg7j","title":"Quantity","type":"SingleLineText","options":{}},"Cargo Description":{"id":"cz4rzid030j5ukx","title":"Cargo Description","type":"SingleLineText","options":{}},"Pickup Address":{"id":"c4fz8qjifateuuv","title":"Pickup Address","type":"SingleLineText","options":{}},"Delivery Address":{"id":"c6h4pr6nf24v55t","title":"Delivery Address","type":"SingleLineText","options":{}},"Transport Capacity %":{"id":"cqak82rc3kgncjz","title":"Transport Capacity %","type":"SingleLineText","options":{}},"Freight Price EUR":{"id":"cwmv5m3yjc4vjgd","title":"Freight Price EUR","type":"SingleLineText","options":{}},"Invoiced":{"id":"c1ao0fait4zsa1t","title":"Invoiced","type":"SingleLineText","options":{}},"Invoice Number":{"id":"cvk3wq35dagvfah","title":"Invoice Number","type":"SingleLineText","options":{}},"Notes":{"id":"cve6so9t8q8g5en","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	019c2916-ed1d-70f9-9936-c6932424a89c	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:38:14+00	2026-02-04 14:38:14+00
019c2916-ed27-715b-ae66-5bf7802be1ee	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	5	DATA_INSERT	\N	\N	\N	{"data":{"Client":"Koch Kühllogistik GmbH","Transport":"Köln-Berlin 2026-02-14","Unit Type":"Pallet","Quantity":"33","Cargo Description":"Frischware - Molkereiprodukte","Pickup Address":"Kühlhausring 15, 50667 Köln","Delivery Address":"Großmarktstr. 5, 10115 Berlin","Transport Capacity %":"100","Freight Price EUR":"1400.00","Invoiced":"false","Notes":"Temperaturgeführt -2°C bis +4°C"},"column_meta":{"Client":{"id":"c2l6l8py4xjuu7j","title":"Client","type":"SingleLineText","options":{}},"Transport":{"id":"ct2tnxus061vk9f","title":"Transport","type":"SingleLineText","options":{}},"Unit Type":{"id":"ciizexx8gnmmh8u","title":"Unit Type","type":"SingleLineText","options":{}},"Quantity":{"id":"c0c98b5g14umg7j","title":"Quantity","type":"SingleLineText","options":{}},"Cargo Description":{"id":"cz4rzid030j5ukx","title":"Cargo Description","type":"SingleLineText","options":{}},"Pickup Address":{"id":"c4fz8qjifateuuv","title":"Pickup Address","type":"SingleLineText","options":{}},"Delivery Address":{"id":"c6h4pr6nf24v55t","title":"Delivery Address","type":"SingleLineText","options":{}},"Transport Capacity %":{"id":"cqak82rc3kgncjz","title":"Transport Capacity %","type":"SingleLineText","options":{}},"Freight Price EUR":{"id":"cwmv5m3yjc4vjgd","title":"Freight Price EUR","type":"SingleLineText","options":{}},"Invoiced":{"id":"c1ao0fait4zsa1t","title":"Invoiced","type":"SingleLineText","options":{}},"Invoice Number":{"id":"cvk3wq35dagvfah","title":"Invoice Number","type":"SingleLineText","options":{}},"Notes":{"id":"cve6so9t8q8g5en","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	019c2916-ed1d-70f9-9936-c6932424a89c	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:38:14+00	2026-02-04 14:38:14+00
019c2916-ed27-715b-ae66-5c08347acd66	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	6	DATA_INSERT	\N	\N	\N	{"data":{"Client":"Braun Chemie Transport AG","Transport":"Düsseldorf-Frankfurt 2026-02-15","Unit Type":"ADR","Quantity":"1","Cargo Description":"Benzin UN1203 Klasse 3 - Tanktransport","Pickup Address":"Rheinuferstr. 40, 40213 Düsseldorf","Delivery Address":"Industriepark Höchst, 60311 Frankfurt","Transport Capacity %":"100","Freight Price EUR":"1600.00","Invoiced":"false","Notes":"ADR Tankbeförderung - Gefahrgutdokumente erforderlich"},"column_meta":{"Client":{"id":"c2l6l8py4xjuu7j","title":"Client","type":"SingleLineText","options":{}},"Transport":{"id":"ct2tnxus061vk9f","title":"Transport","type":"SingleLineText","options":{}},"Unit Type":{"id":"ciizexx8gnmmh8u","title":"Unit Type","type":"SingleLineText","options":{}},"Quantity":{"id":"c0c98b5g14umg7j","title":"Quantity","type":"SingleLineText","options":{}},"Cargo Description":{"id":"cz4rzid030j5ukx","title":"Cargo Description","type":"SingleLineText","options":{}},"Pickup Address":{"id":"c4fz8qjifateuuv","title":"Pickup Address","type":"SingleLineText","options":{}},"Delivery Address":{"id":"c6h4pr6nf24v55t","title":"Delivery Address","type":"SingleLineText","options":{}},"Transport Capacity %":{"id":"cqak82rc3kgncjz","title":"Transport Capacity %","type":"SingleLineText","options":{}},"Freight Price EUR":{"id":"cwmv5m3yjc4vjgd","title":"Freight Price EUR","type":"SingleLineText","options":{}},"Invoiced":{"id":"c1ao0fait4zsa1t","title":"Invoiced","type":"SingleLineText","options":{}},"Invoice Number":{"id":"cvk3wq35dagvfah","title":"Invoice Number","type":"SingleLineText","options":{}},"Notes":{"id":"cve6so9t8q8g5en","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	019c2916-ed1d-70f9-9936-c6932424a89c	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:38:14+00	2026-02-04 14:38:14+00
019c2916-ed27-715b-ae66-631355973977	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	7	DATA_INSERT	\N	\N	\N	{"data":{"Client":"Fischer Automotive Logistics GmbH","Transport":"Stuttgart-München 2026-02-11","Unit Type":"Box","Quantity":"8","Cargo Description":"Gitterboxen mit Automobilteilen - JIT","Pickup Address":"Werksallee 7, 70173 Stuttgart","Delivery Address":"BMW Werk, 80331 München","Transport Capacity %":"45","Freight Price EUR":"650.00","Invoiced":"false","Notes":"JIT-Lieferung bis 06:00 Uhr"},"column_meta":{"Client":{"id":"c2l6l8py4xjuu7j","title":"Client","type":"SingleLineText","options":{}},"Transport":{"id":"ct2tnxus061vk9f","title":"Transport","type":"SingleLineText","options":{}},"Unit Type":{"id":"ciizexx8gnmmh8u","title":"Unit Type","type":"SingleLineText","options":{}},"Quantity":{"id":"c0c98b5g14umg7j","title":"Quantity","type":"SingleLineText","options":{}},"Cargo Description":{"id":"cz4rzid030j5ukx","title":"Cargo Description","type":"SingleLineText","options":{}},"Pickup Address":{"id":"c4fz8qjifateuuv","title":"Pickup Address","type":"SingleLineText","options":{}},"Delivery Address":{"id":"c6h4pr6nf24v55t","title":"Delivery Address","type":"SingleLineText","options":{}},"Transport Capacity %":{"id":"cqak82rc3kgncjz","title":"Transport Capacity %","type":"SingleLineText","options":{}},"Freight Price EUR":{"id":"cwmv5m3yjc4vjgd","title":"Freight Price EUR","type":"SingleLineText","options":{}},"Invoiced":{"id":"c1ao0fait4zsa1t","title":"Invoiced","type":"SingleLineText","options":{}},"Invoice Number":{"id":"cvk3wq35dagvfah","title":"Invoice Number","type":"SingleLineText","options":{}},"Notes":{"id":"cve6so9t8q8g5en","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	019c2916-ed1d-70f9-9936-c6932424a89c	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:38:14+00	2026-02-04 14:38:14+00
019c2916-ed27-715b-ae66-67fd4236180d	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	8	DATA_INSERT	\N	\N	\N	{"data":{"Client":"Weber Transporte GmbH","Transport":"Bremen-Hamburg 2026-02-16","Unit Type":"Other","Quantity":"1","Cargo Description":"40ft Seecontainer - Importware aus Asien","Pickup Address":"Am Containerhafen 3, 28195 Bremen","Delivery Address":"Terminaltstr. 12, 20095 Hamburg","Transport Capacity %":"100","Freight Price EUR":"480.00","Invoiced":"false","Notes":"Containerumschlag Hafen-Hafen"},"column_meta":{"Client":{"id":"c2l6l8py4xjuu7j","title":"Client","type":"SingleLineText","options":{}},"Transport":{"id":"ct2tnxus061vk9f","title":"Transport","type":"SingleLineText","options":{}},"Unit Type":{"id":"ciizexx8gnmmh8u","title":"Unit Type","type":"SingleLineText","options":{}},"Quantity":{"id":"c0c98b5g14umg7j","title":"Quantity","type":"SingleLineText","options":{}},"Cargo Description":{"id":"cz4rzid030j5ukx","title":"Cargo Description","type":"SingleLineText","options":{}},"Pickup Address":{"id":"c4fz8qjifateuuv","title":"Pickup Address","type":"SingleLineText","options":{}},"Delivery Address":{"id":"c6h4pr6nf24v55t","title":"Delivery Address","type":"SingleLineText","options":{}},"Transport Capacity %":{"id":"cqak82rc3kgncjz","title":"Transport Capacity %","type":"SingleLineText","options":{}},"Freight Price EUR":{"id":"cwmv5m3yjc4vjgd","title":"Freight Price EUR","type":"SingleLineText","options":{}},"Invoiced":{"id":"c1ao0fait4zsa1t","title":"Invoiced","type":"SingleLineText","options":{}},"Invoice Number":{"id":"cvk3wq35dagvfah","title":"Invoice Number","type":"SingleLineText","options":{}},"Notes":{"id":"cve6so9t8q8g5en","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	019c2916-ed1d-70f9-9936-c6932424a89c	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:38:14+00	2026-02-04 14:38:14+00
019c2918-d988-7167-ac54-e003eb79444a	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	\N	DATA_BULK_INSERT	\N	\N	\N	{"table_title":"3_VEHICLES"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:40:20+00	2026-02-04 14:40:20+00
019c2918-d990-717c-a214-2ec00b43d169	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	5	DATA_INSERT	\N	\N	\N	{"data":{"Registration Number":"HH-ML 1012","Body Type":"Plane/Tautliner","Capacity kg":"24000","Capacity m3":"86","Pallet Spaces":"33","ADR":"false","Inspection Date":"2026-06-15","Insurance Expiry":"2026-12-31","Notes":"MAN TGX 18.510"},"column_meta":{"Registration Number":{"id":"cdfgt6v8nwr9y3i","title":"Registration Number","type":"SingleLineText","options":{}},"Body Type":{"id":"c0jnjk2odll3lua","title":"Body Type","type":"SingleLineText","options":{}},"Capacity kg":{"id":"ckaouubcd7i4gyu","title":"Capacity kg","type":"SingleLineText","options":{}},"Capacity m3":{"id":"cesdp9nw5n67yxk","title":"Capacity m3","type":"SingleLineText","options":{}},"Pallet Spaces":{"id":"cq97xn3cuh3mohw","title":"Pallet Spaces","type":"SingleLineText","options":{}},"ADR":{"id":"c66lc7ur0u96fqs","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"cqn3y5r2szclrrt","title":"ADR Classes","type":"SingleLineText","options":{}},"Inspection Date":{"id":"ca5tehxb5qu3trm","title":"Inspection Date","type":"SingleLineText","options":{}},"Insurance Expiry":{"id":"c6iwsnpecti6kwh","title":"Insurance Expiry","type":"SingleLineText","options":{}},"Notes":{"id":"c4zvkx95ndqle16","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"3_VEHICLES"}	us96d0spja9v6cqe	\N	019c2918-d988-7167-ac54-ddbd43db29cf	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:40:20+00	2026-02-04 14:40:20+00
019c2918-d991-70e3-b31c-595912c86a0f	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	6	DATA_INSERT	\N	\N	\N	{"data":{"Registration Number":"M-SS 2034","Body Type":"Plane/Tautliner","Capacity kg":"24000","Capacity m3":"86","Pallet Spaces":"33","ADR":"false","Inspection Date":"2026-03-20","Insurance Expiry":"2026-09-30","Notes":"Volvo FH 500"},"column_meta":{"Registration Number":{"id":"cdfgt6v8nwr9y3i","title":"Registration Number","type":"SingleLineText","options":{}},"Body Type":{"id":"c0jnjk2odll3lua","title":"Body Type","type":"SingleLineText","options":{}},"Capacity kg":{"id":"ckaouubcd7i4gyu","title":"Capacity kg","type":"SingleLineText","options":{}},"Capacity m3":{"id":"cesdp9nw5n67yxk","title":"Capacity m3","type":"SingleLineText","options":{}},"Pallet Spaces":{"id":"cq97xn3cuh3mohw","title":"Pallet Spaces","type":"SingleLineText","options":{}},"ADR":{"id":"c66lc7ur0u96fqs","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"cqn3y5r2szclrrt","title":"ADR Classes","type":"SingleLineText","options":{}},"Inspection Date":{"id":"ca5tehxb5qu3trm","title":"Inspection Date","type":"SingleLineText","options":{}},"Insurance Expiry":{"id":"c6iwsnpecti6kwh","title":"Insurance Expiry","type":"SingleLineText","options":{}},"Notes":{"id":"c4zvkx95ndqle16","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"3_VEHICLES"}	us96d0spja9v6cqe	\N	019c2918-d988-7167-ac54-ddbd43db29cf	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:40:20+00	2026-02-04 14:40:20+00
019c2918-d991-70e3-b31c-5fe00b592e6b	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	7	DATA_INSERT	\N	\N	\N	{"data":{"Registration Number":"HB-WT 3056","Body Type":"Containerchassis","Capacity kg":"26000","Capacity m3":"0","Pallet Spaces":"0","ADR":"false","Inspection Date":"2026-08-10","Insurance Expiry":"2027-01-15","Notes":"Für 20ft und 40ft Container"},"column_meta":{"Registration Number":{"id":"cdfgt6v8nwr9y3i","title":"Registration Number","type":"SingleLineText","options":{}},"Body Type":{"id":"c0jnjk2odll3lua","title":"Body Type","type":"SingleLineText","options":{}},"Capacity kg":{"id":"ckaouubcd7i4gyu","title":"Capacity kg","type":"SingleLineText","options":{}},"Capacity m3":{"id":"cesdp9nw5n67yxk","title":"Capacity m3","type":"SingleLineText","options":{}},"Pallet Spaces":{"id":"cq97xn3cuh3mohw","title":"Pallet Spaces","type":"SingleLineText","options":{}},"ADR":{"id":"c66lc7ur0u96fqs","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"cqn3y5r2szclrrt","title":"ADR Classes","type":"SingleLineText","options":{}},"Inspection Date":{"id":"ca5tehxb5qu3trm","title":"Inspection Date","type":"SingleLineText","options":{}},"Insurance Expiry":{"id":"c6iwsnpecti6kwh","title":"Insurance Expiry","type":"SingleLineText","options":{}},"Notes":{"id":"c4zvkx95ndqle16","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"3_VEHICLES"}	us96d0spja9v6cqe	\N	019c2918-d988-7167-ac54-ddbd43db29cf	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:40:20+00	2026-02-04 14:40:20+00
019c2919-1272-75d2-9d5b-1882ddffb22a	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	13	DATA_DELETE	\N	\N	\N	{"data":{"Company Name":"Koch Kühllogistik GmbH","VAT ID":"DE445566778","Address":"Kühlhausring 15, 50667 Köln","Email":"disposition@koch-kuehl.de","Phone":"+49 221 456 7890","Notes":"Transport chlodniczy - mrozonki i swieze"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c2919-1271-7310-a1f5-b715a5046c4a	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:40:34+00	2026-02-04 14:40:34+00
019c2918-d991-70e3-b31c-62701d08cd16	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	8	DATA_INSERT	\N	\N	\N	{"data":{"Registration Number":"K-KK 4078","Body Type":"Kühlkoffer","Capacity kg":"22000","Capacity m3":"76","Pallet Spaces":"33","ADR":"false","Inspection Date":"2026-05-01","Insurance Expiry":"2026-11-30","Notes":"Thermo King SLXi 300 - Tiefkühlung"},"column_meta":{"Registration Number":{"id":"cdfgt6v8nwr9y3i","title":"Registration Number","type":"SingleLineText","options":{}},"Body Type":{"id":"c0jnjk2odll3lua","title":"Body Type","type":"SingleLineText","options":{}},"Capacity kg":{"id":"ckaouubcd7i4gyu","title":"Capacity kg","type":"SingleLineText","options":{}},"Capacity m3":{"id":"cesdp9nw5n67yxk","title":"Capacity m3","type":"SingleLineText","options":{}},"Pallet Spaces":{"id":"cq97xn3cuh3mohw","title":"Pallet Spaces","type":"SingleLineText","options":{}},"ADR":{"id":"c66lc7ur0u96fqs","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"cqn3y5r2szclrrt","title":"ADR Classes","type":"SingleLineText","options":{}},"Inspection Date":{"id":"ca5tehxb5qu3trm","title":"Inspection Date","type":"SingleLineText","options":{}},"Insurance Expiry":{"id":"c6iwsnpecti6kwh","title":"Insurance Expiry","type":"SingleLineText","options":{}},"Notes":{"id":"c4zvkx95ndqle16","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"3_VEHICLES"}	us96d0spja9v6cqe	\N	019c2918-d988-7167-ac54-ddbd43db29cf	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:40:20+00	2026-02-04 14:40:20+00
019c2918-d991-70e3-b31c-646fd014a494	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	9	DATA_INSERT	\N	\N	\N	{"data":{"Registration Number":"D-BC 5090","Body Type":"Tankfahrzeug","Capacity kg":"25000","Capacity m3":"0","Pallet Spaces":"0","ADR":"true","ADR Classes":"3,8","Inspection Date":"2026-09-20","Insurance Expiry":"2027-03-15","Notes":"ADR Tankzulassung Kl. 3 und 8"},"column_meta":{"Registration Number":{"id":"cdfgt6v8nwr9y3i","title":"Registration Number","type":"SingleLineText","options":{}},"Body Type":{"id":"c0jnjk2odll3lua","title":"Body Type","type":"SingleLineText","options":{}},"Capacity kg":{"id":"ckaouubcd7i4gyu","title":"Capacity kg","type":"SingleLineText","options":{}},"Capacity m3":{"id":"cesdp9nw5n67yxk","title":"Capacity m3","type":"SingleLineText","options":{}},"Pallet Spaces":{"id":"cq97xn3cuh3mohw","title":"Pallet Spaces","type":"SingleLineText","options":{}},"ADR":{"id":"c66lc7ur0u96fqs","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"cqn3y5r2szclrrt","title":"ADR Classes","type":"SingleLineText","options":{}},"Inspection Date":{"id":"ca5tehxb5qu3trm","title":"Inspection Date","type":"SingleLineText","options":{}},"Insurance Expiry":{"id":"c6iwsnpecti6kwh","title":"Insurance Expiry","type":"SingleLineText","options":{}},"Notes":{"id":"c4zvkx95ndqle16","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"3_VEHICLES"}	us96d0spja9v6cqe	\N	019c2918-d988-7167-ac54-ddbd43db29cf	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:40:20+00	2026-02-04 14:40:20+00
019c2918-d991-70e3-b31c-680ffc0422bb	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	10	DATA_INSERT	\N	\N	\N	{"data":{"Registration Number":"S-FA 6012","Body Type":"Kastenwagen","Capacity kg":"3500","Capacity m3":"22","Pallet Spaces":"8","ADR":"false","Inspection Date":"2026-04-10","Insurance Expiry":"2026-10-31","Notes":"Mercedes Sprinter - JIT Zustellungen"},"column_meta":{"Registration Number":{"id":"cdfgt6v8nwr9y3i","title":"Registration Number","type":"SingleLineText","options":{}},"Body Type":{"id":"c0jnjk2odll3lua","title":"Body Type","type":"SingleLineText","options":{}},"Capacity kg":{"id":"ckaouubcd7i4gyu","title":"Capacity kg","type":"SingleLineText","options":{}},"Capacity m3":{"id":"cesdp9nw5n67yxk","title":"Capacity m3","type":"SingleLineText","options":{}},"Pallet Spaces":{"id":"cq97xn3cuh3mohw","title":"Pallet Spaces","type":"SingleLineText","options":{}},"ADR":{"id":"c66lc7ur0u96fqs","title":"ADR","type":"SingleLineText","options":{}},"ADR Classes":{"id":"cqn3y5r2szclrrt","title":"ADR Classes","type":"SingleLineText","options":{}},"Inspection Date":{"id":"ca5tehxb5qu3trm","title":"Inspection Date","type":"SingleLineText","options":{}},"Insurance Expiry":{"id":"c6iwsnpecti6kwh","title":"Insurance Expiry","type":"SingleLineText","options":{}},"Notes":{"id":"c4zvkx95ndqle16","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"3_VEHICLES"}	us96d0spja9v6cqe	\N	019c2918-d988-7167-ac54-ddbd43db29cf	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:40:20+00	2026-02-04 14:40:20+00
019c2919-1271-7310-a1f5-b94e6ce26196	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	\N	DATA_BULK_DELETE	\N	\N	\N	{"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:40:34+00	2026-02-04 14:40:34+00
019c2919-1272-75d2-9d5b-0f4fe8a0ebdb	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	10	DATA_DELETE	\N	\N	\N	{"data":{"Company Name":"Müller Logistik GmbH","VAT ID":"DE112233445","Address":"Hafenstr. 22, 20095 Hamburg","Email":"info@mueller-logistik.de","Phone":"+49 40 123 4567","Notes":"Staly klient - transport miedzynarodowy"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c2919-1271-7310-a1f5-b715a5046c4a	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:40:34+00	2026-02-04 14:40:34+00
019c2919-1272-75d2-9d5b-137840ba3dad	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	11	DATA_DELETE	\N	\N	\N	{"data":{"Company Name":"Schneider Spedition GmbH & Co. KG","VAT ID":"DE223344556","Address":"Industriestr. 8, 80331 München","Email":"kontakt@schneider-spedition.de","Phone":"+49 89 234 5678","Notes":"Transport calopojazdowy DE-PL"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c2919-1271-7310-a1f5-b715a5046c4a	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:40:34+00	2026-02-04 14:40:34+00
019c4359-3396-72b8-b88a-2b59c6202504	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	5	DATA_UPDATE	\N	\N	\N	{"old_data":{"ADR Classes":["3"]},"data":{"ADR Classes":["3","4.2"]},"column_meta":{"ADR Classes":{"id":"cqn3y5r2szclrrt","title":"ADR Classes","type":"MultiSelect","options":{"choices":[{"title":"2","color":"#d0f1fd","id":"szlw6ktnthmnk3m"},{"title":"3","color":"#c2f5e8","id":"s54tbxmlkx60fji"},{"title":"4.2","color":"#ffdce5","id":"sxr6ld3gbt6678p"}]}}},"table_title":"3_VEHICLES"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:00:45+00	2026-02-09 17:00:45+00
019c2919-1272-75d2-9d5b-1d3d5d996cb6	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	14	DATA_DELETE	\N	\N	\N	{"data":{"Company Name":"Braun Chemie Transport AG","VAT ID":"DE556677889","Address":"Rheinuferstr. 40, 40213 Düsseldorf","Email":"logistik@braun-chemie.de","Phone":"+49 211 567 8901","Notes":"ADR - transport chemikaliow kl. 3 i 8"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c2919-1271-7310-a1f5-b715a5046c4a	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:40:34+00	2026-02-04 14:40:34+00
019c2919-1272-75d2-9d5b-2243d488b7d4	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	15	DATA_DELETE	\N	\N	\N	{"data":{"Company Name":"Fischer Automotive Logistics GmbH","VAT ID":"DE667788990","Address":"Werksallee 7, 70173 Stuttgart","Email":"spedition@fischer-auto.de","Phone":"+49 711 678 9012","Notes":"Czesci samochodowe - JIT delivery"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c2919-1271-7310-a1f5-b715a5046c4a	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:40:34+00	2026-02-04 14:40:34+00
019c2919-32d0-71d6-9ab9-1dc9b6a86a00	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	\N	DATA_BULK_INSERT	\N	\N	\N	{"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:40:43+00	2026-02-04 14:40:43+00
019c2919-32d5-756f-9421-a1e122065568	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_INSERT	\N	\N	\N	{"data":{"Company Name":"Müller Logistik GmbH","VAT ID":"DE112233445","Address":"Hafenstr. 22, 20095 Hamburg","Email":"info@mueller-logistik.de","Phone":"+49 40 123 4567","Notes":"Stammkunde - internationaler Transport"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c2919-32d0-71d6-9ab9-185e4d8ca061	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:40:43+00	2026-02-04 14:40:43+00
019c2919-32d6-736c-9f82-769c13475f22	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	17	DATA_INSERT	\N	\N	\N	{"data":{"Company Name":"Schneider Spedition GmbH & Co. KG","VAT ID":"DE223344556","Address":"Industriestr. 8, 80331 München","Email":"kontakt@schneider-spedition.de","Phone":"+49 89 234 5678","Notes":"Komplettladungen DE-PL"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c2919-32d0-71d6-9ab9-185e4d8ca061	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:40:43+00	2026-02-04 14:40:43+00
019c2919-32d6-736c-9f82-7a6f90133a54	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	18	DATA_INSERT	\N	\N	\N	{"data":{"Company Name":"Weber Transporte GmbH","VAT ID":"DE334455667","Address":"Am Containerhafen 3, 28195 Bremen","Email":"info@weber-transporte.de","Phone":"+49 421 345 6789","Notes":"Spezialisierung: See- und Containertransport"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c2919-32d0-71d6-9ab9-185e4d8ca061	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:40:43+00	2026-02-04 14:40:43+00
019c2919-32d6-736c-9f82-7e09bb62ab4d	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	19	DATA_INSERT	\N	\N	\N	{"data":{"Company Name":"Koch Kühllogistik GmbH","VAT ID":"DE445566778","Address":"Kühlhausring 15, 50667 Köln","Email":"disposition@koch-kuehl.de","Phone":"+49 221 456 7890","Notes":"Kühllogistik - Tiefkühl- und Frischware"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c2919-32d0-71d6-9ab9-185e4d8ca061	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:40:43+00	2026-02-04 14:40:43+00
019c2919-32d6-736c-9f82-8092bc403199	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	20	DATA_INSERT	\N	\N	\N	{"data":{"Company Name":"Braun Chemie Transport AG","VAT ID":"DE556677889","Address":"Rheinuferstr. 40, 40213 Düsseldorf","Email":"logistik@braun-chemie.de","Phone":"+49 211 567 8901","Notes":"ADR - Chemikalientransport Kl. 3 und 8"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c2919-32d0-71d6-9ab9-185e4d8ca061	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:40:43+00	2026-02-04 14:40:43+00
019c2919-32d6-736c-9f82-853c1d482be4	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	21	DATA_INSERT	\N	\N	\N	{"data":{"Company Name":"Fischer Automotive Logistics GmbH","VAT ID":"DE667788990","Address":"Werksallee 7, 70173 Stuttgart","Email":"spedition@fischer-auto.de","Phone":"+49 711 678 9012","Notes":"Automobilteile - JIT-Belieferung"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}},"Notes":{"id":"c6gzyjny49zofc9","title":"Notes","type":"SingleLineText","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	019c2919-32d0-71d6-9ab9-185e4d8ca061	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-04 14:40:43+00	2026-02-04 14:40:43+00
019c4358-4571-70f4-a3e4-4c3690e56d10	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	7	DATA_UPDATE	\N	\N	\N	{"old_data":{"ADR":false},"data":{"ADR":true},"column_meta":{"ADR":{"id":"c66lc7ur0u96fqs","title":"ADR","type":"Checkbox","default_value":"false","options":{"color":"#27D665","default_view_col_visibility":true,"icon":"circle-check"}}},"table_title":"3_VEHICLES"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 16:59:44+00	2026-02-09 16:59:44+00
019c4359-3074-7149-8acd-372b4618b9d5	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	5	DATA_UPDATE	\N	\N	\N	{"old_data":{"ADR Classes":null},"data":{"ADR Classes":["3"]},"column_meta":{"ADR Classes":{"id":"cqn3y5r2szclrrt","title":"ADR Classes","type":"MultiSelect","options":{"choices":[{"title":"3","color":"#c2f5e8","id":"s54tbxmlkx60fji"}]}}},"table_title":"3_VEHICLES"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:00:44+00	2026-02-09 17:00:44+00
019c4359-53ff-74b0-ae19-7a87929b0ce9	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	7	DATA_UPDATE	\N	\N	\N	{"old_data":{"ADR Classes":["4.3"]},"data":{"ADR Classes":["4.3","5.1"]},"column_meta":{"ADR Classes":{"id":"cqn3y5r2szclrrt","title":"ADR Classes","type":"MultiSelect","options":{"choices":[{"title":"1","color":"#cfdffe","id":"sx1nu0aozpdpshy"},{"title":"3","color":"#c2f5e8","id":"s54tbxmlkx60fji"},{"title":"4.3","color":"#fee2d5","id":"snphtt9w11oqggs"},{"title":"5.1","color":"#ffeab6","id":"szuh26m6ay4qngv"}]}}},"table_title":"3_VEHICLES"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:00:53+00	2026-02-09 17:00:53+00
019c4361-8400-7685-83d7-db2e45a270c7	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	4	DATA_UPDATE	\N	\N	\N	{"old_data":{"Inquiry Date":"2026-02-01 00:00:00+00:00"},"data":{"Inquiry Date":"2026-02-01 11:30:00+00:00"},"column_meta":{"Inquiry Date":{"id":"cmn1ybxtu5x8dir","title":"Inquiry Date","type":"DateTime","options":{"date_format":"YYYY-MM-DD","time_format":"HH:mm","12hr_format":false}}},"table_title":"5_INQUIRIES"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:09:50+00	2026-02-09 17:09:50+00
019c4361-9671-7258-bd73-bb2ccc907312	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	5	DATA_UPDATE	\N	\N	\N	{"old_data":{"Inquiry Date":"2026-02-02 00:00:00+00:00"},"data":{"Inquiry Date":"2026-02-02 13:30:00+00:00"},"column_meta":{"Inquiry Date":{"id":"cmn1ybxtu5x8dir","title":"Inquiry Date","type":"DateTime","options":{"date_format":"YYYY-MM-DD","time_format":"HH:mm","12hr_format":false}}},"table_title":"5_INQUIRIES"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:09:54+00	2026-02-09 17:09:54+00
019c4361-a68c-739c-87bf-973073ce96b3	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	6	DATA_UPDATE	\N	\N	\N	{"old_data":{"Inquiry Date":"2026-02-03 00:00:00+00:00"},"data":{"Inquiry Date":"2026-02-03 22:00:00+00:00"},"column_meta":{"Inquiry Date":{"id":"cmn1ybxtu5x8dir","title":"Inquiry Date","type":"DateTime","options":{"date_format":"YYYY-MM-DD","time_format":"HH:mm","12hr_format":false}}},"table_title":"5_INQUIRIES"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:09:59+00	2026-02-09 17:09:59+00
019c4361-b296-770f-8923-914ae1d98b26	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	7	DATA_UPDATE	\N	\N	\N	{"old_data":{"Inquiry Date":"2026-02-04 00:00:00+00:00"},"data":{"Inquiry Date":"2026-02-04 11:30:00+00:00"},"column_meta":{"Inquiry Date":{"id":"cmn1ybxtu5x8dir","title":"Inquiry Date","type":"DateTime","options":{"date_format":"YYYY-MM-DD","time_format":"HH:mm","12hr_format":false}}},"table_title":"5_INQUIRIES"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:10:02+00	2026-02-09 17:10:02+00
019c4361-be82-7371-a06e-ee30626859dc	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	8	DATA_UPDATE	\N	\N	\N	{"old_data":{"Inquiry Date":"2026-02-04 00:00:00+00:00"},"data":{"Inquiry Date":"2026-02-04 06:00:00+00:00"},"column_meta":{"Inquiry Date":{"id":"cmn1ybxtu5x8dir","title":"Inquiry Date","type":"DateTime","options":{"date_format":"YYYY-MM-DD","time_format":"HH:mm","12hr_format":false}}},"table_title":"5_INQUIRIES"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:10:05+00	2026-02-09 17:10:05+00
019c4361-c891-717f-9dac-9188b70ccb94	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	9	DATA_UPDATE	\N	\N	\N	{"old_data":{"Inquiry Date":"2026-02-04 00:00:00+00:00"},"data":{"Inquiry Date":"2026-02-04 08:30:00+00:00"},"column_meta":{"Inquiry Date":{"id":"cmn1ybxtu5x8dir","title":"Inquiry Date","type":"DateTime","options":{"date_format":"YYYY-MM-DD","time_format":"HH:mm","12hr_format":false}}},"table_title":"5_INQUIRIES"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:10:07+00	2026-02-09 17:10:07+00
019c4367-d570-7209-b15d-bea273caa932	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	7	DATA_UPDATE	\N	\N	\N	{"old_data":{"ADR Class/UN":["3"]},"data":{"ADR Class/UN":["3","4.3"]},"column_meta":{"ADR Class/UN":{"id":"c6zwoo8y63ltyv3","title":"ADR Class/UN","type":"MultiSelect","options":{"default_view_col_visibility":true,"choices":[{"title":"3","color":"#c2f5e8","id":"sxwghqiqy2katat"},{"title":"4.3","color":"#fee2d5","id":"sfpxbprqsdlfdsr"}]}}},"table_title":"5_INQUIRIES"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:16:44+00	2026-02-09 17:16:44+00
019c436b-0831-7050-875c-4603a9989ec7	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	4	DATA_UPDATE	\N	\N	\N	{"old_data":{"Destination":"Poznań"},"data":{"Destination":"Berlin"},"column_meta":{"Destination":{"id":"ct1zt0dav2juhz2","title":"Destination","type":"SingleLineText","options":{}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:20:13+00	2026-02-09 17:20:13+00
019c436d-b1ff-768b-82fd-2603056c3064	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	4	DATA_UPDATE	\N	\N	\N	{"old_data":{"Delivery Address":"ul. Fabryczna 22, 60-001 Poznań"},"data":{"Delivery Address":"Großmarktstr. 5, 10115 Berlin"},"column_meta":{"Delivery Address":{"id":"c6h4pr6nf24v55t","title":"Delivery Address","type":"LongText","options":{}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:23:08+00	2026-02-09 17:23:08+00
019c437b-e3b0-7078-b5ba-84611efa1069	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"2_CONTACTS","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"16","ref_row_id":"5","display_value":"Müller Logistik GmbH","ref_display_value":"Hans Müller","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:38:38+00	2026-02-09 17:38:38+00
019c437b-e3b1-7750-8888-5a2447b0c72c	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	5	DATA_LINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":"5","ref_row_id":"16","display_value":"Hans Müller","ref_display_value":"Müller Logistik GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:38:38+00	2026-02-09 17:38:38+00
019c437c-12cc-70dc-84f6-404588091910	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	6	DATA_LINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":"6","ref_row_id":"16","display_value":"Petra Hoffmann","ref_display_value":"Müller Logistik GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:38:50+00	2026-02-09 17:38:50+00
019c437d-773b-727c-8ee7-405dfcde24ee	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_UNLINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"2_CONTACTS","link_field_title":"2_CONTACTS_id","link_field_id":"c9xxtsju519a60b","row_id":"16","ref_row_id":5,"display_value":"Hans Müller","ref_display_value":"Müller Logistik GmbH","type":"oo"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:40:21+00	2026-02-09 17:40:21+00
019c437d-773b-727c-8ee7-3eadd5c2aecd	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	5	DATA_UNLINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":5,"ref_row_id":"16","display_value":"Müller Logistik GmbH","ref_display_value":"Hans Müller","type":"oo"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:40:21+00	2026-02-09 17:40:21+00
019c437d-7757-73bf-8cd9-2908bcf8e786	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	6	DATA_LINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":"6","ref_row_id":"16","display_value":"Petra Hoffmann","ref_display_value":"Müller Logistik GmbH","type":"oo"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:40:21+00	2026-02-09 17:40:21+00
019c437d-9896-738d-b266-47a9b23e8ead	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	6	DATA_UNLINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":6,"ref_row_id":"16","display_value":"Müller Logistik GmbH","ref_display_value":"Petra Hoffmann","type":"oo"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:40:30+00	2026-02-09 17:40:30+00
019c437d-98a5-701e-8ebb-c2f4b039e112	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	5	DATA_LINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":"5","ref_row_id":"16","display_value":"Hans Müller","ref_display_value":"Müller Logistik GmbH","type":"oo"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:40:30+00	2026-02-09 17:40:30+00
019c437d-774b-756d-bd34-fd290a067531	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"2_CONTACTS","link_field_title":"2_CONTACTS_id","link_field_id":"c9xxtsju519a60b","row_id":"16","ref_row_id":"6","display_value":"Müller Logistik GmbH","ref_display_value":"Petra Hoffmann","type":"oo"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:40:21+00	2026-02-09 17:40:21+00
019c437d-9896-738d-b266-4b4edb0b6e7f	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_UNLINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"2_CONTACTS","link_field_title":"2_CONTACTS_id","link_field_id":"c9xxtsju519a60b","row_id":"16","ref_row_id":6,"display_value":"Petra Hoffmann","ref_display_value":"Müller Logistik GmbH","type":"oo"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:40:30+00	2026-02-09 17:40:30+00
019c437d-98a4-7279-8692-cf38db95dfc1	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"2_CONTACTS","link_field_title":"2_CONTACTS_id","link_field_id":"c9xxtsju519a60b","row_id":"16","ref_row_id":"5","display_value":"Müller Logistik GmbH","ref_display_value":"Hans Müller","type":"oo"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:40:30+00	2026-02-09 17:40:30+00
019c437f-a36b-76f0-81d5-d49a06e9127b	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	5	DATA_LINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":"5","ref_row_id":"16","display_value":"Hans Müller","ref_display_value":"Müller Logistik GmbH","type":"hm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:42:44+00	2026-02-09 17:42:44+00
019c437f-a36d-7205-ae7a-dc56510bd67c	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"2_CONTACTS","link_field_title":"2_CONTACTS_id1","link_field_id":"c8d1k5wcftblbpl","row_id":"16","ref_row_id":"5","display_value":"Müller Logistik GmbH","ref_display_value":"Hans Müller","type":"bt"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:42:44+00	2026-02-09 17:42:44+00
019c4380-324b-70ae-b9da-61f8ea270c31	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	5	DATA_UNLINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":5,"ref_row_id":"16","display_value":"Müller Logistik GmbH","ref_display_value":"Hans Müller","type":"oo"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:43:20+00	2026-02-09 17:43:20+00
019c4380-324b-70ae-b9da-64426e426a3f	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_UNLINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"2_CONTACTS","link_field_title":"2_CONTACTS_id","link_field_id":"c9xxtsju519a60b","row_id":"16","ref_row_id":5,"display_value":"Hans Müller","ref_display_value":"Müller Logistik GmbH","type":"oo"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:43:20+00	2026-02-09 17:43:20+00
019c4380-325b-74fa-afe6-b8aa99e88790	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"2_CONTACTS","link_field_title":"2_CONTACTS_id","link_field_id":"c9xxtsju519a60b","row_id":"16","ref_row_id":"6","display_value":"Müller Logistik GmbH","ref_display_value":"Petra Hoffmann","type":"oo"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:43:20+00	2026-02-09 17:43:20+00
019c4380-3264-746b-8fcb-576515c5dbe1	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	6	DATA_LINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":"6","ref_row_id":"16","display_value":"Petra Hoffmann","ref_display_value":"Müller Logistik GmbH","type":"oo"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:43:20+00	2026-02-09 17:43:20+00
019c4382-0b81-727f-a4a6-f17c2980b90c	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	5	DATA_UNLINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":5,"ref_row_id":"16","display_value":"Hans Müller","ref_display_value":"Müller Logistik GmbH","type":"hm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:45:22+00	2026-02-09 17:45:22+00
019c4382-0b81-727f-a4a6-f58da5865baa	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_UNLINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"2_CONTACTS","link_field_title":"2_CONTACTS_id1","link_field_id":"c8d1k5wcftblbpl","row_id":"16","ref_row_id":5,"display_value":"Müller Logistik GmbH","ref_display_value":"Hans Müller","type":"bt"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:45:22+00	2026-02-09 17:45:22+00
019c4382-0b9e-75af-8370-c05720a608e5	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	6	DATA_LINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":"6","ref_row_id":"16","display_value":"Petra Hoffmann","ref_display_value":"Müller Logistik GmbH","type":"hm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:45:22+00	2026-02-09 17:45:22+00
019c4382-0ba0-77f9-93bb-8e80c9e09f46	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"2_CONTACTS","link_field_title":"2_CONTACTS_id1","link_field_id":"c8d1k5wcftblbpl","row_id":"16","ref_row_id":"6","display_value":"Müller Logistik GmbH","ref_display_value":"Petra Hoffmann","type":"bt"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:45:22+00	2026-02-09 17:45:22+00
019c4382-25ce-70cc-8f42-c6a4957aba9b	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	6	DATA_UNLINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":6,"ref_row_id":"16","display_value":"Petra Hoffmann","ref_display_value":"Müller Logistik GmbH","type":"hm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:45:28+00	2026-02-09 17:45:28+00
019c4382-25ce-70cc-8f42-ca56d6e3057e	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_UNLINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"2_CONTACTS","link_field_title":"2_CONTACTS_id1","link_field_id":"c8d1k5wcftblbpl","row_id":"16","ref_row_id":6,"display_value":"Müller Logistik GmbH","ref_display_value":"Petra Hoffmann","type":"bt"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:45:28+00	2026-02-09 17:45:28+00
019c4382-25d6-772d-bef8-668a289b67dc	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"2_CONTACTS","link_field_title":"2_CONTACTS_id1","link_field_id":"c8d1k5wcftblbpl","row_id":"16","ref_row_id":"5","display_value":"Müller Logistik GmbH","ref_display_value":"Hans Müller","type":"bt"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:45:28+00	2026-02-09 17:45:28+00
019c4382-25da-70e1-a980-500ebc3faa9d	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	5	DATA_LINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":"5","ref_row_id":"16","display_value":"Hans Müller","ref_display_value":"Müller Logistik GmbH","type":"hm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:45:28+00	2026-02-09 17:45:28+00
019c4383-525f-73ec-80f6-e6b2bc6c8052	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"2_CONTACTS","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"16","ref_row_id":"5","display_value":"Müller Logistik GmbH","ref_display_value":"Hans Müller","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:46:45+00	2026-02-09 17:46:45+00
019c4383-5261-7158-843b-b4a2f64101ff	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	5	DATA_LINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":"5","ref_row_id":"16","display_value":"Hans Müller","ref_display_value":"Müller Logistik GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:46:45+00	2026-02-09 17:46:45+00
019c4383-629d-7435-9678-5c77734d1bbe	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	6	DATA_LINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":"6","ref_row_id":"16","display_value":"Petra Hoffmann","ref_display_value":"Müller Logistik GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:46:49+00	2026-02-09 17:46:49+00
019c4383-62a0-755d-a7ec-3aded414c928	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"2_CONTACTS","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"16","ref_row_id":"6","display_value":"Müller Logistik GmbH","ref_display_value":"Petra Hoffmann","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:46:49+00	2026-02-09 17:46:49+00
019c4383-7566-729f-a038-ff2ccef2cb9b	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	17	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"2_CONTACTS","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"17","ref_row_id":"7","display_value":"Schneider Spedition GmbH & Co. KG","ref_display_value":"Thomas Schneider","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:46:54+00	2026-02-09 17:46:54+00
019c4383-756e-738e-996f-7fa8baec9e6a	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	7	DATA_LINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":"7","ref_row_id":"17","display_value":"Thomas Schneider","ref_display_value":"Schneider Spedition GmbH & Co. KG","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:46:54+00	2026-02-09 17:46:54+00
019c4383-81d9-762d-a4fe-394c3b216128	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	17	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"2_CONTACTS","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"17","ref_row_id":"8","display_value":"Schneider Spedition GmbH & Co. KG","ref_display_value":"Sabine Lang","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:46:57+00	2026-02-09 17:46:57+00
019c4383-81dd-745b-b247-8bb6a05ac747	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	8	DATA_LINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":"8","ref_row_id":"17","display_value":"Sabine Lang","ref_display_value":"Schneider Spedition GmbH & Co. KG","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:46:57+00	2026-02-09 17:46:57+00
019c4383-9cfa-704d-9b16-7b90e9966999	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	18	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"2_CONTACTS","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"18","ref_row_id":"9","display_value":"Weber Transporte GmbH","ref_display_value":"Klaus Weber","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:47:04+00	2026-02-09 17:47:04+00
019c4383-9cfc-7288-ba22-afea95370404	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	9	DATA_LINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":"9","ref_row_id":"18","display_value":"Klaus Weber","ref_display_value":"Weber Transporte GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:47:04+00	2026-02-09 17:47:04+00
019c4383-b4da-71cb-9ad6-4ff7fdc1e4c0	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	19	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"2_CONTACTS","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"19","ref_row_id":"10","display_value":"Koch Kühllogistik GmbH","ref_display_value":"Monika Koch","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:47:10+00	2026-02-09 17:47:10+00
019c4383-b4db-720e-9f8d-67b3801d2523	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	10	DATA_LINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":"10","ref_row_id":"19","display_value":"Monika Koch","ref_display_value":"Koch Kühllogistik GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:47:10+00	2026-02-09 17:47:10+00
019c4383-c3db-70ba-973b-edc704756433	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	20	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"2_CONTACTS","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"20","ref_row_id":"11","display_value":"Braun Chemie Transport AG","ref_display_value":"Stefan Braun","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:47:14+00	2026-02-09 17:47:14+00
019c4383-c3dd-76d0-b4c8-1c318b022fae	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	11	DATA_LINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":"11","ref_row_id":"20","display_value":"Stefan Braun","ref_display_value":"Braun Chemie Transport AG","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:47:14+00	2026-02-09 17:47:14+00
019c4383-d390-77fb-8745-b51f1fa4f9bd	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	12	DATA_LINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":"12","ref_row_id":"21","display_value":"Katrin Fischer","ref_display_value":"Fischer Automotive Logistics GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:47:18+00	2026-02-09 17:47:18+00
019c4383-d391-76de-be38-2a8e4569d04f	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	21	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"2_CONTACTS","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"21","ref_row_id":"12","display_value":"Fischer Automotive Logistics GmbH","ref_display_value":"Katrin Fischer","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:47:18+00	2026-02-09 17:47:18+00
019c438b-e511-7349-8f00-9b5ad53a2b8c	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	5	DATA_LINK	\N	\N	\N	{"table_title":"3_VEHICLES","ref_table_title":"4_DRIVERS","link_field_title":"4_DRIVERS_id","link_field_id":"chb4b6ko2b2awai","row_id":"5","ref_row_id":"5","display_value":"HH-ML 1012","ref_display_value":"Jürgen Hartmann","type":"bt"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:56:07+00	2026-02-09 17:56:07+00
019c438b-e515-726b-9902-e119c01052cb	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	5	DATA_LINK	\N	\N	\N	{"table_title":"4_DRIVERS","ref_table_title":"3_VEHICLES","link_field_title":"Id","link_field_id":"cra65d75swysgg2","row_id":"5","ref_row_id":"5","display_value":"Jürgen Hartmann","ref_display_value":"HH-ML 1012","type":"hm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:56:07+00	2026-02-09 17:56:07+00
019c438d-30da-742c-8e9a-31dd0f970e6e	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	6	DATA_LINK	\N	\N	\N	{"table_title":"3_VEHICLES","ref_table_title":"4_DRIVERS","link_field_title":"4_DRIVERS_id","link_field_id":"chb4b6ko2b2awai","row_id":"6","ref_row_id":"6","display_value":"M-SS 2034","ref_display_value":"Michael Becker","type":"bt"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:57:32+00	2026-02-09 17:57:32+00
019c438d-30de-776a-91c0-b95cb1c37027	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	6	DATA_LINK	\N	\N	\N	{"table_title":"4_DRIVERS","ref_table_title":"3_VEHICLES","link_field_title":"Id","link_field_id":"cra65d75swysgg2","row_id":"6","ref_row_id":"6","display_value":"Michael Becker","ref_display_value":"M-SS 2034","type":"hm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:57:32+00	2026-02-09 17:57:32+00
019c438d-363a-7057-b1c0-5c3d546bcc66	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	7	DATA_LINK	\N	\N	\N	{"table_title":"3_VEHICLES","ref_table_title":"4_DRIVERS","link_field_title":"4_DRIVERS_id","link_field_id":"chb4b6ko2b2awai","row_id":"7","ref_row_id":"6","display_value":"HB-WT 3056","ref_display_value":"Michael Becker","type":"bt"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:57:33+00	2026-02-09 17:57:33+00
019c438d-363b-7341-9db9-8526b1b31b30	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	6	DATA_LINK	\N	\N	\N	{"table_title":"4_DRIVERS","ref_table_title":"3_VEHICLES","link_field_title":"Id","link_field_id":"cra65d75swysgg2","row_id":"6","ref_row_id":"7","display_value":"Michael Becker","ref_display_value":"HB-WT 3056","type":"hm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:57:33+00	2026-02-09 17:57:33+00
019c438d-8989-72fd-b53a-dfb4f6430965	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	5	DATA_UNLINK	\N	\N	\N	{"table_title":"4_DRIVERS","ref_table_title":"3_VEHICLES","link_field_title":"Id","link_field_id":"cra65d75swysgg2","row_id":5,"ref_row_id":"5","display_value":"Jürgen Hartmann","ref_display_value":"HH-ML 1012","type":"hm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:57:55+00	2026-02-09 17:57:55+00
019c438d-8989-72fd-b53a-e38baa615b57	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	5	DATA_UNLINK	\N	\N	\N	{"table_title":"3_VEHICLES","ref_table_title":"4_DRIVERS","link_field_title":"4_DRIVERS_id","link_field_id":"chb4b6ko2b2awai","row_id":"5","ref_row_id":5,"display_value":"HH-ML 1012","ref_display_value":"Jürgen Hartmann","type":"bt"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:57:55+00	2026-02-09 17:57:55+00
019c438d-8996-7248-9de7-bc1a0b56f2c1	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	7	DATA_LINK	\N	\N	\N	{"table_title":"4_DRIVERS","ref_table_title":"3_VEHICLES","link_field_title":"Id","link_field_id":"cra65d75swysgg2","row_id":"7","ref_row_id":"5","display_value":"Andreas Richter","ref_display_value":"HH-ML 1012","type":"hm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:57:55+00	2026-02-09 17:57:55+00
019c438d-8998-751a-bdb5-c9bd85333a13	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	5	DATA_LINK	\N	\N	\N	{"table_title":"3_VEHICLES","ref_table_title":"4_DRIVERS","link_field_title":"4_DRIVERS_id","link_field_id":"chb4b6ko2b2awai","row_id":"5","ref_row_id":"7","display_value":"HH-ML 1012","ref_display_value":"Andreas Richter","type":"bt"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:57:55+00	2026-02-09 17:57:55+00
019c438e-099f-76cf-ac49-f0588e0629f0	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	5	DATA_LINK	\N	\N	\N	{"table_title":"3_VEHICLES","ref_table_title":"4_DRIVERS","link_field_title":"Id","link_field_id":"chs7p910b3q6yqm","row_id":"5","ref_row_id":"5","display_value":"HH-ML 1012","ref_display_value":"Jürgen Hartmann","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:58:27+00	2026-02-09 17:58:27+00
019c438e-09a1-7075-a5d0-f851f7e3003f	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	5	DATA_LINK	\N	\N	\N	{"table_title":"4_DRIVERS","ref_table_title":"3_VEHICLES","link_field_title":"Id","link_field_id":"cra65d75swysgg2","row_id":"5","ref_row_id":"5","display_value":"Jürgen Hartmann","ref_display_value":"HH-ML 1012","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:58:28+00	2026-02-09 17:58:28+00
019c438e-18f1-770f-8973-6039fce68255	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	6	DATA_LINK	\N	\N	\N	{"table_title":"4_DRIVERS","ref_table_title":"3_VEHICLES","link_field_title":"Id","link_field_id":"cra65d75swysgg2","row_id":"6","ref_row_id":"6","display_value":"Michael Becker","ref_display_value":"M-SS 2034","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:58:31+00	2026-02-09 17:58:31+00
019c438e-18f3-728f-8d9f-855bba9a1210	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	6	DATA_LINK	\N	\N	\N	{"table_title":"3_VEHICLES","ref_table_title":"4_DRIVERS","link_field_title":"Id","link_field_id":"chs7p910b3q6yqm","row_id":"6","ref_row_id":"6","display_value":"M-SS 2034","ref_display_value":"Michael Becker","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:58:31+00	2026-02-09 17:58:31+00
019c438e-276d-7732-93c3-5591ceccd2d3	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	7	DATA_LINK	\N	\N	\N	{"table_title":"3_VEHICLES","ref_table_title":"4_DRIVERS","link_field_title":"Id","link_field_id":"chs7p910b3q6yqm","row_id":"7","ref_row_id":"7","display_value":"HB-WT 3056","ref_display_value":"Andreas Richter","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:58:35+00	2026-02-09 17:58:35+00
019c438e-4600-7368-90df-890f145c0b1c	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	9	DATA_LINK	\N	\N	\N	{"table_title":"3_VEHICLES","ref_table_title":"4_DRIVERS","link_field_title":"Id","link_field_id":"chs7p910b3q6yqm","row_id":"9","ref_row_id":"9","display_value":"D-BC 5090","ref_display_value":"Oliver Wagner","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:58:43+00	2026-02-09 17:58:43+00
019c438e-2770-725c-9a9b-ebbca13c094a	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	7	DATA_LINK	\N	\N	\N	{"table_title":"4_DRIVERS","ref_table_title":"3_VEHICLES","link_field_title":"Id","link_field_id":"cra65d75swysgg2","row_id":"7","ref_row_id":"7","display_value":"Andreas Richter","ref_display_value":"HB-WT 3056","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:58:35+00	2026-02-09 17:58:35+00
019c438e-32e3-74ea-9f6b-215db883ad1f	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	8	DATA_LINK	\N	\N	\N	{"table_title":"4_DRIVERS","ref_table_title":"3_VEHICLES","link_field_title":"Id","link_field_id":"cra65d75swysgg2","row_id":"8","ref_row_id":"8","display_value":"Frank Zimmermann","ref_display_value":"K-KK 4078","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:58:38+00	2026-02-09 17:58:38+00
019c438e-4601-7609-85e7-1eb766a36744	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	9	DATA_LINK	\N	\N	\N	{"table_title":"4_DRIVERS","ref_table_title":"3_VEHICLES","link_field_title":"Id","link_field_id":"cra65d75swysgg2","row_id":"9","ref_row_id":"9","display_value":"Oliver Wagner","ref_display_value":"D-BC 5090","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:58:43+00	2026-02-09 17:58:43+00
019c438e-56d1-7671-850a-31772ee0d880	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	10	DATA_LINK	\N	\N	\N	{"table_title":"4_DRIVERS","ref_table_title":"3_VEHICLES","link_field_title":"Id","link_field_id":"cra65d75swysgg2","row_id":"10","ref_row_id":"10","display_value":"Lukas Schäfer","ref_display_value":"S-FA 6012","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:58:47+00	2026-02-09 17:58:47+00
019c438e-32e1-779c-be40-f12510f50329	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	8	DATA_LINK	\N	\N	\N	{"table_title":"3_VEHICLES","ref_table_title":"4_DRIVERS","link_field_title":"Id","link_field_id":"chs7p910b3q6yqm","row_id":"8","ref_row_id":"8","display_value":"K-KK 4078","ref_display_value":"Frank Zimmermann","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:58:38+00	2026-02-09 17:58:38+00
019c438e-56d0-7540-82d2-8615e5b98736	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	10	DATA_LINK	\N	\N	\N	{"table_title":"3_VEHICLES","ref_table_title":"4_DRIVERS","link_field_title":"Id","link_field_id":"chs7p910b3q6yqm","row_id":"10","ref_row_id":"10","display_value":"S-FA 6012","ref_display_value":"Lukas Schäfer","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 17:58:47+00	2026-02-09 17:58:47+00
019c4393-e64d-75bc-8467-716854cf01a1	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	4	DATA_LINK	\N	\N	\N	{"table_title":"5_INQUIRIES","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"ctfseugejnckr3v","row_id":"4","ref_row_id":"16","display_value":"2026-02-01 11:30:00+00:00","ref_display_value":"Müller Logistik GmbH","type":"hm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:04:52+00	2026-02-09 18:04:52+00
019c4393-e65a-71e0-b0f9-6e45bde5b854	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"5_INQUIRIES","link_field_title":"5_INQUIRIES_id","link_field_id":"c3xvlltidu8h3aq","row_id":"16","ref_row_id":"4","display_value":"Müller Logistik GmbH","ref_display_value":"2026-02-01 11:30:00+00:00","type":"bt"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:04:52+00	2026-02-09 18:04:52+00
019c4393-f688-7668-8504-828eb2938701	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_UNLINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"5_INQUIRIES","link_field_title":"5_INQUIRIES_id","link_field_id":"c3xvlltidu8h3aq","row_id":"16","ref_row_id":4,"display_value":"Müller Logistik GmbH","ref_display_value":"2026-02-01 11:30:00+00:00","type":"bt"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:04:56+00	2026-02-09 18:04:56+00
019c4393-f688-7668-8504-7f26e82de9ee	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	4	DATA_UNLINK	\N	\N	\N	{"table_title":"5_INQUIRIES","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"ctfseugejnckr3v","row_id":4,"ref_row_id":"16","display_value":"2026-02-01 11:30:00+00:00","ref_display_value":"Müller Logistik GmbH","type":"hm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:04:56+00	2026-02-09 18:04:56+00
019c4393-f699-766a-a125-01b576148f2d	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"5_INQUIRIES","link_field_title":"5_INQUIRIES_id","link_field_id":"c3xvlltidu8h3aq","row_id":"16","ref_row_id":"5","display_value":"Müller Logistik GmbH","ref_display_value":"2026-02-02 13:30:00+00:00","type":"bt"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:04:56+00	2026-02-09 18:04:56+00
019c4393-f69a-733b-acd3-1e461024da14	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	5	DATA_LINK	\N	\N	\N	{"table_title":"5_INQUIRIES","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"ctfseugejnckr3v","row_id":"5","ref_row_id":"16","display_value":"2026-02-02 13:30:00+00:00","ref_display_value":"Müller Logistik GmbH","type":"hm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:04:56+00	2026-02-09 18:04:56+00
019c4393-fcfd-744a-9267-cd1c78d8e8c0	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	5	DATA_UNLINK	\N	\N	\N	{"table_title":"5_INQUIRIES","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"ctfseugejnckr3v","row_id":"5","ref_row_id":"16","display_value":"2026-02-02 13:30:00+00:00","ref_display_value":"Müller Logistik GmbH","type":"hm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:04:57+00	2026-02-09 18:04:57+00
019c4393-fcfe-756d-bf36-dc4b4506c523	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_UNLINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"5_INQUIRIES","link_field_title":"5_INQUIRIES_id","link_field_id":"c3xvlltidu8h3aq","row_id":"16","ref_row_id":"5","display_value":"Müller Logistik GmbH","ref_display_value":"2026-02-02 13:30:00+00:00","type":"bt"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:04:57+00	2026-02-09 18:04:57+00
019c4394-7bf2-774f-a254-4d3f50c92c28	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	4	DATA_LINK	\N	\N	\N	{"table_title":"5_INQUIRIES","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"ctfseugejnckr3v","row_id":"4","ref_row_id":"16","display_value":"2026-02-01 11:30:00+00:00","ref_display_value":"Müller Logistik GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:05:30+00	2026-02-09 18:05:30+00
019c4394-7bf7-748f-af08-e027dca31e55	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"5_INQUIRIES","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"16","ref_row_id":"4","display_value":"Müller Logistik GmbH","ref_display_value":"2026-02-01 11:30:00+00:00","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:05:30+00	2026-02-09 18:05:30+00
019c4394-88bc-75bf-babc-d4f471c924af	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	17	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"5_INQUIRIES","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"17","ref_row_id":"5","display_value":"Schneider Spedition GmbH & Co. KG","ref_display_value":"2026-02-02 13:30:00+00:00","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:05:33+00	2026-02-09 18:05:33+00
019c4394-88c0-7157-9dfd-883acb442e56	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	5	DATA_LINK	\N	\N	\N	{"table_title":"5_INQUIRIES","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"ctfseugejnckr3v","row_id":"5","ref_row_id":"17","display_value":"2026-02-02 13:30:00+00:00","ref_display_value":"Schneider Spedition GmbH & Co. KG","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:05:33+00	2026-02-09 18:05:33+00
019c4394-a292-76ec-953a-4e4c12e22da8	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	6	DATA_LINK	\N	\N	\N	{"table_title":"5_INQUIRIES","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"ctfseugejnckr3v","row_id":"6","ref_row_id":"16","display_value":"2026-02-03 22:00:00+00:00","ref_display_value":"Müller Logistik GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:05:40+00	2026-02-09 18:05:40+00
019c4394-a29b-75d8-bf68-7c5aee9ec498	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"5_INQUIRIES","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"16","ref_row_id":"6","display_value":"Müller Logistik GmbH","ref_display_value":"2026-02-03 22:00:00+00:00","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:05:40+00	2026-02-09 18:05:40+00
019c4394-b209-76e0-8c32-65b204b09add	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	6	DATA_LINK	\N	\N	\N	{"table_title":"5_INQUIRIES","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"ctfseugejnckr3v","row_id":"6","ref_row_id":"19","display_value":"2026-02-03 22:00:00+00:00","ref_display_value":"Koch Kühllogistik GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:05:44+00	2026-02-09 18:05:44+00
019c4394-dd68-715a-bbff-dedf5ba4f501	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	8	DATA_LINK	\N	\N	\N	{"table_title":"5_INQUIRIES","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"ctfseugejnckr3v","row_id":"8","ref_row_id":"21","display_value":"2026-02-04 06:00:00+00:00","ref_display_value":"Fischer Automotive Logistics GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:05:55+00	2026-02-09 18:05:55+00
019c4394-aa96-7022-aa25-67781d48b00e	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	6	DATA_UNLINK	\N	\N	\N	{"table_title":"5_INQUIRIES","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"ctfseugejnckr3v","row_id":"6","ref_row_id":"16","display_value":"2026-02-03 22:00:00+00:00","ref_display_value":"Müller Logistik GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:05:42+00	2026-02-09 18:05:42+00
019c4394-c43c-73a5-8eb1-01e48959b361	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	7	DATA_LINK	\N	\N	\N	{"table_title":"5_INQUIRIES","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"ctfseugejnckr3v","row_id":"7","ref_row_id":"20","display_value":"2026-02-04 11:30:00+00:00","ref_display_value":"Braun Chemie Transport AG","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:05:48+00	2026-02-09 18:05:48+00
019c4394-dd64-7225-b565-09d95b36a49f	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	21	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"5_INQUIRIES","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"21","ref_row_id":"8","display_value":"Fischer Automotive Logistics GmbH","ref_display_value":"2026-02-04 06:00:00+00:00","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:05:55+00	2026-02-09 18:05:55+00
019c4394-fa38-72e7-bd73-4ba4298525ca	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	18	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"5_INQUIRIES","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"18","ref_row_id":"9","display_value":"Weber Transporte GmbH","ref_display_value":"2026-02-04 08:30:00+00:00","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:06:02+00	2026-02-09 18:06:02+00
019c4394-aa98-76bb-90ce-57a2c4732567	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_UNLINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"5_INQUIRIES","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"16","ref_row_id":"6","display_value":"Müller Logistik GmbH","ref_display_value":"2026-02-03 22:00:00+00:00","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:05:42+00	2026-02-09 18:05:42+00
019c4394-b20b-741f-80e8-fed975ca70ed	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	19	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"5_INQUIRIES","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"19","ref_row_id":"6","display_value":"Koch Kühllogistik GmbH","ref_display_value":"2026-02-03 22:00:00+00:00","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:05:44+00	2026-02-09 18:05:44+00
019c4394-c43b-708d-8008-88538c146e0c	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	20	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"5_INQUIRIES","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"20","ref_row_id":"7","display_value":"Braun Chemie Transport AG","ref_display_value":"2026-02-04 11:30:00+00:00","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:05:48+00	2026-02-09 18:05:48+00
019c4394-fa32-7656-8526-0eb685932ef7	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	9	DATA_LINK	\N	\N	\N	{"table_title":"5_INQUIRIES","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"ctfseugejnckr3v","row_id":"9","ref_row_id":"18","display_value":"2026-02-04 08:30:00+00:00","ref_display_value":"Weber Transporte GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:06:02+00	2026-02-09 18:06:02+00
019c439a-f615-749f-905d-e9be1198d4d1	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	4	DATA_LINK	\N	\N	\N	{"table_title":"5_INQUIRIES","ref_table_title":"2_CONTACTS","link_field_title":"Id","link_field_id":"ctfseugejnckr3v","row_id":"4","ref_row_id":"5","display_value":"2026-02-01 11:30:00+00:00","ref_display_value":"Hans Müller","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:12:34+00	2026-02-09 18:12:34+00
019c439a-f620-74ea-bfc9-6f7e8aa0dcff	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	5	DATA_LINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"5_INQUIRIES","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":"5","ref_row_id":"4","display_value":"Hans Müller","ref_display_value":"2026-02-01 11:30:00+00:00","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:12:34+00	2026-02-09 18:12:34+00
019c439b-13c8-771c-962f-9d8a58bf90cd	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	7	DATA_LINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"5_INQUIRIES","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":"7","ref_row_id":"5","display_value":"Thomas Schneider","ref_display_value":"2026-02-02 13:30:00+00:00","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:12:42+00	2026-02-09 18:12:42+00
019c439b-13cb-76ce-ace3-a64ca9ce919c	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	5	DATA_LINK	\N	\N	\N	{"table_title":"5_INQUIRIES","ref_table_title":"2_CONTACTS","link_field_title":"Id","link_field_id":"ctfseugejnckr3v","row_id":"5","ref_row_id":"7","display_value":"2026-02-02 13:30:00+00:00","ref_display_value":"Thomas Schneider","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:12:42+00	2026-02-09 18:12:42+00
019c439b-2337-7506-bce1-72fce937736b	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	10	DATA_LINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"5_INQUIRIES","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":"10","ref_row_id":"6","display_value":"Monika Koch","ref_display_value":"2026-02-03 22:00:00+00:00","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:12:46+00	2026-02-09 18:12:46+00
019c439b-2339-746b-8c93-afdba591cddf	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	6	DATA_LINK	\N	\N	\N	{"table_title":"5_INQUIRIES","ref_table_title":"2_CONTACTS","link_field_title":"Id","link_field_id":"ctfseugejnckr3v","row_id":"6","ref_row_id":"10","display_value":"2026-02-03 22:00:00+00:00","ref_display_value":"Monika Koch","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:12:46+00	2026-02-09 18:12:46+00
019c439b-4174-746a-83e8-17b122c0749a	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	7	DATA_LINK	\N	\N	\N	{"table_title":"5_INQUIRIES","ref_table_title":"2_CONTACTS","link_field_title":"Id","link_field_id":"ctfseugejnckr3v","row_id":"7","ref_row_id":"11","display_value":"2026-02-04 11:30:00+00:00","ref_display_value":"Stefan Braun","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:12:54+00	2026-02-09 18:12:54+00
019c439b-4177-7405-8183-54589c5f9168	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	11	DATA_LINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"5_INQUIRIES","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":"11","ref_row_id":"7","display_value":"Stefan Braun","ref_display_value":"2026-02-04 11:30:00+00:00","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:12:54+00	2026-02-09 18:12:54+00
019c439b-5eef-752b-9ae5-7dde1aa17546	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	8	DATA_LINK	\N	\N	\N	{"table_title":"5_INQUIRIES","ref_table_title":"2_CONTACTS","link_field_title":"Id","link_field_id":"ctfseugejnckr3v","row_id":"8","ref_row_id":"12","display_value":"2026-02-04 06:00:00+00:00","ref_display_value":"Katrin Fischer","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:13:01+00	2026-02-09 18:13:01+00
019c439b-5f01-769d-8e7c-001426cab219	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	12	DATA_LINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"5_INQUIRIES","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":"12","ref_row_id":"8","display_value":"Katrin Fischer","ref_display_value":"2026-02-04 06:00:00+00:00","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:13:01+00	2026-02-09 18:13:01+00
019c439b-6e79-70cb-a300-07538831883b	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	9	DATA_LINK	\N	\N	\N	{"table_title":"5_INQUIRIES","ref_table_title":"2_CONTACTS","link_field_title":"Id","link_field_id":"ctfseugejnckr3v","row_id":"9","ref_row_id":"9","display_value":"2026-02-04 08:30:00+00:00","ref_display_value":"Klaus Weber","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:13:05+00	2026-02-09 18:13:05+00
019c439b-6e7d-736e-9737-cedbd98214aa	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	9	DATA_LINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"5_INQUIRIES","link_field_title":"Id","link_field_id":"cchwvjoyq7bj1hk","row_id":"9","ref_row_id":"9","display_value":"Klaus Weber","ref_display_value":"2026-02-04 08:30:00+00:00","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:13:05+00	2026-02-09 18:13:05+00
019c439d-0315-720c-ac03-b53c40e2c728	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	3	DATA_LINK	\N	\N	\N	{"table_title":"6_TRANSPORTS","ref_table_title":"3_VEHICLES","link_field_title":"Id","link_field_id":"cmiuaf9abst33dy","row_id":"3","ref_row_id":"5","display_value":"2026-02-10","ref_display_value":"HH-ML 1012","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:14:49+00	2026-02-09 18:14:49+00
019c439d-1bb0-7757-811c-f203467222b1	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	8	DATA_LINK	\N	\N	\N	{"table_title":"3_VEHICLES","ref_table_title":"6_TRANSPORTS","link_field_title":"Id","link_field_id":"chs7p910b3q6yqm","row_id":"8","ref_row_id":"5","display_value":"K-KK 4078","ref_display_value":"2026-02-14","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:14:55+00	2026-02-09 18:14:55+00
019c439d-277a-74ec-b18e-51062304a3cc	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	6	DATA_LINK	\N	\N	\N	{"table_title":"6_TRANSPORTS","ref_table_title":"3_VEHICLES","link_field_title":"Id","link_field_id":"cmiuaf9abst33dy","row_id":"6","ref_row_id":"9","display_value":"2026-02-15","ref_display_value":"D-BC 5090","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:14:58+00	2026-02-09 18:14:58+00
019c439d-0314-720a-90ce-159a2e53f01a	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	5	DATA_LINK	\N	\N	\N	{"table_title":"3_VEHICLES","ref_table_title":"6_TRANSPORTS","link_field_title":"Id","link_field_id":"chs7p910b3q6yqm","row_id":"5","ref_row_id":"3","display_value":"HH-ML 1012","ref_display_value":"2026-02-10","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:14:49+00	2026-02-09 18:14:49+00
019c439d-0ebd-7469-8d82-0eaae6477ba6	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	6	DATA_LINK	\N	\N	\N	{"table_title":"3_VEHICLES","ref_table_title":"6_TRANSPORTS","link_field_title":"Id","link_field_id":"chs7p910b3q6yqm","row_id":"6","ref_row_id":"4","display_value":"M-SS 2034","ref_display_value":"2026-02-12","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:14:52+00	2026-02-09 18:14:52+00
019c439d-0ec0-7738-975e-a17bff01dcf9	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	4	DATA_LINK	\N	\N	\N	{"table_title":"6_TRANSPORTS","ref_table_title":"3_VEHICLES","link_field_title":"Id","link_field_id":"cmiuaf9abst33dy","row_id":"4","ref_row_id":"6","display_value":"2026-02-12","ref_display_value":"M-SS 2034","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:14:52+00	2026-02-09 18:14:52+00
019c439d-1bac-7132-bfa9-88f4f26f01c2	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	5	DATA_LINK	\N	\N	\N	{"table_title":"6_TRANSPORTS","ref_table_title":"3_VEHICLES","link_field_title":"Id","link_field_id":"cmiuaf9abst33dy","row_id":"5","ref_row_id":"8","display_value":"2026-02-14","ref_display_value":"K-KK 4078","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:14:55+00	2026-02-09 18:14:55+00
019c439d-2775-77ee-9336-1a28313664c4	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	9	DATA_LINK	\N	\N	\N	{"table_title":"3_VEHICLES","ref_table_title":"6_TRANSPORTS","link_field_title":"Id","link_field_id":"chs7p910b3q6yqm","row_id":"9","ref_row_id":"6","display_value":"D-BC 5090","ref_display_value":"2026-02-15","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:14:58+00	2026-02-09 18:14:58+00
019c439d-39b3-758a-8e0a-c75cbd7a2534	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	10	DATA_LINK	\N	\N	\N	{"table_title":"3_VEHICLES","ref_table_title":"6_TRANSPORTS","link_field_title":"Id","link_field_id":"chs7p910b3q6yqm","row_id":"10","ref_row_id":"7","display_value":"S-FA 6012","ref_display_value":"2026-02-11","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:15:03+00	2026-02-09 18:15:03+00
019c439d-39ba-75fb-8cb5-a3b9bcdf80fc	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	7	DATA_LINK	\N	\N	\N	{"table_title":"6_TRANSPORTS","ref_table_title":"3_VEHICLES","link_field_title":"Id","link_field_id":"cmiuaf9abst33dy","row_id":"7","ref_row_id":"10","display_value":"2026-02-11","ref_display_value":"S-FA 6012","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:15:03+00	2026-02-09 18:15:03+00
019c439d-4602-775b-90a0-5d79bde6d674	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	7	DATA_LINK	\N	\N	\N	{"table_title":"3_VEHICLES","ref_table_title":"6_TRANSPORTS","link_field_title":"Id","link_field_id":"chs7p910b3q6yqm","row_id":"7","ref_row_id":"8","display_value":"HB-WT 3056","ref_display_value":"2026-02-16","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:15:06+00	2026-02-09 18:15:06+00
019c439d-4605-76e9-a488-a582471f5936	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	8	DATA_LINK	\N	\N	\N	{"table_title":"6_TRANSPORTS","ref_table_title":"3_VEHICLES","link_field_title":"Id","link_field_id":"cmiuaf9abst33dy","row_id":"8","ref_row_id":"7","display_value":"2026-02-16","ref_display_value":"HB-WT 3056","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:15:06+00	2026-02-09 18:15:06+00
019c439f-b0b8-77ec-8ea4-0c1ea3db7725	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	5	DATA_LINK	\N	\N	\N	{"table_title":"4_DRIVERS","ref_table_title":"6_TRANSPORTS","link_field_title":"Id","link_field_id":"cra65d75swysgg2","row_id":"5","ref_row_id":"3","display_value":"Jürgen Hartmann","ref_display_value":"2026-02-10","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:17:44+00	2026-02-09 18:17:44+00
019c439f-b0ba-7728-a9c0-50d97ece058d	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	3	DATA_LINK	\N	\N	\N	{"table_title":"6_TRANSPORTS","ref_table_title":"4_DRIVERS","link_field_title":"Id","link_field_id":"cmiuaf9abst33dy","row_id":"3","ref_row_id":"5","display_value":"2026-02-10","ref_display_value":"Jürgen Hartmann","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:17:44+00	2026-02-09 18:17:44+00
019c439f-c2de-747e-a913-dd1b516c017b	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	4	DATA_LINK	\N	\N	\N	{"table_title":"6_TRANSPORTS","ref_table_title":"4_DRIVERS","link_field_title":"Id","link_field_id":"cmiuaf9abst33dy","row_id":"4","ref_row_id":"6","display_value":"2026-02-12","ref_display_value":"Michael Becker","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:17:49+00	2026-02-09 18:17:49+00
019c439f-c2e5-740e-a13c-d7a2d612b17e	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	6	DATA_LINK	\N	\N	\N	{"table_title":"4_DRIVERS","ref_table_title":"6_TRANSPORTS","link_field_title":"Id","link_field_id":"cra65d75swysgg2","row_id":"6","ref_row_id":"4","display_value":"Michael Becker","ref_display_value":"2026-02-12","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:17:49+00	2026-02-09 18:17:49+00
019c439f-ddce-774f-b10a-f11e0ba4d250	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	5	DATA_LINK	\N	\N	\N	{"table_title":"6_TRANSPORTS","ref_table_title":"4_DRIVERS","link_field_title":"Id","link_field_id":"cmiuaf9abst33dy","row_id":"5","ref_row_id":"8","display_value":"2026-02-14","ref_display_value":"Frank Zimmermann","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:17:56+00	2026-02-09 18:17:56+00
019c439f-ddd0-72c0-af22-ca2e2f11d3ea	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	8	DATA_LINK	\N	\N	\N	{"table_title":"4_DRIVERS","ref_table_title":"6_TRANSPORTS","link_field_title":"Id","link_field_id":"cra65d75swysgg2","row_id":"8","ref_row_id":"5","display_value":"Frank Zimmermann","ref_display_value":"2026-02-14","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:17:56+00	2026-02-09 18:17:56+00
019c43a0-80ee-75ff-988c-99d7a25c2e1d	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	9	DATA_LINK	\N	\N	\N	{"table_title":"4_DRIVERS","ref_table_title":"6_TRANSPORTS","link_field_title":"Id","link_field_id":"cra65d75swysgg2","row_id":"9","ref_row_id":"6","display_value":"Oliver Wagner","ref_display_value":"2026-02-15","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:18:38+00	2026-02-09 18:18:38+00
019c43a0-d960-77a6-aa00-b3eb23519fcb	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	8	DATA_LINK	\N	\N	\N	{"table_title":"6_TRANSPORTS","ref_table_title":"4_DRIVERS","link_field_title":"Id","link_field_id":"cmiuaf9abst33dy","row_id":"8","ref_row_id":"7","display_value":"2026-02-16","ref_display_value":"Andreas Richter","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:19:00+00	2026-02-09 18:19:00+00
019c43a0-80f2-71cd-8d48-1bca84d15c32	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	6	DATA_LINK	\N	\N	\N	{"table_title":"6_TRANSPORTS","ref_table_title":"4_DRIVERS","link_field_title":"Id","link_field_id":"cmiuaf9abst33dy","row_id":"6","ref_row_id":"9","display_value":"2026-02-15","ref_display_value":"Oliver Wagner","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:18:38+00	2026-02-09 18:18:38+00
019c43a0-9e5d-745f-8acd-8d1cc77320b8	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	10	DATA_LINK	\N	\N	\N	{"table_title":"4_DRIVERS","ref_table_title":"6_TRANSPORTS","link_field_title":"Id","link_field_id":"cra65d75swysgg2","row_id":"10","ref_row_id":"7","display_value":"Lukas Schäfer","ref_display_value":"2026-02-11","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:18:45+00	2026-02-09 18:18:45+00
019c43a0-d95e-7088-ac2d-a202f58adedf	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	7	DATA_LINK	\N	\N	\N	{"table_title":"4_DRIVERS","ref_table_title":"6_TRANSPORTS","link_field_title":"Id","link_field_id":"cra65d75swysgg2","row_id":"7","ref_row_id":"8","display_value":"Andreas Richter","ref_display_value":"2026-02-16","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:19:00+00	2026-02-09 18:19:00+00
019c43a0-9e58-76ba-b4fa-b4002b564e84	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	7	DATA_LINK	\N	\N	\N	{"table_title":"6_TRANSPORTS","ref_table_title":"4_DRIVERS","link_field_title":"Id","link_field_id":"cmiuaf9abst33dy","row_id":"7","ref_row_id":"10","display_value":"2026-02-11","ref_display_value":"Lukas Schäfer","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:18:45+00	2026-02-09 18:18:45+00
019c43a2-908f-705d-a762-11b472fcf121	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	3	DATA_LINK	\N	\N	\N	{"table_title":"7_FREIGHTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cydwridzimubwq2","row_id":"3","ref_row_id":"16","display_value":"Müller Logistik GmbH","ref_display_value":"Müller Logistik GmbH","type":"hm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:20:53+00	2026-02-09 18:20:53+00
019c43a2-9099-73f5-9809-ce87f89d3084	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"7_FREIGHTS","link_field_title":"7_FREIGHTS_id","link_field_id":"cs08l1068lwwihh","row_id":"16","ref_row_id":"3","display_value":"Müller Logistik GmbH","ref_display_value":"Müller Logistik GmbH","type":"bt"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:20:53+00	2026-02-09 18:20:53+00
019c43a2-9d6f-732e-9d0c-30759df0f948	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	3	DATA_UNLINK	\N	\N	\N	{"table_title":"7_FREIGHTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cydwridzimubwq2","row_id":3,"ref_row_id":"16","display_value":"Müller Logistik GmbH","ref_display_value":"Müller Logistik GmbH","type":"hm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:20:56+00	2026-02-09 18:20:56+00
019c43a2-9d6f-732e-9d0c-35ce286f396d	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_UNLINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"7_FREIGHTS","link_field_title":"7_FREIGHTS_id","link_field_id":"cs08l1068lwwihh","row_id":"16","ref_row_id":3,"display_value":"Müller Logistik GmbH","ref_display_value":"Müller Logistik GmbH","type":"bt"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:20:56+00	2026-02-09 18:20:56+00
019c43a2-9d81-7705-90dd-409a1c831f45	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	8	DATA_LINK	\N	\N	\N	{"table_title":"7_FREIGHTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cydwridzimubwq2","row_id":"8","ref_row_id":"16","display_value":"Weber Transporte GmbH","ref_display_value":"Müller Logistik GmbH","type":"hm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:20:56+00	2026-02-09 18:20:56+00
019c43a2-9d89-732e-a6a8-d6f929f3385f	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"7_FREIGHTS","link_field_title":"7_FREIGHTS_id","link_field_id":"cs08l1068lwwihh","row_id":"16","ref_row_id":"8","display_value":"Müller Logistik GmbH","ref_display_value":"Weber Transporte GmbH","type":"bt"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:20:56+00	2026-02-09 18:20:56+00
019c43a3-3cc0-758a-a360-16caf12a3321	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"7_FREIGHTS","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"16","ref_row_id":"3","display_value":"Müller Logistik GmbH","ref_display_value":"Müller Logistik GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:21:37+00	2026-02-09 18:21:37+00
019c43a3-3cce-7239-b0ac-20efc2734177	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	3	DATA_LINK	\N	\N	\N	{"table_title":"7_FREIGHTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cydwridzimubwq2","row_id":"3","ref_row_id":"16","display_value":"Müller Logistik GmbH","ref_display_value":"Müller Logistik GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:21:37+00	2026-02-09 18:21:37+00
019c43a3-4c3e-71ed-b525-849d591f40a0	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	17	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"7_FREIGHTS","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"17","ref_row_id":"4","display_value":"Schneider Spedition GmbH & Co. KG","ref_display_value":"Schneider Spedition GmbH & Co. KG","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:21:41+00	2026-02-09 18:21:41+00
019c43a3-4c3f-74f0-b5a4-c5aa99ac13c1	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	4	DATA_LINK	\N	\N	\N	{"table_title":"7_FREIGHTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cydwridzimubwq2","row_id":"4","ref_row_id":"17","display_value":"Schneider Spedition GmbH & Co. KG","ref_display_value":"Schneider Spedition GmbH & Co. KG","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:21:41+00	2026-02-09 18:21:41+00
019c43a3-5bcf-7543-b405-ddbbfdb08634	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	19	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"7_FREIGHTS","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"19","ref_row_id":"5","display_value":"Koch Kühllogistik GmbH","ref_display_value":"Koch Kühllogistik GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:21:45+00	2026-02-09 18:21:45+00
019c43a3-5bd0-771b-b76e-cfbbffd94444	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	5	DATA_LINK	\N	\N	\N	{"table_title":"7_FREIGHTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cydwridzimubwq2","row_id":"5","ref_row_id":"19","display_value":"Koch Kühllogistik GmbH","ref_display_value":"Koch Kühllogistik GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:21:45+00	2026-02-09 18:21:45+00
019c43a3-6ef7-7050-a3b6-f46cc2f16813	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	20	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"7_FREIGHTS","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"20","ref_row_id":"6","display_value":"Braun Chemie Transport AG","ref_display_value":"Braun Chemie Transport AG","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:21:50+00	2026-02-09 18:21:50+00
019c43a3-6ef8-706a-a35f-b02916dccb3b	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	6	DATA_LINK	\N	\N	\N	{"table_title":"7_FREIGHTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cydwridzimubwq2","row_id":"6","ref_row_id":"20","display_value":"Braun Chemie Transport AG","ref_display_value":"Braun Chemie Transport AG","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:21:50+00	2026-02-09 18:21:50+00
019c43a3-7fbf-75aa-8f3c-4131e3c6b723	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	21	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"7_FREIGHTS","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"21","ref_row_id":"7","display_value":"Fischer Automotive Logistics GmbH","ref_display_value":"Fischer Automotive Logistics GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:21:54+00	2026-02-09 18:21:54+00
019c43a3-95cb-755e-9f44-71015082d80c	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"7_FREIGHTS","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"16","ref_row_id":"8","display_value":"Müller Logistik GmbH","ref_display_value":"Weber Transporte GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:22:00+00	2026-02-09 18:22:00+00
019c43a3-a447-764a-bfa2-d55c270d338e	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	8	DATA_UNLINK	\N	\N	\N	{"table_title":"7_FREIGHTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cydwridzimubwq2","row_id":"8","ref_row_id":"16","display_value":"Weber Transporte GmbH","ref_display_value":"Müller Logistik GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:22:03+00	2026-02-09 18:22:03+00
019c43a3-7fc4-763f-b2ec-253b087c06f8	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	7	DATA_LINK	\N	\N	\N	{"table_title":"7_FREIGHTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cydwridzimubwq2","row_id":"7","ref_row_id":"21","display_value":"Fischer Automotive Logistics GmbH","ref_display_value":"Fischer Automotive Logistics GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:21:54+00	2026-02-09 18:21:54+00
019c43a3-8d2a-70c4-86e8-03a642d0fccf	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	8	DATA_LINK	\N	\N	\N	{"table_title":"7_FREIGHTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cydwridzimubwq2","row_id":"8","ref_row_id":"18","display_value":"Weber Transporte GmbH","ref_display_value":"Weber Transporte GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:21:57+00	2026-02-09 18:21:57+00
019c43a3-95ce-73d6-a56d-3a28a6c15a88	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	8	DATA_LINK	\N	\N	\N	{"table_title":"7_FREIGHTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cydwridzimubwq2","row_id":"8","ref_row_id":"16","display_value":"Weber Transporte GmbH","ref_display_value":"Müller Logistik GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:22:00+00	2026-02-09 18:22:00+00
019c43a3-8d39-7619-b484-a1eb002b9f73	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	18	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"7_FREIGHTS","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"18","ref_row_id":"8","display_value":"Weber Transporte GmbH","ref_display_value":"Weber Transporte GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:21:57+00	2026-02-09 18:21:57+00
019c43a3-a444-73a3-8880-c6c73e616dbc	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	16	DATA_UNLINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"7_FREIGHTS","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"16","ref_row_id":"8","display_value":"Müller Logistik GmbH","ref_display_value":"Weber Transporte GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:22:03+00	2026-02-09 18:22:03+00
019c43a4-bfac-706c-922a-2e184eb8e787	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	9	DATA_INSERT	\N	\N	\N	{"data":{"Invoiced":"false"},"column_meta":{"Invoiced":{"id":"c1ao0fait4zsa1t","title":"Invoiced","type":"Checkbox","default_value":"false","options":{"color":"#52DE84","icon":"square"}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:23:16+00	2026-02-09 18:23:16+00
019c43aa-4e0e-775f-86f5-251fc990bc1d	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	3	DATA_LINK	\N	\N	\N	{"table_title":"6_TRANSPORTS","ref_table_title":"7_FREIGHTS","link_field_title":"Id","link_field_id":"cmiuaf9abst33dy","row_id":"3","ref_row_id":"3","display_value":"2026-02-10","ref_display_value":"Müller Logistik GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:29:20+00	2026-02-09 18:29:20+00
019c43aa-4e14-72bf-91f6-0577f0d689f2	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	3	DATA_LINK	\N	\N	\N	{"table_title":"7_FREIGHTS","ref_table_title":"6_TRANSPORTS","link_field_title":"Id","link_field_id":"cydwridzimubwq2","row_id":"3","ref_row_id":"3","display_value":"Müller Logistik GmbH","ref_display_value":"2026-02-10","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:29:20+00	2026-02-09 18:29:20+00
019c43aa-6d86-738c-9686-d7b90dfd5cdb	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	4	DATA_LINK	\N	\N	\N	{"table_title":"6_TRANSPORTS","ref_table_title":"7_FREIGHTS","link_field_title":"Id","link_field_id":"cmiuaf9abst33dy","row_id":"4","ref_row_id":"4","display_value":"2026-02-12","ref_display_value":"Schneider Spedition GmbH & Co. KG","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:29:28+00	2026-02-09 18:29:28+00
019c43aa-6d89-74c1-9960-c74fd0467a67	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	4	DATA_LINK	\N	\N	\N	{"table_title":"7_FREIGHTS","ref_table_title":"6_TRANSPORTS","link_field_title":"Id","link_field_id":"cydwridzimubwq2","row_id":"4","ref_row_id":"4","display_value":"Schneider Spedition GmbH & Co. KG","ref_display_value":"2026-02-12","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:29:28+00	2026-02-09 18:29:28+00
019c43aa-7f9d-76f9-a3b7-225f20c6ebeb	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	5	DATA_LINK	\N	\N	\N	{"table_title":"6_TRANSPORTS","ref_table_title":"7_FREIGHTS","link_field_title":"Id","link_field_id":"cmiuaf9abst33dy","row_id":"5","ref_row_id":"5","display_value":"2026-02-14","ref_display_value":"Koch Kühllogistik GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:29:33+00	2026-02-09 18:29:33+00
019c43aa-7fa0-70b9-a26b-5af38119671e	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	5	DATA_LINK	\N	\N	\N	{"table_title":"7_FREIGHTS","ref_table_title":"6_TRANSPORTS","link_field_title":"Id","link_field_id":"cydwridzimubwq2","row_id":"5","ref_row_id":"5","display_value":"Koch Kühllogistik GmbH","ref_display_value":"2026-02-14","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:29:33+00	2026-02-09 18:29:33+00
019c43aa-8d12-761e-a03d-a6166efba036	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	6	DATA_LINK	\N	\N	\N	{"table_title":"6_TRANSPORTS","ref_table_title":"7_FREIGHTS","link_field_title":"Id","link_field_id":"cmiuaf9abst33dy","row_id":"6","ref_row_id":"6","display_value":"2026-02-15","ref_display_value":"Braun Chemie Transport AG","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:29:36+00	2026-02-09 18:29:36+00
019c43aa-8d19-776f-a874-e1c9f70cf3c4	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	6	DATA_LINK	\N	\N	\N	{"table_title":"7_FREIGHTS","ref_table_title":"6_TRANSPORTS","link_field_title":"Id","link_field_id":"cydwridzimubwq2","row_id":"6","ref_row_id":"6","display_value":"Braun Chemie Transport AG","ref_display_value":"2026-02-15","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:29:36+00	2026-02-09 18:29:36+00
019c43aa-9f1b-717a-95ba-921a241965fb	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	7	DATA_LINK	\N	\N	\N	{"table_title":"6_TRANSPORTS","ref_table_title":"7_FREIGHTS","link_field_title":"Id","link_field_id":"cmiuaf9abst33dy","row_id":"7","ref_row_id":"7","display_value":"2026-02-11","ref_display_value":"Fischer Automotive Logistics GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:29:41+00	2026-02-09 18:29:41+00
019c43aa-9f1e-7691-934e-b3a1e414dfe3	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	7	DATA_LINK	\N	\N	\N	{"table_title":"7_FREIGHTS","ref_table_title":"6_TRANSPORTS","link_field_title":"Id","link_field_id":"cydwridzimubwq2","row_id":"7","ref_row_id":"7","display_value":"Fischer Automotive Logistics GmbH","ref_display_value":"2026-02-11","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:29:41+00	2026-02-09 18:29:41+00
019c43aa-ae9b-77f8-898c-48cbd7a25162	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	8	DATA_LINK	\N	\N	\N	{"table_title":"6_TRANSPORTS","ref_table_title":"7_FREIGHTS","link_field_title":"Id","link_field_id":"cmiuaf9abst33dy","row_id":"8","ref_row_id":"8","display_value":"2026-02-16","ref_display_value":"Weber Transporte GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:29:45+00	2026-02-09 18:29:45+00
019c43aa-ae9d-724b-a813-938c68df2fde	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	8	DATA_LINK	\N	\N	\N	{"table_title":"7_FREIGHTS","ref_table_title":"6_TRANSPORTS","link_field_title":"Id","link_field_id":"cydwridzimubwq2","row_id":"8","ref_row_id":"8","display_value":"Weber Transporte GmbH","ref_display_value":"2026-02-16","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-09 18:29:45+00	2026-02-09 18:29:45+00
019c47ab-97b7-75f8-ae55-779eeb28d1f6	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	3	DATA_UPDATE	\N	\N	\N	{"old_data":{"Transport Capacity %":null},"data":{"Transport Capacity %":50},"column_meta":{"Transport Capacity %":{"id":"cvwuynxzwp0ukig","title":"Transport Capacity %","type":"Percent","options":{"precision":2,"is_progress":false}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:09:13+00	2026-02-10 13:09:13+00
019c47ab-9dde-70d0-8674-e835588523f5	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	4	DATA_UPDATE	\N	\N	\N	{"old_data":{"Transport Capacity %":null},"data":{"Transport Capacity %":40},"column_meta":{"Transport Capacity %":{"id":"cvwuynxzwp0ukig","title":"Transport Capacity %","type":"Percent","options":{"precision":2,"is_progress":false}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:09:15+00	2026-02-10 13:09:15+00
019c47ab-a4a3-705e-802d-edd367acc8ad	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	5	DATA_UPDATE	\N	\N	\N	{"old_data":{"Transport Capacity %":null},"data":{"Transport Capacity %":75},"column_meta":{"Transport Capacity %":{"id":"cvwuynxzwp0ukig","title":"Transport Capacity %","type":"Percent","options":{"precision":2,"is_progress":false}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:09:17+00	2026-02-10 13:09:17+00
019c47ab-aba2-73a2-8096-dd4c09dfe56f	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	6	DATA_UPDATE	\N	\N	\N	{"old_data":{"Transport Capacity %":null},"data":{"Transport Capacity %":6},"column_meta":{"Transport Capacity %":{"id":"cvwuynxzwp0ukig","title":"Transport Capacity %","type":"Percent","options":{"precision":2,"is_progress":false}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:09:18+00	2026-02-10 13:09:18+00
019c47ab-ba64-7224-bbc1-3aa72a50e8cb	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	6	DATA_UPDATE	\N	\N	\N	{"old_data":{"Transport Capacity %":6},"data":{"Transport Capacity %":80},"column_meta":{"Transport Capacity %":{"id":"cvwuynxzwp0ukig","title":"Transport Capacity %","type":"Percent","options":{"precision":2,"is_progress":false}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:09:22+00	2026-02-10 13:09:22+00
019c47ab-bf00-7513-abba-ae3d776d20a7	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	7	DATA_UPDATE	\N	\N	\N	{"old_data":{"Transport Capacity %":null},"data":{"Transport Capacity %":100},"column_meta":{"Transport Capacity %":{"id":"cvwuynxzwp0ukig","title":"Transport Capacity %","type":"Percent","options":{"precision":2,"is_progress":false}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:09:23+00	2026-02-10 13:09:23+00
019c47ab-c1c7-703c-b1a4-bbafc3de1529	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	8	DATA_UPDATE	\N	\N	\N	{"old_data":{"Transport Capacity %":null},"data":{"Transport Capacity %":100},"column_meta":{"Transport Capacity %":{"id":"cvwuynxzwp0ukig","title":"Transport Capacity %","type":"Percent","options":{"precision":2,"is_progress":false}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:09:24+00	2026-02-10 13:09:24+00
019c47ad-77bf-743f-84bc-8d808fa1fce1	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	7	DATA_UPDATE	\N	\N	\N	{"old_data":{"Invoiced":false},"data":{"Invoiced":true},"column_meta":{"Invoiced":{"id":"c1ao0fait4zsa1t","title":"Invoiced","type":"Checkbox","default_value":"false","options":{"color":"#52DE84","icon":"square"}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:11:16+00	2026-02-10 13:11:16+00
019c47ad-7996-714a-a425-6638783d5c77	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	8	DATA_UPDATE	\N	\N	\N	{"old_data":{"Invoiced":false},"data":{"Invoiced":true},"column_meta":{"Invoiced":{"id":"c1ao0fait4zsa1t","title":"Invoiced","type":"Checkbox","default_value":"false","options":{"color":"#52DE84","icon":"square"}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:11:17+00	2026-02-10 13:11:17+00
019c47ad-a39b-73bf-9e1f-a5851825ccb7	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	7	DATA_UPDATE	\N	\N	\N	{"old_data":{"Invoiced":true},"data":{"Invoiced":false},"column_meta":{"Invoiced":{"id":"c1ao0fait4zsa1t","title":"Invoiced","type":"Checkbox","default_value":"false","options":{"color":"#52DE84","icon":"square"}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:11:27+00	2026-02-10 13:11:27+00
019c47ad-a4d7-7186-926b-e7bd904c7a0c	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	8	DATA_UPDATE	\N	\N	\N	{"old_data":{"Invoiced":true},"data":{"Invoiced":false},"column_meta":{"Invoiced":{"id":"c1ao0fait4zsa1t","title":"Invoiced","type":"Checkbox","default_value":"false","options":{"color":"#52DE84","icon":"square"}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:11:28+00	2026-02-10 13:11:28+00
019c47ae-20c8-704b-9ebb-e2f33b803953	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	9	DATA_INSERT	\N	\N	\N	{"data":{},"column_meta":{},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:11:59+00	2026-02-10 13:11:59+00
019c47ae-45b1-756e-92b4-1febdcb7ba06	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	9	DATA_DELETE	\N	\N	\N	{"data":{"3_VEHICLEs":0,"4_DRIVERs":0,"7_FREIGHTs":0,"Id":9},"column_meta":{"Departure Date":{"id":"ckfllneskfstzzf","title":"Departure Date","type":"Date","options":{"date_format":"YYYY-MM-DD"}},"Origin":{"id":"c77cudldn2ldi4z","title":"Origin","type":"SingleLineText","options":{}},"Destination":{"id":"ct1zt0dav2juhz2","title":"Destination","type":"SingleLineText","options":{}},"Status":{"id":"cmy7ib7lxogr0wy","title":"Status","type":"SingleSelect","options":{"default_view_col_visibility":true,"choices":[]}},"Notes":{"id":"chtfkfr68ef5chk","title":"Notes","type":"LongText","options":{}},"3_VEHICLEs":{"id":"cb9zfb6cmyk3nb3","title":"3_VEHICLEs","type":"Links","options":{"relation_type":"mm","linked_table_id":"m0nr5nzv9kw4ap2","rollup_function":"count"}},"4_DRIVERs":{"id":"cd03nr1ew2nvc55","title":"4_DRIVERs","type":"Links","options":{"relation_type":"mm","linked_table_id":"milkom888hl5xrj","rollup_function":"count"}},"7_FREIGHTs":{"id":"cfjdmoaypas3ot4","title":"7_FREIGHTs","type":"Links","options":{"relation_type":"mm","linked_table_id":"mizgezntumu0w42","rollup_function":"count"}},"Transport Capacity %":{"id":"cvwuynxzwp0ukig","title":"Transport Capacity %","type":"Percent","options":{"precision":2,"is_progress":false}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:12:09+00	2026-02-10 13:12:09+00
019c47b1-a4c7-71b9-ba6e-9d021b911461	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	9	DATA_DELETE	\N	\N	\N	{"data":{"1_CLIENTs":0,"6_TRANSPORTs":0,"Id":9,"Invoiced":false},"column_meta":{"Client":{"id":"c2l6l8py4xjuu7j","title":"Client","type":"SingleLineText","options":{}},"Unit Type":{"id":"ciizexx8gnmmh8u","title":"Unit Type","type":"SingleSelect","options":{"choices":[]}},"Quantity":{"id":"c0c98b5g14umg7j","title":"Quantity","type":"Number","options":{"locale_string":false}},"Cargo Description":{"id":"cz4rzid030j5ukx","title":"Cargo Description","type":"SingleLineText","options":{"default_view_col_visibility":true}},"Pickup Address":{"id":"c4fz8qjifateuuv","title":"Pickup Address","type":"LongText","options":{}},"Delivery Address":{"id":"c6h4pr6nf24v55t","title":"Delivery Address","type":"LongText","options":{}},"Freight Price EUR":{"id":"cwmv5m3yjc4vjgd","title":"Freight Price EUR","type":"Currency","options":{"currency_locale":"de","currency_code":"EUR","precision":2}},"Invoiced":{"id":"c1ao0fait4zsa1t","title":"Invoiced","type":"Checkbox","default_value":"false","options":{"color":"#52DE84","icon":"square"}},"Invoice Number":{"id":"cvk3wq35dagvfah","title":"Invoice Number","type":"SingleLineText","options":{"default_view_col_visibility":true}},"Notes":{"id":"cve6so9t8q8g5en","title":"Notes","type":"LongText","options":{}},"1_CLIENTs":{"id":"cmkzvu89sq1tqwe","title":"1_CLIENTs","type":"Links","options":{"relation_type":"mm","linked_table_id":"mleo2f440ply95o","rollup_function":"count"}},"6_TRANSPORTs":{"id":"cbwarj2unek0fx7","title":"6_TRANSPORTs","type":"Links","options":{"relation_type":"mm","linked_table_id":"mko9nvxci0pz4dd","rollup_function":"count"}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:15:50+00	2026-02-10 13:15:50+00
019c47be-84fb-7379-8608-f804da3aad21	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	10	DATA_LINK	\N	\N	\N	{"table_title":"7_FREIGHTS","ref_table_title":"1_CLIENTS","link_field_title":"1_CLIENTs","link_field_id":"cmkzvu89sq1tqwe","row_id":10,"ref_row_id":21,"display_value":"Example_XYZ","ref_display_value":"Fischer Automotive Logistics GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:29:54+00	2026-02-10 13:29:54+00
019c47be-8502-7164-bd11-f6b5400c37c3	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	21	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"7_FREIGHTS","link_field_title":"7_FREIGHTs","link_field_id":"c66j0cxivg3e6zi","row_id":21,"ref_row_id":10,"display_value":"Fischer Automotive Logistics GmbH","ref_display_value":"Example_XYZ","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:29:54+00	2026-02-10 13:29:54+00
019c47be-8530-7777-9a4b-5c016f57e4eb	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	10	DATA_INSERT	\N	\N	\N	{"data":{"Client":"Example_XYZ","Unit Type":"ADR","Quantity":55,"Freight Price EUR":980,"Invoiced":false},"column_meta":{"Client":{"id":"c2l6l8py4xjuu7j","title":"Client","type":"SingleLineText","options":{}},"Unit Type":{"id":"ciizexx8gnmmh8u","title":"Unit Type","type":"SingleSelect","options":{"choices":[{"title":"ADR","color":"#cfdffe","id":"suemy9dbvkvtqwj"}]}},"Quantity":{"id":"c0c98b5g14umg7j","title":"Quantity","type":"Number","options":{"locale_string":false}},"Freight Price EUR":{"id":"cwmv5m3yjc4vjgd","title":"Freight Price EUR","type":"Currency","options":{"currency_locale":"de","currency_code":"EUR","precision":2}},"Invoiced":{"id":"c1ao0fait4zsa1t","title":"Invoiced","type":"Checkbox","default_value":"false","options":{"color":"#52DE84","icon":"square"}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:29:54+00	2026-02-10 13:29:54+00
019c47bf-849a-753e-a1d8-cfe4cd9ae293	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	10	DATA_UPDATE	\N	\N	\N	{"old_data":{"Cargo Description":null},"data":{"Cargo Description":"Maschinenteile - Komplettladung"},"column_meta":{"Cargo Description":{"id":"cz4rzid030j5ukx","title":"Cargo Description","type":"SingleLineText","options":{"default_view_col_visibility":true}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:30:59+00	2026-02-10 13:30:59+00
019c47bf-be69-714e-bac8-fc65e5a30642	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	11	DATA_INSERT	\N	\N	\N	{"data":{"Invoiced":"false"},"column_meta":{"Invoiced":{"id":"c1ao0fait4zsa1t","title":"Invoiced","type":"Checkbox","default_value":"false","options":{"color":"#52DE84","icon":"square"}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:31:14+00	2026-02-10 13:31:14+00
019c47bf-fd97-721e-8fa8-992f8f2291c0	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	10	DATA_UPDATE	\N	\N	\N	{"old_data":{"Pickup Address":null},"data":{"Pickup Address":"Am Containerhafen 3, 28195 Bremen"},"column_meta":{"Pickup Address":{"id":"c4fz8qjifateuuv","title":"Pickup Address","type":"LongText","options":{}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:31:30+00	2026-02-10 13:31:30+00
019c47c0-2c65-7133-89b3-2d8df7a45d1a	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	12	DATA_INSERT	\N	\N	\N	{"data":{"Invoiced":"false"},"column_meta":{"Invoiced":{"id":"c1ao0fait4zsa1t","title":"Invoiced","type":"Checkbox","default_value":"false","options":{"color":"#52DE84","icon":"square"}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:31:42+00	2026-02-10 13:31:42+00
019c47c0-5edd-758a-a820-dc3256c7bb25	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	\N	DATA_BULK_DELETE	\N	\N	\N	{"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:31:55+00	2026-02-10 13:31:55+00
019c47c0-5edf-74d6-9ae5-e3fcfcb0f6a2	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	11	DATA_DELETE	\N	\N	\N	{"data":{"Invoiced":false},"column_meta":{"Client":{"id":"c2l6l8py4xjuu7j","title":"Client","type":"SingleLineText","options":{}},"Unit Type":{"id":"ciizexx8gnmmh8u","title":"Unit Type","type":"SingleSelect","options":{"choices":[{"title":"ADR","color":"#cfdffe","id":"suemy9dbvkvtqwj"},{"title":"Other","color":"#d0f1fd","id":"su3v2tc5xgsgwg6"},{"title":"Pallet","color":"#c2f5e8","id":"s8z8yhl88vr2o0v"},{"title":"Box","color":"#ffdaf6","id":"ss1fub5cia5fv3w"}]}},"Quantity":{"id":"c0c98b5g14umg7j","title":"Quantity","type":"Number","options":{"locale_string":false}},"Cargo Description":{"id":"cz4rzid030j5ukx","title":"Cargo Description","type":"SingleLineText","options":{"default_view_col_visibility":true}},"Pickup Address":{"id":"c4fz8qjifateuuv","title":"Pickup Address","type":"LongText","options":{}},"Delivery Address":{"id":"c6h4pr6nf24v55t","title":"Delivery Address","type":"LongText","options":{}},"Freight Price EUR":{"id":"cwmv5m3yjc4vjgd","title":"Freight Price EUR","type":"Currency","options":{"currency_locale":"de","currency_code":"EUR","precision":2}},"Invoiced":{"id":"c1ao0fait4zsa1t","title":"Invoiced","type":"Checkbox","default_value":"false","options":{"color":"#52DE84","icon":"square"}},"Invoice Number":{"id":"cvk3wq35dagvfah","title":"Invoice Number","type":"SingleLineText","options":{"default_view_col_visibility":true}},"Notes":{"id":"cve6so9t8q8g5en","title":"Notes","type":"LongText","options":{}},"1_CLIENTs":{"id":"cmkzvu89sq1tqwe","title":"1_CLIENTs","type":"Links","options":{"relation_type":"mm","linked_table_id":"mleo2f440ply95o","rollup_function":"count"}},"Company Name (from 1_CLIENTS)":{"id":"cmuad2sogee58l5","title":"Company Name (from 1_CLIENTS)","type":"Lookup","options":{"link_field_id":"cmkzvu89sq1tqwe","linked_table_lookup_field_id":"ctit2jdxf8xi0y6"}},"6_TRANSPORTs":{"id":"cbwarj2unek0fx7","title":"6_TRANSPORTs","type":"Links","options":{"relation_type":"mm","linked_table_id":"mko9nvxci0pz4dd","rollup_function":"count"}},"Departure Date (from 6_TRANSPORTS)":{"id":"cqa5y3yzcdt5ltr","title":"Departure Date (from 6_TRANSPORTS)","type":"Lookup","options":{"link_field_id":"cbwarj2unek0fx7","linked_table_lookup_field_id":"ckfllneskfstzzf"}},"Origin (from 6_TRANSPORTS)":{"id":"c6zmah4nvr48ngd","title":"Origin (from 6_TRANSPORTS)","type":"Lookup","options":{"link_field_id":"cbwarj2unek0fx7","linked_table_lookup_field_id":"c77cudldn2ldi4z"}},"Destination (from 6_TRANSPORTS)":{"id":"c3305onaea54zoz","title":"Destination (from 6_TRANSPORTS)","type":"Lookup","options":{"link_field_id":"cbwarj2unek0fx7","linked_table_lookup_field_id":"ct1zt0dav2juhz2"}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	019c47c0-5edd-758a-a820-da5ea0ddb9cb	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:31:55+00	2026-02-10 13:31:55+00
019c47c0-5edf-74d6-9ae5-e7c14ace449d	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	12	DATA_DELETE	\N	\N	\N	{"data":{"Invoiced":false},"column_meta":{"Client":{"id":"c2l6l8py4xjuu7j","title":"Client","type":"SingleLineText","options":{}},"Unit Type":{"id":"ciizexx8gnmmh8u","title":"Unit Type","type":"SingleSelect","options":{"choices":[{"title":"ADR","color":"#cfdffe","id":"suemy9dbvkvtqwj"},{"title":"Other","color":"#d0f1fd","id":"su3v2tc5xgsgwg6"},{"title":"Pallet","color":"#c2f5e8","id":"s8z8yhl88vr2o0v"},{"title":"Box","color":"#ffdaf6","id":"ss1fub5cia5fv3w"}]}},"Quantity":{"id":"c0c98b5g14umg7j","title":"Quantity","type":"Number","options":{"locale_string":false}},"Cargo Description":{"id":"cz4rzid030j5ukx","title":"Cargo Description","type":"SingleLineText","options":{"default_view_col_visibility":true}},"Pickup Address":{"id":"c4fz8qjifateuuv","title":"Pickup Address","type":"LongText","options":{}},"Delivery Address":{"id":"c6h4pr6nf24v55t","title":"Delivery Address","type":"LongText","options":{}},"Freight Price EUR":{"id":"cwmv5m3yjc4vjgd","title":"Freight Price EUR","type":"Currency","options":{"currency_locale":"de","currency_code":"EUR","precision":2}},"Invoiced":{"id":"c1ao0fait4zsa1t","title":"Invoiced","type":"Checkbox","default_value":"false","options":{"color":"#52DE84","icon":"square"}},"Invoice Number":{"id":"cvk3wq35dagvfah","title":"Invoice Number","type":"SingleLineText","options":{"default_view_col_visibility":true}},"Notes":{"id":"cve6so9t8q8g5en","title":"Notes","type":"LongText","options":{}},"1_CLIENTs":{"id":"cmkzvu89sq1tqwe","title":"1_CLIENTs","type":"Links","options":{"relation_type":"mm","linked_table_id":"mleo2f440ply95o","rollup_function":"count"}},"Company Name (from 1_CLIENTS)":{"id":"cmuad2sogee58l5","title":"Company Name (from 1_CLIENTS)","type":"Lookup","options":{"link_field_id":"cmkzvu89sq1tqwe","linked_table_lookup_field_id":"ctit2jdxf8xi0y6"}},"6_TRANSPORTs":{"id":"cbwarj2unek0fx7","title":"6_TRANSPORTs","type":"Links","options":{"relation_type":"mm","linked_table_id":"mko9nvxci0pz4dd","rollup_function":"count"}},"Departure Date (from 6_TRANSPORTS)":{"id":"cqa5y3yzcdt5ltr","title":"Departure Date (from 6_TRANSPORTS)","type":"Lookup","options":{"link_field_id":"cbwarj2unek0fx7","linked_table_lookup_field_id":"ckfllneskfstzzf"}},"Origin (from 6_TRANSPORTS)":{"id":"c6zmah4nvr48ngd","title":"Origin (from 6_TRANSPORTS)","type":"Lookup","options":{"link_field_id":"cbwarj2unek0fx7","linked_table_lookup_field_id":"c77cudldn2ldi4z"}},"Destination (from 6_TRANSPORTS)":{"id":"c3305onaea54zoz","title":"Destination (from 6_TRANSPORTS)","type":"Lookup","options":{"link_field_id":"cbwarj2unek0fx7","linked_table_lookup_field_id":"ct1zt0dav2juhz2"}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	019c47c0-5edd-758a-a820-da5ea0ddb9cb	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:31:55+00	2026-02-10 13:31:55+00
019c47c0-f855-7135-8816-e4eb4b11440f	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	13	DATA_INSERT	\N	\N	\N	{"data":{"Invoiced":"false"},"column_meta":{"Invoiced":{"id":"c1ao0fait4zsa1t","title":"Invoiced","type":"Checkbox","default_value":"false","options":{"color":"#52DE84","icon":"square"}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:32:34+00	2026-02-10 13:32:34+00
019c47c0-af5b-76db-b6ad-07187be6593b	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	10	DATA_UPDATE	\N	\N	\N	{"old_data":{"Delivery Address":null},"data":{"Delivery Address":"Am Containerhafen 3, 28195 Bremen"},"column_meta":{"Delivery Address":{"id":"c6h4pr6nf24v55t","title":"Delivery Address","type":"LongText","options":{}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:32:16+00	2026-02-10 13:32:16+00
019c47c0-bd07-7299-9c47-be02163b6994	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	10	DATA_UPDATE	\N	\N	\N	{"old_data":{"Pickup Address":"Am Containerhafen 3, 28195 Bremen"},"data":{"Pickup Address":"Am Containerhafen 3, 28195 BremenMaschinenteile - Komplettladung"},"column_meta":{"Pickup Address":{"id":"c4fz8qjifateuuv","title":"Pickup Address","type":"LongText","options":{}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:32:19+00	2026-02-10 13:32:19+00
019c47c0-c073-761e-97c7-cca1829cd7b3	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	10	DATA_UPDATE	\N	\N	\N	{"old_data":{"Pickup Address":"Am Containerhafen 3, 28195 BremenMaschinenteile - Komplettladung"},"data":{"Pickup Address":"Maschinenteile - Komplettladung"},"column_meta":{"Pickup Address":{"id":"c4fz8qjifateuuv","title":"Pickup Address","type":"LongText","options":{}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:32:20+00	2026-02-10 13:32:20+00
019c47c0-d913-721a-8406-4ef1acfe94c2	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	10	DATA_UPDATE	\N	\N	\N	{"old_data":{"Cargo Description":"Maschinenteile - Komplettladung"},"data":{"Cargo Description":""},"column_meta":{"Cargo Description":{"id":"cz4rzid030j5ukx","title":"Cargo Description","type":"SingleLineText","options":{"default_view_col_visibility":true}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:32:26+00	2026-02-10 13:32:26+00
019c47c0-e2ab-7018-be31-e3081aecd49b	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	10	DATA_UPDATE	\N	\N	\N	{"old_data":{"Cargo Description":""},"data":{"Cargo Description":"Example"},"column_meta":{"Cargo Description":{"id":"cz4rzid030j5ukx","title":"Cargo Description","type":"SingleLineText","options":{"default_view_col_visibility":true}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:32:29+00	2026-02-10 13:32:29+00
019c47c0-e9ea-71c2-8841-a52bef001c72	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	10	DATA_UPDATE	\N	\N	\N	{"old_data":{"Cargo Description":"Example"},"data":{"Cargo Description":"Example_"},"column_meta":{"Cargo Description":{"id":"cz4rzid030j5ukx","title":"Cargo Description","type":"SingleLineText","options":{"default_view_col_visibility":true}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:32:31+00	2026-02-10 13:32:31+00
019c47c0-eed6-739a-87da-d96f97d777e0	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	10	DATA_UPDATE	\N	\N	\N	{"old_data":{"Cargo Description":"Example_"},"data":{"Cargo Description":"Example_XYZ"},"column_meta":{"Cargo Description":{"id":"cz4rzid030j5ukx","title":"Cargo Description","type":"SingleLineText","options":{"default_view_col_visibility":true}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:32:32+00	2026-02-10 13:32:32+00
019c47c2-a70c-716f-a85b-9e79e1c20008	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	10	DATA_LINK	\N	\N	\N	{"table_title":"6_TRANSPORTS","ref_table_title":"3_VEHICLES","link_field_title":"3_VEHICLEs","link_field_id":"cb9zfb6cmyk3nb3","row_id":10,"ref_row_id":9,"display_value":"2026-02-24","ref_display_value":"D-BC 5090","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:34:25+00	2026-02-10 13:34:25+00
019c47c2-a714-77e7-b4a7-e4b13a10bb3d	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	9	DATA_LINK	\N	\N	\N	{"table_title":"3_VEHICLES","ref_table_title":"6_TRANSPORTS","link_field_title":"6_TRANSPORTs","link_field_id":"c940zopwks20w59","row_id":9,"ref_row_id":10,"display_value":"D-BC 5090","ref_display_value":"2026-02-24","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:34:25+00	2026-02-10 13:34:25+00
019c47c2-a721-719a-bdef-51f94bd1a057	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	10	DATA_LINK	\N	\N	\N	{"table_title":"6_TRANSPORTS","ref_table_title":"4_DRIVERS","link_field_title":"4_DRIVERs","link_field_id":"cd03nr1ew2nvc55","row_id":10,"ref_row_id":6,"display_value":"2026-02-24","ref_display_value":"Michael Becker","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:34:25+00	2026-02-10 13:34:25+00
019c47c2-a727-770d-a07b-01692720f13f	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	6	DATA_LINK	\N	\N	\N	{"table_title":"4_DRIVERS","ref_table_title":"6_TRANSPORTS","link_field_title":"6_TRANSPORTs","link_field_id":"c3qx3qpy29mmgoj","row_id":6,"ref_row_id":10,"display_value":"Michael Becker","ref_display_value":"2026-02-24","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:34:25+00	2026-02-10 13:34:25+00
019c47c2-a736-752f-86fd-e8183d062218	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	10	DATA_LINK	\N	\N	\N	{"table_title":"6_TRANSPORTS","ref_table_title":"7_FREIGHTS","link_field_title":"7_FREIGHTs","link_field_id":"cfjdmoaypas3ot4","row_id":10,"ref_row_id":10,"display_value":"2026-02-24","ref_display_value":"Example_XYZ","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:34:25+00	2026-02-10 13:34:25+00
019c47c2-a73c-762f-a383-da59f0a25632	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	10	DATA_LINK	\N	\N	\N	{"table_title":"7_FREIGHTS","ref_table_title":"6_TRANSPORTS","link_field_title":"6_TRANSPORTs","link_field_id":"cbwarj2unek0fx7","row_id":10,"ref_row_id":10,"display_value":"Example_XYZ","ref_display_value":"2026-02-24","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:34:25+00	2026-02-10 13:34:25+00
019c47ca-3dd0-766c-bfcf-3a397b898be8	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	22	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"7_FREIGHTS","link_field_title":"7_FREIGHTs","link_field_id":"c66j0cxivg3e6zi","row_id":22,"ref_row_id":10,"display_value":"Example_Company","ref_display_value":"Example_XYZ","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:42:42+00	2026-02-10 13:42:42+00
019c47c2-a762-72dc-ad27-3c1aa648d9d4	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	10	DATA_INSERT	\N	\N	\N	{"data":{"Departure Date":"2026-02-24","Origin":"Munchen","Destination":"Hamburg","Status":"Planned","Transport Capacity %":55},"column_meta":{"Departure Date":{"id":"ckfllneskfstzzf","title":"Departure Date","type":"Date","options":{"date_format":"YYYY-MM-DD"}},"Origin":{"id":"c77cudldn2ldi4z","title":"Origin","type":"SingleLineText","options":{}},"Destination":{"id":"ct1zt0dav2juhz2","title":"Destination","type":"SingleLineText","options":{}},"Status":{"id":"cmy7ib7lxogr0wy","title":"Status","type":"SingleSelect","options":{"default_view_col_visibility":true,"choices":[{"title":"Planned","color":"#cfdffe","id":"s5b2waie6k39mrr"}]}},"Transport Capacity %":{"id":"cvwuynxzwp0ukig","title":"Transport Capacity %","type":"Percent","options":{"precision":2,"is_progress":false}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:34:25+00	2026-02-10 13:34:25+00
019c47c6-0556-778a-9d9f-f60f355902df	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	11	DATA_INSERT	\N	\N	\N	{"data":{},"column_meta":{},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:38:05+00	2026-02-10 13:38:05+00
019c47c6-1198-74be-ae67-6f5f9b2f5be2	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	11	DATA_UPDATE	\N	\N	\N	{"old_data":{"Departure Date":null},"data":{"Departure Date":"2026-02-09"},"column_meta":{"Departure Date":{"id":"ckfllneskfstzzf","title":"Departure Date","type":"Date","options":{"date_format":"YYYY-MM-DD"}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:38:08+00	2026-02-10 13:38:08+00
019c47c6-2865-778a-8b9f-8bbfea3d467f	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	11	DATA_UPDATE	\N	\N	\N	{"old_data":{"Origin":null},"data":{"Origin":"ABC"},"column_meta":{"Origin":{"id":"c77cudldn2ldi4z","title":"Origin","type":"SingleLineText","options":{}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:38:14+00	2026-02-10 13:38:14+00
019c47c6-36a4-73fe-91ea-d886fae612a3	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	11	DATA_UPDATE	\N	\N	\N	{"old_data":{"Destination":null},"data":{"Destination":"CBA"},"column_meta":{"Destination":{"id":"ct1zt0dav2juhz2","title":"Destination","type":"SingleLineText","options":{}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:38:18+00	2026-02-10 13:38:18+00
019c47c6-511c-72fe-87d5-4aedffb7f4b3	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	11	DATA_LINK	\N	\N	\N	{"table_title":"6_TRANSPORTS","ref_table_title":"3_VEHICLES","link_field_title":"Id","link_field_id":"cmiuaf9abst33dy","row_id":"11","ref_row_id":"10","display_value":"2026-02-09","ref_display_value":"S-FA 6012","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:38:25+00	2026-02-10 13:38:25+00
019c47c6-5120-74f9-92c0-f154c4da85a2	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	10	DATA_LINK	\N	\N	\N	{"table_title":"3_VEHICLES","ref_table_title":"6_TRANSPORTS","link_field_title":"Id","link_field_id":"chs7p910b3q6yqm","row_id":"10","ref_row_id":"11","display_value":"S-FA 6012","ref_display_value":"2026-02-09","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:38:25+00	2026-02-10 13:38:25+00
019c47c6-6796-736b-9f50-26b934a4c158	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	6	DATA_LINK	\N	\N	\N	{"table_title":"4_DRIVERS","ref_table_title":"6_TRANSPORTS","link_field_title":"Id","link_field_id":"cra65d75swysgg2","row_id":"6","ref_row_id":"11","display_value":"Michael Becker","ref_display_value":"2026-02-09","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:38:30+00	2026-02-10 13:38:30+00
019c47c6-67a0-756a-97ee-a7785244facd	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	11	DATA_LINK	\N	\N	\N	{"table_title":"6_TRANSPORTS","ref_table_title":"4_DRIVERS","link_field_title":"Id","link_field_id":"cmiuaf9abst33dy","row_id":"11","ref_row_id":"6","display_value":"2026-02-09","ref_display_value":"Michael Becker","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:38:30+00	2026-02-10 13:38:30+00
019c47c6-9184-71c0-b64e-9cd5c954adc3	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	11	DATA_UPDATE	\N	\N	\N	{"old_data":{"Transport Capacity %":null},"data":{"Transport Capacity %":30},"column_meta":{"Transport Capacity %":{"id":"cvwuynxzwp0ukig","title":"Transport Capacity %","type":"Percent","options":{"precision":2,"is_progress":false}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:38:41+00	2026-02-10 13:38:41+00
019c47c6-9d29-7728-8bbe-5f02e9a508a9	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	11	DATA_UPDATE	\N	\N	\N	{"old_data":{"Status":null},"data":{"Status":"Planned"},"column_meta":{"Status":{"id":"cmy7ib7lxogr0wy","title":"Status","type":"SingleSelect","options":{"default_view_col_visibility":true,"choices":[{"title":"Planned","color":"#cfdffe","id":"s5b2waie6k39mrr"}]}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:38:44+00	2026-02-10 13:38:44+00
019c47c9-c9be-76b3-a9b8-7388d81878b2	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	13	DATA_INSERT	\N	\N	\N	{"data":{"Full Name":"beispiel name","Position":"none","Email":"beispiel@gmail.com","Phone":"49123456789"},"column_meta":{"Full Name":{"id":"c2nbpggrn6owwf0","title":"Full Name","type":"SingleLineText","options":{}},"Position":{"id":"c6xwf0zvnc0i1wv","title":"Position","type":"SingleLineText","options":{}},"Email":{"id":"czjl2l2p4tdngdk","title":"Email","type":"Email","options":{}},"Phone":{"id":"cagos3j9ylye6h0","title":"Phone","type":"PhoneNumber","options":{}}},"table_title":"2_CONTACTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:42:12+00	2026-02-10 13:42:12+00
019c47ca-3dbd-74f5-93b4-4cdbff068da9	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	22	DATA_LINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"2_CONTACTS","link_field_title":"2_CONTACTs","link_field_id":"cu0bwr7p9nxapn0","row_id":22,"ref_row_id":13,"display_value":"Example_Company","ref_display_value":"beispiel name","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:42:42+00	2026-02-10 13:42:42+00
019c47ca-3dc1-726b-968f-28a8c5ce142e	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	13	DATA_LINK	\N	\N	\N	{"table_title":"2_CONTACTS","ref_table_title":"1_CLIENTS","link_field_title":"1_CLIENTs 1","link_field_id":"c05e11ftou4idmo","row_id":13,"ref_row_id":22,"display_value":"beispiel name","ref_display_value":"Example_Company","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:42:42+00	2026-02-10 13:42:42+00
019c47ca-3dd7-766b-ae77-71fe936212a3	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	10	DATA_LINK	\N	\N	\N	{"table_title":"7_FREIGHTS","ref_table_title":"1_CLIENTS","link_field_title":"1_CLIENTs","link_field_id":"cmkzvu89sq1tqwe","row_id":10,"ref_row_id":22,"display_value":"Example_XYZ","ref_display_value":"Example_Company","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:42:42+00	2026-02-10 13:42:42+00
019c47ca-3df4-7269-9c6e-3498a1fe171f	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	22	DATA_INSERT	\N	\N	\N	{"data":{"Company Name":"Example_Company","VAT ID":"DE123456789","Address":"beispielStrasse","Email":"beispiel@gmail.com","Phone":"49 123456789"},"column_meta":{"Company Name":{"id":"ctit2jdxf8xi0y6","title":"Company Name","type":"SingleLineText","options":{}},"VAT ID":{"id":"cyf95ycuc1dir5x","title":"VAT ID","type":"SingleLineText","options":{}},"Address":{"id":"chttsusxo5xpqq6","title":"Address","type":"SingleLineText","options":{}},"Email":{"id":"c34quk1et4y5pcz","title":"Email","type":"Email","options":{}},"Phone":{"id":"ccdtc2e1rudxdyi","title":"Phone","type":"PhoneNumber","options":{}}},"table_title":"1_CLIENTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:42:42+00	2026-02-10 13:42:42+00
019c47ca-eb74-7399-97b3-36e7ad7caf34	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	13	DATA_DELETE	\N	\N	\N	{"data":{"1_CLIENTs":0,"6_TRANSPORTs":0,"Id":13,"Invoiced":false},"column_meta":{"Client":{"id":"c2l6l8py4xjuu7j","title":"Client","type":"SingleLineText","options":{}},"Unit Type":{"id":"ciizexx8gnmmh8u","title":"Unit Type","type":"SingleSelect","options":{"choices":[]}},"Quantity":{"id":"c0c98b5g14umg7j","title":"Quantity","type":"Number","options":{"locale_string":false}},"Cargo Description":{"id":"cz4rzid030j5ukx","title":"Cargo Description","type":"SingleLineText","options":{"default_view_col_visibility":true}},"Pickup Address":{"id":"c4fz8qjifateuuv","title":"Pickup Address","type":"LongText","options":{}},"Delivery Address":{"id":"c6h4pr6nf24v55t","title":"Delivery Address","type":"LongText","options":{}},"Freight Price EUR":{"id":"cwmv5m3yjc4vjgd","title":"Freight Price EUR","type":"Currency","options":{"currency_locale":"de","currency_code":"EUR","precision":2}},"Invoiced":{"id":"c1ao0fait4zsa1t","title":"Invoiced","type":"Checkbox","default_value":"false","options":{"color":"#52DE84","icon":"square"}},"Invoice Number":{"id":"cvk3wq35dagvfah","title":"Invoice Number","type":"SingleLineText","options":{"default_view_col_visibility":true}},"Notes":{"id":"cve6so9t8q8g5en","title":"Notes","type":"LongText","options":{}},"1_CLIENTs":{"id":"cmkzvu89sq1tqwe","title":"1_CLIENTs","type":"Links","options":{"relation_type":"mm","linked_table_id":"mleo2f440ply95o","rollup_function":"count"}},"6_TRANSPORTs":{"id":"cbwarj2unek0fx7","title":"6_TRANSPORTs","type":"Links","options":{"relation_type":"mm","linked_table_id":"mko9nvxci0pz4dd","rollup_function":"count"}}},"table_title":"7_FREIGHTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:43:26+00	2026-02-10 13:43:26+00
019c47cb-1266-777f-8d10-7f0fdcaf8a5a	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	21	DATA_UNLINK	\N	\N	\N	{"table_title":"1_CLIENTS","ref_table_title":"7_FREIGHTS","link_field_title":"Id","link_field_id":"cyziwb8livhn9x3","row_id":"21","ref_row_id":"10","display_value":"Fischer Automotive Logistics GmbH","ref_display_value":"Example_XYZ","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:43:36+00	2026-02-10 13:43:36+00
019c47cb-126a-75b6-8ba1-148d1764e1b7	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	10	DATA_UNLINK	\N	\N	\N	{"table_title":"7_FREIGHTS","ref_table_title":"1_CLIENTS","link_field_title":"Id","link_field_id":"cydwridzimubwq2","row_id":"10","ref_row_id":"21","display_value":"Example_XYZ","ref_display_value":"Fischer Automotive Logistics GmbH","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:43:36+00	2026-02-10 13:43:36+00
019c47cb-9ed5-72ea-a92d-151bf632349c	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	11	DATA_LINK	\N	\N	\N	{"table_title":"6_TRANSPORTS","ref_table_title":"7_FREIGHTS","link_field_title":"Id","link_field_id":"cmiuaf9abst33dy","row_id":"11","ref_row_id":"10","display_value":"2026-02-09","ref_display_value":"Example_XYZ","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:44:12+00	2026-02-10 13:44:12+00
019c47cb-9ee0-7378-9ca1-e4fde16f587e	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	10	DATA_LINK	\N	\N	\N	{"table_title":"7_FREIGHTS","ref_table_title":"6_TRANSPORTS","link_field_title":"Id","link_field_id":"cydwridzimubwq2","row_id":"10","ref_row_id":"11","display_value":"Example_XYZ","ref_display_value":"2026-02-09","type":"mm"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:44:12+00	2026-02-10 13:44:12+00
019c47cc-9478-760e-9dda-e618a655da2b	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	3	DATA_UPDATE	\N	\N	\N	{"old_data":{"Departure Date":"2026-02-10"},"data":{"Departure Date":"2026-02-19"},"column_meta":{"Departure Date":{"id":"ckfllneskfstzzf","title":"Departure Date","type":"Date","options":{"date_format":"YYYY-MM-DD"}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:45:15+00	2026-02-10 13:45:15+00
019c47d1-21ed-734a-ada7-4434eaf7bf60	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	7	DATA_UPDATE	\N	\N	\N	{"old_data":{"Transport Capacity %":100},"data":{"Transport Capacity %":60},"column_meta":{"Transport Capacity %":{"id":"cvwuynxzwp0ukig","title":"Transport Capacity %","type":"Percent","options":{"precision":2,"is_progress":false}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-10 13:50:13+00	2026-02-10 13:50:13+00
019c4c90-2735-77f2-b0ae-0505d75e30f6	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	12	DATA_INSERT	\N	\N	\N	{"data":{},"column_meta":{},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-11 11:57:21+00	2026-02-11 11:57:21+00
019c4c90-2a2a-71ee-847e-55f9e7d3b785	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	13	DATA_INSERT	\N	\N	\N	{"data":{},"column_meta":{},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-11 11:57:22+00	2026-02-11 11:57:22+00
019c4c90-a111-7147-a40b-b217274df41c	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	\N	DATA_BULK_DELETE	\N	\N	\N	{"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	\N	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-11 11:57:52+00	2026-02-11 11:57:52+00
019c4c90-a116-762a-a47b-837f2f1aebac	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	12	DATA_DELETE	\N	\N	\N	{"data":{},"column_meta":{"Departure Date":{"id":"ckfllneskfstzzf","title":"Departure Date","type":"Date","options":{"date_format":"YYYY-MM-DD"}},"Origin":{"id":"c77cudldn2ldi4z","title":"Origin","type":"SingleLineText","options":{}},"Destination":{"id":"ct1zt0dav2juhz2","title":"Destination","type":"SingleLineText","options":{}},"Status":{"id":"cmy7ib7lxogr0wy","title":"Status","type":"SingleSelect","options":{"default_view_col_visibility":true,"choices":[{"title":"Planned","color":"#cfdffe","id":"s5b2waie6k39mrr"},{"title":"In Progress","color":"#d0f1fd","id":"sv0gygymfaw9b7m"},{"title":"Completed","color":"#c2f5e8","id":"szs36xd6yj2j4bt"}]}},"Notes":{"id":"chtfkfr68ef5chk","title":"Notes","type":"LongText","options":{}},"3_VEHICLEs":{"id":"cb9zfb6cmyk3nb3","title":"3_VEHICLEs","type":"Links","options":{"relation_type":"mm","linked_table_id":"m0nr5nzv9kw4ap2","rollup_function":"count"}},"Vehicle":{"id":"cuwu5vokhwerd37","title":"Vehicle","type":"Lookup","options":{"default_view_col_visibility":true,"link_field_id":"cb9zfb6cmyk3nb3","linked_table_lookup_field_id":"cdfgt6v8nwr9y3i"}},"4_DRIVERs":{"id":"cd03nr1ew2nvc55","title":"4_DRIVERs","type":"Links","options":{"relation_type":"mm","linked_table_id":"milkom888hl5xrj","rollup_function":"count"}},"Driver":{"id":"cv0nu1w5m6g4k0p","title":"Driver","type":"Lookup","options":{"link_field_id":"cd03nr1ew2nvc55","linked_table_lookup_field_id":"cbq31ueyugq2iav"}},"7_FREIGHTs":{"id":"cfjdmoaypas3ot4","title":"7_FREIGHTs","type":"Links","options":{"relation_type":"mm","linked_table_id":"mizgezntumu0w42","rollup_function":"count"}},"Transport Capacity %":{"id":"cvwuynxzwp0ukig","title":"Transport Capacity %","type":"Percent","options":{"precision":2,"is_progress":false}},"Vehicle Pallet Spaces":{"id":"cv8ytsdg9nq16kt","title":"Vehicle Pallet Spaces","type":"Lookup","options":{"link_field_id":"cb9zfb6cmyk3nb3","linked_table_lookup_field_id":"cq97xn3cuh3mohw"}},"Vehicle Capacity (kg)":{"id":"cjiu54csjvbbl7f","title":"Vehicle Capacity (kg)","type":"Lookup","options":{"link_field_id":"cb9zfb6cmyk3nb3","linked_table_lookup_field_id":"ckaouubcd7i4gyu"}},"Free Percent":{"id":"c5sxauwunyn6r03","title":"Free Percent","type":"Formula","options":{"display_column_meta":{"meta":{},"custom":{}},"display_type":null,"formula":"100 - {Transport Capacity %}"}},"Free Pallets":{"id":"ch362zepnzku4nx","title":"Free Pallets","type":"Formula","options":{"display_column_meta":{"meta":{},"custom":{}},"display_type":null,"formula":"FLOOR({Vehicle Pallet Spaces} * {Free Percent} / 100)"}},"Free Capacity (kg)":{"id":"ckfemyv8pfxvwpm","title":"Free Capacity (kg)","type":"Formula","options":{"display_column_meta":{"meta":{},"custom":{}},"display_type":null,"formula":"ROUND({Vehicle Capacity (kg)} * {Free Percent} / 100)"}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	019c4c90-a111-7147-a40b-af842f2673a2	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-11 11:57:52+00	2026-02-11 11:57:52+00
019c4c90-a118-732b-b3b4-42f474e9b6c8	maciej.polak@asterisk-dev.pl	::ffff:172.20.0.1	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	13	DATA_DELETE	\N	\N	\N	{"data":{},"column_meta":{"Departure Date":{"id":"ckfllneskfstzzf","title":"Departure Date","type":"Date","options":{"date_format":"YYYY-MM-DD"}},"Origin":{"id":"c77cudldn2ldi4z","title":"Origin","type":"SingleLineText","options":{}},"Destination":{"id":"ct1zt0dav2juhz2","title":"Destination","type":"SingleLineText","options":{}},"Status":{"id":"cmy7ib7lxogr0wy","title":"Status","type":"SingleSelect","options":{"default_view_col_visibility":true,"choices":[{"title":"Planned","color":"#cfdffe","id":"s5b2waie6k39mrr"},{"title":"In Progress","color":"#d0f1fd","id":"sv0gygymfaw9b7m"},{"title":"Completed","color":"#c2f5e8","id":"szs36xd6yj2j4bt"}]}},"Notes":{"id":"chtfkfr68ef5chk","title":"Notes","type":"LongText","options":{}},"3_VEHICLEs":{"id":"cb9zfb6cmyk3nb3","title":"3_VEHICLEs","type":"Links","options":{"relation_type":"mm","linked_table_id":"m0nr5nzv9kw4ap2","rollup_function":"count"}},"Vehicle":{"id":"cuwu5vokhwerd37","title":"Vehicle","type":"Lookup","options":{"default_view_col_visibility":true,"link_field_id":"cb9zfb6cmyk3nb3","linked_table_lookup_field_id":"cdfgt6v8nwr9y3i"}},"4_DRIVERs":{"id":"cd03nr1ew2nvc55","title":"4_DRIVERs","type":"Links","options":{"relation_type":"mm","linked_table_id":"milkom888hl5xrj","rollup_function":"count"}},"Driver":{"id":"cv0nu1w5m6g4k0p","title":"Driver","type":"Lookup","options":{"link_field_id":"cd03nr1ew2nvc55","linked_table_lookup_field_id":"cbq31ueyugq2iav"}},"7_FREIGHTs":{"id":"cfjdmoaypas3ot4","title":"7_FREIGHTs","type":"Links","options":{"relation_type":"mm","linked_table_id":"mizgezntumu0w42","rollup_function":"count"}},"Transport Capacity %":{"id":"cvwuynxzwp0ukig","title":"Transport Capacity %","type":"Percent","options":{"precision":2,"is_progress":false}},"Vehicle Pallet Spaces":{"id":"cv8ytsdg9nq16kt","title":"Vehicle Pallet Spaces","type":"Lookup","options":{"link_field_id":"cb9zfb6cmyk3nb3","linked_table_lookup_field_id":"cq97xn3cuh3mohw"}},"Vehicle Capacity (kg)":{"id":"cjiu54csjvbbl7f","title":"Vehicle Capacity (kg)","type":"Lookup","options":{"link_field_id":"cb9zfb6cmyk3nb3","linked_table_lookup_field_id":"ckaouubcd7i4gyu"}},"Free Percent":{"id":"c5sxauwunyn6r03","title":"Free Percent","type":"Formula","options":{"display_column_meta":{"meta":{},"custom":{}},"display_type":null,"formula":"100 - {Transport Capacity %}"}},"Free Pallets":{"id":"ch362zepnzku4nx","title":"Free Pallets","type":"Formula","options":{"display_column_meta":{"meta":{},"custom":{}},"display_type":null,"formula":"FLOOR({Vehicle Pallet Spaces} * {Free Percent} / 100)"}},"Free Capacity (kg)":{"id":"ckfemyv8pfxvwpm","title":"Free Capacity (kg)","type":"Formula","options":{"display_column_meta":{"meta":{},"custom":{}},"display_type":null,"formula":"ROUND({Vehicle Capacity (kg)} * {Free Percent} / 100)"}}},"table_title":"6_TRANSPORTS"}	us96d0spja9v6cqe	\N	019c4c90-a111-7147-a40b-af842f2673a2	wqid8bq2	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0	1	\N	2026-02-11 11:57:52+00	2026-02-11 11:57:52+00
\.


--
-- Data for Name: nc_automation_executions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_automation_executions (id, fk_workspace_id, base_id, fk_workflow_id, workflow_data, execution_data, finished, started_at, finished_at, status, created_at, updated_at, resume_at) FROM stdin;
\.


--
-- Data for Name: nc_automations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_automations (id, title, description, meta, fk_workspace_id, base_id, "order", type, created_by, updated_by, created_at, updated_at, enabled, nodes, edges, draft, config, script) FROM stdin;
\.


--
-- Data for Name: nc_base_users_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_base_users_v2 (base_id, fk_user_id, roles, starred, pinned, "group", color, "order", hidden, opened_date, invited_by, fk_workspace_id, created_at, updated_at) FROM stdin;
ptbstfo5b36htsq	us96d0spja9v6cqe	owner	\N	\N	\N	\N	\N	\N	\N	\N	wqid8bq2	2026-02-04 13:41:41+00	2026-02-04 13:41:41+00
pupuc6ugup9dm03	us96d0spja9v6cqe	owner	\N	\N	\N	\N	\N	\N	\N	\N	wqid8bq2	2026-02-04 13:51:53+00	2026-02-04 13:51:53+00
p3llodmezayxe7x	us96d0spja9v6cqe	owner	\N	\N	\N	\N	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:37+00	2026-02-16 15:41:37+00
\.


--
-- Data for Name: nc_bases_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_bases_v2 (id, title, prefix, status, description, meta, color, uuid, password, roles, deleted, is_meta, "order", type, fk_workspace_id, is_snapshot, fk_custom_url_id, version, default_role, created_at, updated_at, sandbox_master, sandbox_id, sandbox_version_id, auto_update) FROM stdin;
ptbstfo5b36htsq	Getting Started		\N	\N	{"iconColor":"#36BFFF"}	\N	\N	\N	\N	f	t	1	database	wqid8bq2	f	\N	2	\N	2026-02-04 13:41:41+00	2026-02-04 13:41:41+00	f	\N	\N	t
pupuc6ugup9dm03	Markris_de		\N	\N	{"iconColor":"#FCBE3A"}	\N	\N	\N	\N	f	t	2	database	wqid8bq2	f	\N	2	\N	2026-02-04 13:51:53+00	2026-02-04 13:52:46+00	f	\N	\N	t
p3llodmezayxe7x	Markris_de copy			\N	{"theme":{"primaryColor":"#0C4E65","accentColor":"#65230cff"},"iconColor":"#FCBE3A"}	#0C4E65	\N	\N	\N	f	t	3	database	wqid8bq2	f	\N	2	\N	2026-02-16 15:41:37+00	2026-02-16 15:41:43+00	f	\N	\N	t
\.


--
-- Data for Name: nc_calendar_view_columns_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_calendar_view_columns_v2 (id, base_id, source_id, fk_view_id, fk_column_id, show, bold, underline, italic, "order", fk_workspace_id, created_at, updated_at) FROM stdin;
cvchfyckf1qjvf80i	pupuc6ugup9dm03	bznmoxpma3xn3sb	vw0817wfiqb2kvwb	ckfllneskfstzzf	t	\N	\N	\N	1	wqid8bq2	2026-02-10 13:46:54+00	2026-02-10 13:46:54+00
cvcj4cl778khfjxlh	pupuc6ugup9dm03	bznmoxpma3xn3sb	vw0817wfiqb2kvwb	cmiuaf9abst33dy	t	\N	\N	\N	2	wqid8bq2	2026-02-10 13:46:54+00	2026-02-10 13:46:54+00
cvceqnxohjqbyzjo7	pupuc6ugup9dm03	bznmoxpma3xn3sb	vw0817wfiqb2kvwb	cchcqx0rzyqm1a5	t	\N	\N	\N	3	wqid8bq2	2026-02-10 13:46:54+00	2026-02-10 13:46:54+00
cvcspugr6kudhz600	pupuc6ugup9dm03	bznmoxpma3xn3sb	vw0817wfiqb2kvwb	clfgr6vekrae1ao	t	\N	\N	\N	4	wqid8bq2	2026-02-10 13:46:54+00	2026-02-10 13:46:54+00
cvcx3f854adpzwkhz	pupuc6ugup9dm03	bznmoxpma3xn3sb	vw0817wfiqb2kvwb	c4488jqu1cfwreb	t	\N	\N	\N	5	wqid8bq2	2026-02-10 13:46:54+00	2026-02-10 13:46:54+00
cvckxygwcudszpllj	pupuc6ugup9dm03	bznmoxpma3xn3sb	vw0817wfiqb2kvwb	cxq6pp2ysg4v85k	t	\N	\N	\N	6	wqid8bq2	2026-02-10 13:46:54+00	2026-02-10 13:46:54+00
cvcioxp6agtx0owrf	pupuc6ugup9dm03	bznmoxpma3xn3sb	vw0817wfiqb2kvwb	crlqeqpq8zrh94k	t	\N	\N	\N	7	wqid8bq2	2026-02-10 13:46:54+00	2026-02-10 13:46:54+00
cvcvuu8vbtrkg0bqi	pupuc6ugup9dm03	bznmoxpma3xn3sb	vw0817wfiqb2kvwb	c77cudldn2ldi4z	t	\N	\N	\N	8	wqid8bq2	2026-02-10 13:46:54+00	2026-02-10 13:46:54+00
cvcmlu6cejur9mpi6	pupuc6ugup9dm03	bznmoxpma3xn3sb	vw0817wfiqb2kvwb	ct1zt0dav2juhz2	t	\N	\N	\N	9	wqid8bq2	2026-02-10 13:46:54+00	2026-02-10 13:46:54+00
cvcwkic6etpc39a34	pupuc6ugup9dm03	bznmoxpma3xn3sb	vw0817wfiqb2kvwb	cmy7ib7lxogr0wy	t	\N	\N	\N	10	wqid8bq2	2026-02-10 13:46:54+00	2026-02-10 13:46:54+00
cvc2glbj9kbjzl6sh	pupuc6ugup9dm03	bznmoxpma3xn3sb	vw0817wfiqb2kvwb	chtfkfr68ef5chk	t	\N	\N	\N	11	wqid8bq2	2026-02-10 13:46:54+00	2026-02-10 13:46:54+00
cvcujgtz871plk3ak	pupuc6ugup9dm03	bznmoxpma3xn3sb	vw0817wfiqb2kvwb	cheyslwwnaslwi3	t	\N	\N	\N	12	wqid8bq2	2026-02-10 13:46:54+00	2026-02-10 13:46:54+00
cvcbnzzod34po2y7h	pupuc6ugup9dm03	bznmoxpma3xn3sb	vw0817wfiqb2kvwb	cb9zfb6cmyk3nb3	t	\N	\N	\N	13	wqid8bq2	2026-02-10 13:46:54+00	2026-02-10 13:46:54+00
cvclledcvfyiqtzqu	pupuc6ugup9dm03	bznmoxpma3xn3sb	vw0817wfiqb2kvwb	cuwu5vokhwerd37	t	\N	\N	\N	14	wqid8bq2	2026-02-10 13:46:54+00	2026-02-10 13:46:54+00
cvcsd45yfdc0t0a6c	pupuc6ugup9dm03	bznmoxpma3xn3sb	vw0817wfiqb2kvwb	cxwl6txkfe3uf7p	t	\N	\N	\N	15	wqid8bq2	2026-02-10 13:46:54+00	2026-02-10 13:46:54+00
cvcdbmivvfsp5k9v8	pupuc6ugup9dm03	bznmoxpma3xn3sb	vw0817wfiqb2kvwb	cd03nr1ew2nvc55	t	\N	\N	\N	16	wqid8bq2	2026-02-10 13:46:54+00	2026-02-10 13:46:54+00
cvcgczbptlkdxacdf	pupuc6ugup9dm03	bznmoxpma3xn3sb	vw0817wfiqb2kvwb	cv0nu1w5m6g4k0p	t	\N	\N	\N	17	wqid8bq2	2026-02-10 13:46:54+00	2026-02-10 13:46:54+00
cvcuz6qadjexp8hdk	pupuc6ugup9dm03	bznmoxpma3xn3sb	vw0817wfiqb2kvwb	cfdmjgmx05n40su	t	\N	\N	\N	18	wqid8bq2	2026-02-10 13:46:54+00	2026-02-10 13:46:54+00
cvcrzcil50xekrgf7	pupuc6ugup9dm03	bznmoxpma3xn3sb	vw0817wfiqb2kvwb	cfjdmoaypas3ot4	t	\N	\N	\N	19	wqid8bq2	2026-02-10 13:46:54+00	2026-02-10 13:46:54+00
cvcpr6kz9u431myx0	pupuc6ugup9dm03	bznmoxpma3xn3sb	vw0817wfiqb2kvwb	cvwuynxzwp0ukig	t	\N	\N	\N	20	wqid8bq2	2026-02-10 13:46:54+00	2026-02-10 13:46:54+00
cvc4ixqb516l1pxtr	pupuc6ugup9dm03	bznmoxpma3xn3sb	vw0817wfiqb2kvwb	cv8ytsdg9nq16kt	f	\N	\N	\N	21	wqid8bq2	2026-02-10 15:46:28+00	2026-02-10 15:46:28+00
cvcj02v6tyncthugm	pupuc6ugup9dm03	bznmoxpma3xn3sb	vw0817wfiqb2kvwb	cjiu54csjvbbl7f	f	\N	\N	\N	22	wqid8bq2	2026-02-10 15:46:52+00	2026-02-10 15:46:52+00
cvc9u9i8me4pn70h8	pupuc6ugup9dm03	bznmoxpma3xn3sb	vw0817wfiqb2kvwb	c5sxauwunyn6r03	f	\N	\N	\N	23	wqid8bq2	2026-02-10 15:47:32+00	2026-02-10 15:47:32+00
cvcrgc7yxf0pqa0dd	pupuc6ugup9dm03	bznmoxpma3xn3sb	vw0817wfiqb2kvwb	ch362zepnzku4nx	f	\N	\N	\N	24	wqid8bq2	2026-02-10 15:48:01+00	2026-02-10 15:48:01+00
cvcqjf0v6di06hib1	pupuc6ugup9dm03	bznmoxpma3xn3sb	vw0817wfiqb2kvwb	ckfemyv8pfxvwpm	f	\N	\N	\N	25	wqid8bq2	2026-02-10 15:48:22+00	2026-02-10 15:48:22+00
cvcsv7qc7xlvicejj	p3llodmezayxe7x	bjtfj3ddt8m4k3e	vwy52gj1ums3z93s	cfeqvvbh4fun0qf	t	\N	\N	\N	11	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
cvc4z6sb9mch438xv	p3llodmezayxe7x	bjtfj3ddt8m4k3e	vwy52gj1ums3z93s	ca5m0kcy6pudper	t	\N	\N	\N	13	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
cvcm4ca8yltplyueu	p3llodmezayxe7x	bjtfj3ddt8m4k3e	vwy52gj1ums3z93s	cq5zzm2h798z443	t	\N	\N	\N	15	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
cvch7tm0p0zx7apu5	p3llodmezayxe7x	bjtfj3ddt8m4k3e	vwy52gj1ums3z93s	c1vwnz3lnox54kz	t	\N	\N	\N	1	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
cvck6597klimgmdrh	p3llodmezayxe7x	bjtfj3ddt8m4k3e	vwy52gj1ums3z93s	c79yuvg7344emms	t	\N	\N	\N	2	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
cvc7tktbwddyoalky	p3llodmezayxe7x	bjtfj3ddt8m4k3e	vwy52gj1ums3z93s	ccpi7ncgcnpnynu	t	\N	\N	\N	3	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
cvc4dzrjo7kza3ljx	p3llodmezayxe7x	bjtfj3ddt8m4k3e	vwy52gj1ums3z93s	cbl6jx8pv9olf98	t	\N	\N	\N	4	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
cvcrjuu7fivu2g6ma	p3llodmezayxe7x	bjtfj3ddt8m4k3e	vwy52gj1ums3z93s	cuubl86zu5f58fj	t	\N	\N	\N	7	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
cvc43p905utwszcin	p3llodmezayxe7x	bjtfj3ddt8m4k3e	vwy52gj1ums3z93s	ct4fse4fn1g2b0p	t	\N	\N	\N	8	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
cvcptg202tw2q0b3d	p3llodmezayxe7x	bjtfj3ddt8m4k3e	vwy52gj1ums3z93s	cdrxhq7sj28nxzq	t	\N	\N	\N	9	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
cvcltpdgalvdc1yop	p3llodmezayxe7x	bjtfj3ddt8m4k3e	vwy52gj1ums3z93s	cbl4sswrm0gq15b	t	\N	\N	\N	10	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
cvcd3txgqpgrzgxt9	p3llodmezayxe7x	bjtfj3ddt8m4k3e	vwy52gj1ums3z93s	ccpzp2183phyy9q	t	\N	\N	\N	11	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
cvcg62akkq36r9htx	p3llodmezayxe7x	bjtfj3ddt8m4k3e	vwy52gj1ums3z93s	cv7j5xabbktmkgy	t	\N	\N	\N	20	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
cvc782boczxkwblmc	p3llodmezayxe7x	bjtfj3ddt8m4k3e	vwy52gj1ums3z93s	cu1owbs99nlqler	t	\N	\N	\N	13	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
cvcvaznkjn86kuk0r	p3llodmezayxe7x	bjtfj3ddt8m4k3e	vwy52gj1ums3z93s	c4wmq2hyfjp8vso	t	\N	\N	\N	16	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
cvc2u3jcg6gb3jcc2	p3llodmezayxe7x	bjtfj3ddt8m4k3e	vwy52gj1ums3z93s	cwmwxtsga3qwy43	t	\N	\N	\N	19	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
cvcrtx71quuyzg5f1	p3llodmezayxe7x	bjtfj3ddt8m4k3e	vwy52gj1ums3z93s	caql0obpzuqbk2e	t	\N	\N	\N	14	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
cvc0x3hnfc9sq6idx	p3llodmezayxe7x	bjtfj3ddt8m4k3e	vwy52gj1ums3z93s	cn0vcb15ajvvyhw	t	\N	\N	\N	17	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
cvcj6io7qykvo00jv	p3llodmezayxe7x	bjtfj3ddt8m4k3e	vwy52gj1ums3z93s	cjwn9pp8ncgexwg	f	\N	\N	\N	21	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
cvcu1gqbxmbpxfr6c	p3llodmezayxe7x	bjtfj3ddt8m4k3e	vwy52gj1ums3z93s	ccm5qxuzl332t23	f	\N	\N	\N	22	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
cvcdnoidybj3d56iv	p3llodmezayxe7x	bjtfj3ddt8m4k3e	vwy52gj1ums3z93s	cstfwpku5xjfmkv	f	\N	\N	\N	23	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
cvcbtzrg1yndb2whc	p3llodmezayxe7x	bjtfj3ddt8m4k3e	vwy52gj1ums3z93s	cbleodw1myj0pax	f	\N	\N	\N	24	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
cvczah2kqnikzaadr	p3llodmezayxe7x	bjtfj3ddt8m4k3e	vwy52gj1ums3z93s	chwu65i1koltwil	f	\N	\N	\N	25	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
\.


--
-- Data for Name: nc_calendar_view_range_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_calendar_view_range_v2 (id, fk_view_id, fk_to_column_id, label, fk_from_column_id, base_id, fk_workspace_id, created_at, updated_at) FROM stdin;
cvrmk78ats3618g81	vw0817wfiqb2kvwb	\N	\N	ckfllneskfstzzf	pupuc6ugup9dm03	wqid8bq2	2026-02-10 13:46:54+00	2026-02-10 13:46:54+00
cvrso05kzcxpaayj8	vwy52gj1ums3z93s	\N	\N	c1vwnz3lnox54kz	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
\.


--
-- Data for Name: nc_calendar_view_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_calendar_view_v2 (fk_view_id, base_id, source_id, title, fk_cover_image_col_id, meta, fk_workspace_id, created_at, updated_at) FROM stdin;
vw0817wfiqb2kvwb	pupuc6ugup9dm03	bznmoxpma3xn3sb	\N	\N	{"active_view":"week"}	wqid8bq2	2026-02-10 13:46:54+00	2026-02-11 11:52:34+00
vwy52gj1ums3z93s	p3llodmezayxe7x	bjtfj3ddt8m4k3e	\N	\N	{}	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
\.


--
-- Data for Name: nc_col_barcode_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_col_barcode_v2 (id, fk_column_id, fk_barcode_value_column_id, barcode_format, deleted, base_id, fk_workspace_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_col_button_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_col_button_v2 (id, base_id, type, label, theme, color, icon, formula, formula_raw, error, parsed_tree, fk_webhook_id, fk_column_id, fk_integration_id, model, output_column_ids, fk_workspace_id, fk_script_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_col_formula_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_col_formula_v2 (id, fk_column_id, formula, formula_raw, error, deleted, "order", parsed_tree, base_id, fk_workspace_id, created_at, updated_at) FROM stdin;
foxctrtq0bbmq41	c5sxauwunyn6r03	(100 - {{cvwuynxzwp0ukig}})	100 - {Transport Capacity %}	\N	\N	\N	{"type":"BinaryExpression","operator":"-","left":{"type":"Literal","value":100,"raw":"100","dataType":"numeric","fnName":"ARITH"},"right":{"type":"Identifier","name":"cvwuynxzwp0ukig","raw":"{{cvwuynxzwp0ukig}}","dataType":"numeric","referencedColumn":{"id":"cvwuynxzwp0ukig","uidt":"Percent"},"fnName":"ARITH"},"dataType":"numeric","referencedColumn":{"id":"cvwuynxzwp0ukig","uidt":"Percent"},"uidtCandidates":["Decimal"],"invalidForReferenceColumn":false}	pupuc6ugup9dm03	wqid8bq2	2026-02-10 15:47:32+00	2026-02-10 15:47:32+00
frb82ovozz471fr	ch362zepnzku4nx	FLOOR((({{cv8ytsdg9nq16kt}} * {{c5sxauwunyn6r03}}) / 100))	FLOOR({Vehicle Pallet Spaces} * {Free Percent} / 100)	\N	\N	\N	{"type":"CallExpression","arguments":[{"type":"BinaryExpression","operator":"/","left":{"callee":{"name":"FLOAT"},"type":"CallExpression","arguments":[{"type":"BinaryExpression","operator":"*","left":{"type":"Identifier","name":"cv8ytsdg9nq16kt","raw":"{{cv8ytsdg9nq16kt}}","dataType":"numeric","isDataArray":true,"referencedColumn":{"id":"cq97xn3cuh3mohw","uidt":"Number","intermediaryUidt":"Lookup","intermediaryId":"cv8ytsdg9nq16kt"},"fnName":"ARITH"},"right":{"type":"Identifier","name":"c5sxauwunyn6r03","raw":"{{c5sxauwunyn6r03}}","dataType":"numeric","referencedColumn":{"id":"cvwuynxzwp0ukig","uidt":"Percent"},"fnName":"ARITH"},"dataType":"numeric","uidtCandidates":["Decimal"],"invalidForReferenceColumn":true,"fnName":"FLOAT","argsCount":1}],"fnName":"ARITH"},"right":{"callee":{"name":"FLOAT"},"type":"CallExpression","arguments":[{"type":"Literal","value":100,"raw":"100","dataType":"numeric","fnName":"FLOAT","argsCount":1}],"fnName":"ARITH"},"dataType":"numeric","uidtCandidates":["Decimal"],"invalidForReferenceColumn":true,"fnName":"FLOOR","argsCount":1}],"callee":{"type":"Identifier","name":"FLOOR"},"dataType":"numeric","uidtCandidates":["Decimal"],"invalidForReferenceColumn":true}	pupuc6ugup9dm03	wqid8bq2	2026-02-10 15:48:01+00	2026-02-10 15:48:01+00
fmb4f4tvl4h3wid	ckfemyv8pfxvwpm	ROUND((({{cjiu54csjvbbl7f}} * {{c5sxauwunyn6r03}}) / 100))	ROUND({Vehicle Capacity (kg)} * {Free Percent} / 100)	\N	\N	\N	{"type":"CallExpression","arguments":[{"type":"BinaryExpression","operator":"/","left":{"callee":{"name":"FLOAT"},"type":"CallExpression","arguments":[{"type":"BinaryExpression","operator":"*","left":{"type":"Identifier","name":"cjiu54csjvbbl7f","raw":"{{cjiu54csjvbbl7f}}","dataType":"numeric","isDataArray":true,"referencedColumn":{"id":"ckaouubcd7i4gyu","uidt":"Number","intermediaryUidt":"Lookup","intermediaryId":"cjiu54csjvbbl7f"},"fnName":"ARITH"},"right":{"type":"Identifier","name":"c5sxauwunyn6r03","raw":"{{c5sxauwunyn6r03}}","dataType":"numeric","referencedColumn":{"id":"cvwuynxzwp0ukig","uidt":"Percent"},"fnName":"ARITH"},"dataType":"numeric","uidtCandidates":["Decimal"],"invalidForReferenceColumn":true,"fnName":"FLOAT","argsCount":1}],"fnName":"ARITH"},"right":{"callee":{"name":"FLOAT"},"type":"CallExpression","arguments":[{"type":"Literal","value":100,"raw":"100","dataType":"numeric","fnName":"FLOAT","argsCount":1}],"fnName":"ARITH"},"dataType":"numeric","uidtCandidates":["Decimal"],"invalidForReferenceColumn":true,"fnName":"ROUND","argsCount":1}],"callee":{"type":"Identifier","name":"ROUND"},"dataType":"numeric","uidtCandidates":["Decimal"],"invalidForReferenceColumn":true}	pupuc6ugup9dm03	wqid8bq2	2026-02-10 15:48:22+00	2026-02-10 15:48:22+00
f3p6l9bnxqnjnny	cstfwpku5xjfmkv	(100 - {{cv7j5xabbktmkgy}})	(100 - {Transport Capacity %})	\N	\N	\N	{"type":"BinaryExpression","operator":"-","left":{"type":"Literal","value":100,"raw":"100","dataType":"numeric","fnName":"ARITH"},"right":{"type":"Identifier","name":"cv7j5xabbktmkgy","raw":"{{cv7j5xabbktmkgy}}","dataType":"numeric","referencedColumn":{"id":"cv7j5xabbktmkgy","uidt":"Percent"},"fnName":"ARITH"},"dataType":"numeric","referencedColumn":{"id":"cv7j5xabbktmkgy","uidt":"Percent"},"uidtCandidates":["Decimal"],"invalidForReferenceColumn":false}	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
f6cb4yssru0lkgg	chwu65i1koltwil	ROUND((({{ccm5qxuzl332t23}} * {{cstfwpku5xjfmkv}}) / 100))	ROUND((({Vehicle Capacity (kg)} * {Free Percent}) / 100))	\N	\N	\N	{"type":"CallExpression","arguments":[{"type":"BinaryExpression","operator":"/","left":{"callee":{"name":"FLOAT"},"type":"CallExpression","arguments":[{"type":"BinaryExpression","operator":"*","left":{"type":"Identifier","name":"ccm5qxuzl332t23","raw":"{{ccm5qxuzl332t23}}","dataType":"numeric","isDataArray":true,"referencedColumn":{"id":"crnle1wp9n7bcer","uidt":"Number","intermediaryUidt":"Lookup","intermediaryId":"ccm5qxuzl332t23"},"fnName":"ARITH"},"right":{"type":"Identifier","name":"cstfwpku5xjfmkv","raw":"{{cstfwpku5xjfmkv}}","dataType":"numeric","referencedColumn":{"id":"cv7j5xabbktmkgy","uidt":"Percent"},"fnName":"ARITH"},"dataType":"numeric","uidtCandidates":["Decimal"],"invalidForReferenceColumn":true,"fnName":"FLOAT","argsCount":1}],"fnName":"ARITH"},"right":{"callee":{"name":"FLOAT"},"type":"CallExpression","arguments":[{"type":"Literal","value":100,"raw":"100","dataType":"numeric","fnName":"FLOAT","argsCount":1}],"fnName":"ARITH"},"dataType":"numeric","uidtCandidates":["Decimal"],"invalidForReferenceColumn":true,"fnName":"ROUND","argsCount":1}],"callee":{"type":"Identifier","name":"ROUND"},"dataType":"numeric","uidtCandidates":["Decimal"],"invalidForReferenceColumn":true}	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
fpi5knjrnnk24je	cbleodw1myj0pax	FLOOR((({{cjwn9pp8ncgexwg}} * {{cstfwpku5xjfmkv}}) / 100))	FLOOR((({Vehicle Pallet Spaces} * {Free Percent}) / 100))	\N	\N	\N	{"type":"CallExpression","arguments":[{"type":"BinaryExpression","operator":"/","left":{"callee":{"name":"FLOAT"},"type":"CallExpression","arguments":[{"type":"BinaryExpression","operator":"*","left":{"type":"Identifier","name":"cjwn9pp8ncgexwg","raw":"{{cjwn9pp8ncgexwg}}","dataType":"numeric","isDataArray":true,"referencedColumn":{"id":"clu4djodmjcincm","uidt":"Number","intermediaryUidt":"Lookup","intermediaryId":"cjwn9pp8ncgexwg"},"fnName":"ARITH"},"right":{"type":"Identifier","name":"cstfwpku5xjfmkv","raw":"{{cstfwpku5xjfmkv}}","dataType":"numeric","referencedColumn":{"id":"cv7j5xabbktmkgy","uidt":"Percent"},"fnName":"ARITH"},"dataType":"numeric","uidtCandidates":["Decimal"],"invalidForReferenceColumn":true,"fnName":"FLOAT","argsCount":1}],"fnName":"ARITH"},"right":{"callee":{"name":"FLOAT"},"type":"CallExpression","arguments":[{"type":"Literal","value":100,"raw":"100","dataType":"numeric","fnName":"FLOAT","argsCount":1}],"fnName":"ARITH"},"dataType":"numeric","uidtCandidates":["Decimal"],"invalidForReferenceColumn":true,"fnName":"FLOOR","argsCount":1}],"callee":{"type":"Identifier","name":"FLOOR"},"dataType":"numeric","uidtCandidates":["Decimal"],"invalidForReferenceColumn":true}	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
\.


--
-- Data for Name: nc_col_long_text_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_col_long_text_v2 (id, fk_workspace_id, base_id, fk_model_id, fk_column_id, fk_integration_id, model, prompt, prompt_raw, error, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_col_lookup_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_col_lookup_v2 (id, fk_column_id, fk_relation_column_id, fk_lookup_column_id, deleted, base_id, fk_workspace_id, created_at, updated_at) FROM stdin;
lkr2er9oxils9adq	cv71nqyp9d6iblu	c5nm24mhw8dqqgx	cbq31ueyugq2iav	\N	pupuc6ugup9dm03	wqid8bq2	2026-02-09 18:00:26+00	2026-02-09 18:00:26+00
lkl33via9pya7dlt	cnsr2795ce18wkx	cu0bwr7p9nxapn0	c2nbpggrn6owwf0	\N	pupuc6ugup9dm03	wqid8bq2	2026-02-09 18:01:37+00	2026-02-09 18:01:37+00
lk45wedtr66f7icj	cf7fhgh14nrhrkn	c6covu3mw8ifwyx	ctit2jdxf8xi0y6	\N	pupuc6ugup9dm03	wqid8bq2	2026-02-09 18:08:20+00	2026-02-09 18:08:20+00
lk4wqj0ty850yhtz	cyml861u7wzdzqc	c05e11ftou4idmo	ctit2jdxf8xi0y6	\N	pupuc6ugup9dm03	wqid8bq2	2026-02-09 18:09:36+00	2026-02-09 18:09:36+00
lknniuqhsn4vehz0	cw6vsvzfnq5linv	clmoy1dn4a0cj4i	cdfgt6v8nwr9y3i	\N	pupuc6ugup9dm03	wqid8bq2	2026-02-09 18:10:59+00	2026-02-09 18:10:59+00
lk5vkfmt9ggqyv0y	cb6kyebvgf4c1k9	cm75kuwju8h6d53	c2nbpggrn6owwf0	\N	pupuc6ugup9dm03	wqid8bq2	2026-02-09 18:13:44+00	2026-02-09 18:13:44+00
lkcdcvjeshv7i32f	cuwu5vokhwerd37	cb9zfb6cmyk3nb3	cdfgt6v8nwr9y3i	\N	pupuc6ugup9dm03	wqid8bq2	2026-02-09 18:15:32+00	2026-02-09 18:15:32+00
lkt9qv9ku9x81ut9	cv0nu1w5m6g4k0p	cd03nr1ew2nvc55	cbq31ueyugq2iav	\N	pupuc6ugup9dm03	wqid8bq2	2026-02-09 18:19:31+00	2026-02-09 18:19:31+00
lkntlcn1tur6lbq2	cmuad2sogee58l5	cmkzvu89sq1tqwe	ctit2jdxf8xi0y6	\N	pupuc6ugup9dm03	wqid8bq2	2026-02-09 18:22:15+00	2026-02-09 18:22:15+00
lk67svbjhnlbycgd	cqa5y3yzcdt5ltr	cbwarj2unek0fx7	ckfllneskfstzzf	\N	pupuc6ugup9dm03	wqid8bq2	2026-02-09 18:33:12+00	2026-02-09 18:33:12+00
lke2vyvkcc2yv3r1	c6zmah4nvr48ngd	cbwarj2unek0fx7	c77cudldn2ldi4z	\N	pupuc6ugup9dm03	wqid8bq2	2026-02-09 18:33:32+00	2026-02-09 18:33:32+00
lk38grwqhnklepaf	c3305onaea54zoz	cbwarj2unek0fx7	ct1zt0dav2juhz2	\N	pupuc6ugup9dm03	wqid8bq2	2026-02-09 18:33:43+00	2026-02-09 18:33:43+00
lkhu1c4bsqdl9ne8	cv8ytsdg9nq16kt	cb9zfb6cmyk3nb3	cq97xn3cuh3mohw	\N	pupuc6ugup9dm03	wqid8bq2	2026-02-10 15:46:28+00	2026-02-10 15:46:28+00
lkiuin52c134jqp4	cjiu54csjvbbl7f	cb9zfb6cmyk3nb3	ckaouubcd7i4gyu	\N	pupuc6ugup9dm03	wqid8bq2	2026-02-10 15:46:52+00	2026-02-10 15:46:52+00
lkdn2qmv4bnqapvf	c7g9fddmsk3b0ax	cd1mddqfxnugaq1	cdrxhq7sj28nxzq	\N	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
lkur74xmhq8igbiu	cmbl579v4xzuilu	cd1mddqfxnugaq1	ct4fse4fn1g2b0p	\N	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
lk0cdja8p4zgy0re	cdcpnyz7n5c2kp4	cd1mddqfxnugaq1	c1vwnz3lnox54kz	\N	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
lkxouiabx062s0y8	cujsf5t2ifqilrq	cgvw6sc7ktb7tua	cwm6g4nzu8jcjm8	\N	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
lkxp0n7gy6qw055h	ccm5qxuzl332t23	cu1owbs99nlqler	crnle1wp9n7bcer	\N	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
lkih70jl8nr5lawe	cjwn9pp8ncgexwg	cu1owbs99nlqler	clu4djodmjcincm	\N	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
lkre2tb9qy20t6nn	cn0vcb15ajvvyhw	c4wmq2hyfjp8vso	co64i4u7pt4r6k9	\N	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
lk75hezj6k9aayg6	caql0obpzuqbk2e	cu1owbs99nlqler	c4nfxjmto81hsbf	\N	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
lkq0fedjndxloo1u	cfwjiomt1iioww0	csj1yf0mmbovzpf	cd5em2l75qq6th6	\N	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
lkaahenghaoq29e3	ctrn5xolyinajkn	ctw9ifw88oex0qo	cwm6g4nzu8jcjm8	\N	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
lkajf81e25cq8aj2	cz34w4837wu40p7	c4e0ek1a9kpk2sz	c4nfxjmto81hsbf	\N	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
lkurbhku8pygy1q2	ce1w2bne17h7b34	cdf69h02znto6yx	co64i4u7pt4r6k9	\N	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
lkr6km4iovu4nsbb	c85it7rqagnzw9a	cc2tzrc5ua5jca6	cwm6g4nzu8jcjm8	\N	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
lkty66ouknfmc2li	c6pdb246lwxur0y	czyh7mb08nyb6d8	cd5em2l75qq6th6	\N	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
\.


--
-- Data for Name: nc_col_qrcode_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_col_qrcode_v2 (id, fk_column_id, fk_qr_value_column_id, deleted, "order", base_id, fk_workspace_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_col_relations_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_col_relations_v2 (id, ref_db_alias, type, virtual, db_type, fk_column_id, fk_related_model_id, fk_child_column_id, fk_parent_column_id, fk_mm_model_id, fk_mm_child_column_id, fk_mm_parent_column_id, ur, dr, fk_index_name, deleted, fk_target_view_id, base_id, fk_workspace_id, fk_related_base_id, fk_mm_base_id, fk_related_source_id, fk_mm_source_id, created_at, updated_at) FROM stdin;
ldnb8h4l9y6u3bc	\N	bt	t	\N	c6hdxzzb4nk3wli	mleo2f440ply95o	cp5qde7762p94od	cyziwb8livhn9x3	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 17:46:33+00	2026-02-09 17:46:33+00
l4xri0pd5e7gjyh	\N	hm	t	\N	cnl2ar5uezykpju	ma2bsaypbay1l2e	cp5qde7762p94od	cyziwb8livhn9x3	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 17:46:33+00	2026-02-09 17:46:33+00
l6mq4h9cywofghk	\N	bt	t	\N	cmxxts2k95wo8gt	m9wa466xf8r4x94	cjlmtyr4lqeiae5	cchwvjoyq7bj1hk	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 17:46:34+00	2026-02-09 17:46:34+00
l7ar7pepykyejwh	\N	hm	t	\N	cptx2p0w7d45sir	ma2bsaypbay1l2e	cjlmtyr4lqeiae5	cchwvjoyq7bj1hk	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 17:46:34+00	2026-02-09 17:46:34+00
l3aypamge88p6nc	\N	mm	t	\N	c05e11ftou4idmo	mleo2f440ply95o	cchwvjoyq7bj1hk	cyziwb8livhn9x3	ma2bsaypbay1l2e	cjlmtyr4lqeiae5	cp5qde7762p94od	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 17:46:34+00	2026-02-09 17:46:34+00
ls5icx6qn0eyvhd	\N	mm	t	\N	cu0bwr7p9nxapn0	m9wa466xf8r4x94	cyziwb8livhn9x3	cchwvjoyq7bj1hk	ma2bsaypbay1l2e	cp5qde7762p94od	cjlmtyr4lqeiae5	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 17:46:34+00	2026-02-09 17:46:34+00
lk8880ml2eth4b4	\N	bt	t	\N	cc19tkhguph30nb	m0nr5nzv9kw4ap2	cdh5ieiy9swc0dc	chs7p910b3q6yqm	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 17:58:12+00	2026-02-09 17:58:12+00
l9airqnieddalei	\N	hm	t	\N	cbs91tiep4lbcn4	mwqo4tyim3er84z	cdh5ieiy9swc0dc	chs7p910b3q6yqm	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 17:58:12+00	2026-02-09 17:58:12+00
l2gla288b5cy1wd	\N	bt	t	\N	czxs4da12eivtmk	milkom888hl5xrj	cnxam7bzha5n05r	cra65d75swysgg2	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 17:58:12+00	2026-02-09 17:58:12+00
l1026g9ohxslxs1	\N	hm	t	\N	cia1yht1f9lb8v6	mwqo4tyim3er84z	cnxam7bzha5n05r	cra65d75swysgg2	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 17:58:12+00	2026-02-09 17:58:12+00
lj4hgem8514wnzc	\N	mm	t	\N	clmoy1dn4a0cj4i	m0nr5nzv9kw4ap2	cra65d75swysgg2	chs7p910b3q6yqm	mwqo4tyim3er84z	cnxam7bzha5n05r	cdh5ieiy9swc0dc	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 17:58:12+00	2026-02-09 17:58:12+00
l8uv3vhqp2v645m	\N	mm	t	\N	c5nm24mhw8dqqgx	milkom888hl5xrj	chs7p910b3q6yqm	cra65d75swysgg2	mwqo4tyim3er84z	cdh5ieiy9swc0dc	cnxam7bzha5n05r	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 17:58:12+00	2026-02-09 17:58:12+00
l1eudm36kbgd6g1	\N	bt	t	\N	cap1qxgskyvdy2v	mleo2f440ply95o	cvl6cwfjsgn9rm4	cyziwb8livhn9x3	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:05:18+00	2026-02-09 18:05:18+00
lpibxutvr8ju7ar	\N	hm	t	\N	cuqoryv861aqpu6	mbrdjwqzi4k85pu	cvl6cwfjsgn9rm4	cyziwb8livhn9x3	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:05:18+00	2026-02-09 18:05:18+00
l9rhcuwa5a6rszt	\N	bt	t	\N	ci4o7j3hime7f6z	mzwj8ptf78t4pi9	cx1qffbaisk4k1m	ctfseugejnckr3v	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:05:18+00	2026-02-09 18:05:18+00
ls0a69gh64qiuko	\N	hm	t	\N	cp9hbd7r3agj1yp	mbrdjwqzi4k85pu	cx1qffbaisk4k1m	ctfseugejnckr3v	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:05:18+00	2026-02-09 18:05:18+00
lb7h3kj2kqinwlj	\N	mm	t	\N	c6covu3mw8ifwyx	mleo2f440ply95o	ctfseugejnckr3v	cyziwb8livhn9x3	mbrdjwqzi4k85pu	cx1qffbaisk4k1m	cvl6cwfjsgn9rm4	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:05:19+00	2026-02-09 18:05:19+00
ler2452sr06irmz	\N	mm	t	\N	cud7ibgfdtc5rlj	mzwj8ptf78t4pi9	cyziwb8livhn9x3	ctfseugejnckr3v	mbrdjwqzi4k85pu	cvl6cwfjsgn9rm4	cx1qffbaisk4k1m	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:05:19+00	2026-02-09 18:05:19+00
ljhajh7bctjyc9x	\N	bt	t	\N	clvh6ivzzvi3ooo	m9wa466xf8r4x94	ciu5dhnkukkfvzy	cchwvjoyq7bj1hk	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:12:06+00	2026-02-09 18:12:06+00
l7mjg1qsjh1lk0k	\N	hm	t	\N	c6kmuu3sxabonbl	mv9v9zjgzfy5elx	ciu5dhnkukkfvzy	cchwvjoyq7bj1hk	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:12:06+00	2026-02-09 18:12:06+00
l88h3z9kdigibl7	\N	bt	t	\N	czk3l3g0bvvcnsn	mzwj8ptf78t4pi9	cc4ldogr5cbdoll	ctfseugejnckr3v	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:12:06+00	2026-02-09 18:12:06+00
l9feap8sah4pg6q	\N	hm	t	\N	c3o8g32cmdd866m	mv9v9zjgzfy5elx	cc4ldogr5cbdoll	ctfseugejnckr3v	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:12:06+00	2026-02-09 18:12:06+00
lh0vyzu1mn30ph8	\N	mm	t	\N	cm75kuwju8h6d53	m9wa466xf8r4x94	ctfseugejnckr3v	cchwvjoyq7bj1hk	mv9v9zjgzfy5elx	cc4ldogr5cbdoll	ciu5dhnkukkfvzy	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:12:06+00	2026-02-09 18:12:06+00
lwg7doqz7ytml8p	\N	mm	t	\N	cqj68if71u1536q	mzwj8ptf78t4pi9	cchwvjoyq7bj1hk	ctfseugejnckr3v	mv9v9zjgzfy5elx	ciu5dhnkukkfvzy	cc4ldogr5cbdoll	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:12:06+00	2026-02-09 18:12:06+00
lod4iuvr0as78gx	\N	bt	t	\N	cfkewqb8ein2k7e	m0nr5nzv9kw4ap2	c6e9ihzhyby9enp	chs7p910b3q6yqm	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:14:43+00	2026-02-09 18:14:43+00
l1ujjyw2y0ie6t6	\N	hm	t	\N	cpdvdr3j94euxci	muzy18i6jdjkcao	c6e9ihzhyby9enp	chs7p910b3q6yqm	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:14:43+00	2026-02-09 18:14:43+00
lgp2vkm42ys31xm	\N	bt	t	\N	cnv6alltf9f39kh	mko9nvxci0pz4dd	crrs08f7cgpdcp1	cmiuaf9abst33dy	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:14:43+00	2026-02-09 18:14:43+00
lfogvxisu41qt1a	\N	hm	t	\N	cheyslwwnaslwi3	muzy18i6jdjkcao	crrs08f7cgpdcp1	cmiuaf9abst33dy	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:14:43+00	2026-02-09 18:14:43+00
l08zkueevrx6fov	\N	mm	t	\N	cb9zfb6cmyk3nb3	m0nr5nzv9kw4ap2	cmiuaf9abst33dy	chs7p910b3q6yqm	muzy18i6jdjkcao	crrs08f7cgpdcp1	c6e9ihzhyby9enp	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:14:43+00	2026-02-09 18:14:43+00
lt4bzw93ujklb13	\N	mm	t	\N	c940zopwks20w59	mko9nvxci0pz4dd	chs7p910b3q6yqm	cmiuaf9abst33dy	muzy18i6jdjkcao	c6e9ihzhyby9enp	crrs08f7cgpdcp1	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:14:43+00	2026-02-09 18:14:43+00
l0dsnzu8s84btuk	\N	bt	t	\N	cbc5a026my67zsy	milkom888hl5xrj	crxv61a9whrnn6d	cra65d75swysgg2	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:17:38+00	2026-02-09 18:17:38+00
lupqb3h03px57lx	\N	hm	t	\N	cypop3x59q51hu6	m0tv1ftq4mjvyyl	crxv61a9whrnn6d	cra65d75swysgg2	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:17:38+00	2026-02-09 18:17:38+00
llmeb99utmwcv37	\N	bt	t	\N	caoici07xkegpkn	mko9nvxci0pz4dd	c3r3mrybwsqdo6u	cmiuaf9abst33dy	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:17:38+00	2026-02-09 18:17:38+00
lajarumi5e2vw1r	\N	hm	t	\N	cxwl6txkfe3uf7p	m0tv1ftq4mjvyyl	c3r3mrybwsqdo6u	cmiuaf9abst33dy	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:17:38+00	2026-02-09 18:17:38+00
lw71sdnqto7b0y1	\N	mm	t	\N	cd03nr1ew2nvc55	milkom888hl5xrj	cmiuaf9abst33dy	cra65d75swysgg2	m0tv1ftq4mjvyyl	c3r3mrybwsqdo6u	crxv61a9whrnn6d	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:17:38+00	2026-02-09 18:17:38+00
lurzhojj542hcge	\N	mm	t	\N	c3qx3qpy29mmgoj	mko9nvxci0pz4dd	cra65d75swysgg2	cmiuaf9abst33dy	m0tv1ftq4mjvyyl	crxv61a9whrnn6d	c3r3mrybwsqdo6u	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:17:38+00	2026-02-09 18:17:38+00
ls6dqhvoe99rdn4	\N	bt	t	\N	cqwo4he88ae7kj6	mleo2f440ply95o	c3sley7vn6e2886	cyziwb8livhn9x3	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:21:32+00	2026-02-09 18:21:32+00
l3s90gucxn07ckc	\N	hm	t	\N	c4fak0a46kr1oiu	m6t6dzpzjsh3pou	c3sley7vn6e2886	cyziwb8livhn9x3	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:21:32+00	2026-02-09 18:21:32+00
l7rkzhzmqppa3kx	\N	bt	t	\N	cxd7yi6n4xr67cm	mizgezntumu0w42	cs2zr31rp5jlhnd	cydwridzimubwq2	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:21:32+00	2026-02-09 18:21:32+00
lo3c5cgcaqjgltc	\N	hm	t	\N	cqpd6c27fhb1mnq	m6t6dzpzjsh3pou	cs2zr31rp5jlhnd	cydwridzimubwq2	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:21:32+00	2026-02-09 18:21:32+00
lmf6xm2z86v9xas	\N	mm	t	\N	cmkzvu89sq1tqwe	mleo2f440ply95o	cydwridzimubwq2	cyziwb8livhn9x3	m6t6dzpzjsh3pou	cs2zr31rp5jlhnd	c3sley7vn6e2886	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:21:32+00	2026-02-09 18:21:32+00
lrtl2teqqo4ooy4	\N	mm	t	\N	c66j0cxivg3e6zi	mizgezntumu0w42	cyziwb8livhn9x3	cydwridzimubwq2	m6t6dzpzjsh3pou	c3sley7vn6e2886	cs2zr31rp5jlhnd	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:21:32+00	2026-02-09 18:21:32+00
l1bg7owc3d6w2z7	\N	bt	t	\N	ch9wfw8yzj4yzlf	mko9nvxci0pz4dd	cfjg9mlzkwehm1g	cmiuaf9abst33dy	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:29:11+00	2026-02-09 18:29:11+00
l33xtg1mltsic17	\N	hm	t	\N	cfdmjgmx05n40su	md4f4x5bej6pcfo	cfjg9mlzkwehm1g	cmiuaf9abst33dy	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:29:11+00	2026-02-09 18:29:11+00
lyy1lf4bk227gog	\N	bt	t	\N	c3wwelfkh14yr85	mizgezntumu0w42	coa8hstes7jqmmm	cydwridzimubwq2	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:29:11+00	2026-02-09 18:29:11+00
lcdgjud7nyw7ylb	\N	hm	t	\N	capd7u5lhggawnz	md4f4x5bej6pcfo	coa8hstes7jqmmm	cydwridzimubwq2	\N	\N	\N	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:29:11+00	2026-02-09 18:29:11+00
ly5tjb1egka75r9	\N	mm	t	\N	cbwarj2unek0fx7	mko9nvxci0pz4dd	cydwridzimubwq2	cmiuaf9abst33dy	md4f4x5bej6pcfo	coa8hstes7jqmmm	cfjg9mlzkwehm1g	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:29:11+00	2026-02-09 18:29:11+00
l7lb91c55wx4bs8	\N	mm	t	\N	cfjdmoaypas3ot4	mizgezntumu0w42	cmiuaf9abst33dy	cydwridzimubwq2	md4f4x5bej6pcfo	cfjg9mlzkwehm1g	coa8hstes7jqmmm	\N	\N	\N	\N	\N	pupuc6ugup9dm03	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:29:11+00	2026-02-09 18:29:11+00
llbhsxgan0i488w	\N	bt	t	\N	c5kvk0hg3to1zhy	mg8glgpealdlzio	cd9tr4kyk3z7egt	cms65bharp4uhnd	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
ldxq6v2lcjtt9fi	\N	hm	t	\N	cw3yhgw61wgtv4s	mqy196heavkuj1e	cd9tr4kyk3z7egt	cms65bharp4uhnd	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
ls5i0gfgob6afaf	\N	bt	t	\N	cku5520yux9lekg	mxkvccdz2e8k27r	cpjjcxt0ijinu23	cbz8mnuo2l8m3o1	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
ltovqxfxeix2ych	\N	hm	t	\N	cp5fywmukyzpoh7	mqy196heavkuj1e	cpjjcxt0ijinu23	cbz8mnuo2l8m3o1	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
lgauvk1zvopem1k	\N	mm	t	\N	czyh7mb08nyb6d8	mg8glgpealdlzio	cbz8mnuo2l8m3o1	cms65bharp4uhnd	mqy196heavkuj1e	cpjjcxt0ijinu23	cd9tr4kyk3z7egt	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
lugmh64zfd6mfjl	\N	mm	t	\N	cc2tzrc5ua5jca6	mxkvccdz2e8k27r	cms65bharp4uhnd	cbz8mnuo2l8m3o1	mqy196heavkuj1e	cd9tr4kyk3z7egt	cpjjcxt0ijinu23	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
ltcmmc18jzre577	\N	bt	t	\N	chkdw667n70hpj3	m2s591s1lnxfu6a	clmedcl82wbomk2	ck3avnsr92u5m29	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
ln2w94mrlpy0qcm	\N	hm	t	\N	clnt0ubbrm5iu67	mujx6juym4kwxgi	clmedcl82wbomk2	ck3avnsr92u5m29	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
lefqzjyx8hwefcb	\N	bt	t	\N	c8ep02qv4kehxmv	mxkvccdz2e8k27r	cobsxoav39tkupt	cbz8mnuo2l8m3o1	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
l0uej4t8gd8yv3h	\N	hm	t	\N	cpo3d6df3wmx7gj	mujx6juym4kwxgi	cobsxoav39tkupt	cbz8mnuo2l8m3o1	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
lqds8ash3g42idw	\N	mm	t	\N	c08ktvsgypu9m9o	m2s591s1lnxfu6a	cbz8mnuo2l8m3o1	ck3avnsr92u5m29	mujx6juym4kwxgi	cobsxoav39tkupt	clmedcl82wbomk2	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
l57u8nbljg43cac	\N	mm	t	\N	ctw9ifw88oex0qo	mxkvccdz2e8k27r	ck3avnsr92u5m29	cbz8mnuo2l8m3o1	mujx6juym4kwxgi	clmedcl82wbomk2	cobsxoav39tkupt	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
lxcpimv0nkw5otq	\N	bt	t	\N	ckky9x1lnhrnrf1	m3w5kh70kk3c2l0	c9pe06neephs7nb	cg3d80bkjn88fh0	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
las37ngtx3xuju8	\N	hm	t	\N	cu1g4ukt1xot671	m5rlxcrg06scr7z	c9pe06neephs7nb	cg3d80bkjn88fh0	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
l31ospv4d0ayw02	\N	bt	t	\N	c9v7u7yugmbv3hd	mxkvccdz2e8k27r	cigg9fsnzbtadn0	cbz8mnuo2l8m3o1	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
l503ad66rdff6n9	\N	hm	t	\N	c9jrg9srm28mowl	m5rlxcrg06scr7z	cigg9fsnzbtadn0	cbz8mnuo2l8m3o1	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
l95zvh8dmdv4x4z	\N	mm	t	\N	c5bh9b3o6kc0c3l	m3w5kh70kk3c2l0	cbz8mnuo2l8m3o1	cg3d80bkjn88fh0	m5rlxcrg06scr7z	cigg9fsnzbtadn0	c9pe06neephs7nb	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
lacagmjh08s31nh	\N	mm	t	\N	cgvw6sc7ktb7tua	mxkvccdz2e8k27r	cg3d80bkjn88fh0	cbz8mnuo2l8m3o1	m5rlxcrg06scr7z	c9pe06neephs7nb	cigg9fsnzbtadn0	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
lijolml8yk8wedf	\N	bt	t	\N	c800f4bexya0eua	m2s591s1lnxfu6a	cfpahetg08r0ttj	ck3avnsr92u5m29	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
lwk9x426i3stl6q	\N	hm	t	\N	cf2k2yrggfnmuc8	mljwzfc2a38b60h	cfpahetg08r0ttj	ck3avnsr92u5m29	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
ltk1yqp5a0u5pyt	\N	bt	t	\N	ch0obw9pmwvbrxh	mg8glgpealdlzio	cd5za1mkxz2emxj	cms65bharp4uhnd	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
lqtvlnw10skkinf	\N	hm	t	\N	c2jh7ruj62tad2t	mljwzfc2a38b60h	cd5za1mkxz2emxj	cms65bharp4uhnd	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
l8o0x9i4yhqle61	\N	mm	t	\N	cpodsuifpnpd2fh	m2s591s1lnxfu6a	cms65bharp4uhnd	ck3avnsr92u5m29	mljwzfc2a38b60h	cd5za1mkxz2emxj	cfpahetg08r0ttj	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
l9ldjzu3ft2ahbi	\N	mm	t	\N	csj1yf0mmbovzpf	mg8glgpealdlzio	ck3avnsr92u5m29	cms65bharp4uhnd	mljwzfc2a38b60h	cfpahetg08r0ttj	cd5za1mkxz2emxj	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
lz0mbe35twct3iw	\N	bt	t	\N	crg7nfp9olntk34	m3g9kou5r88eiuh	c1gtvlmujcc1u6u	c18jtstzhnma8fm	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
lxds2jwsd5f0jq4	\N	hm	t	\N	cd5umle6gt12pk0	mxa4kgd3chtt5j3	c1gtvlmujcc1u6u	c18jtstzhnma8fm	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
lsjsjuqigxvpe09	\N	bt	t	\N	ceamwkdlfa0h3pk	mp95ctr4880xk7r	c65mmf5ls3ttmu5	cqw4osstvnidbdx	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
l140g13ogvnuwks	\N	hm	t	\N	cp51ox8m3kcvkfj	mxa4kgd3chtt5j3	c65mmf5ls3ttmu5	cqw4osstvnidbdx	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
leamcy5o1s4nwqk	\N	mm	t	\N	cdf69h02znto6yx	m3g9kou5r88eiuh	cqw4osstvnidbdx	c18jtstzhnma8fm	mxa4kgd3chtt5j3	c65mmf5ls3ttmu5	c1gtvlmujcc1u6u	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
lnqozh7guggl4rb	\N	mm	t	\N	c4e0ek1a9kpk2sz	mp95ctr4880xk7r	c18jtstzhnma8fm	cqw4osstvnidbdx	mxa4kgd3chtt5j3	c1gtvlmujcc1u6u	c65mmf5ls3ttmu5	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
lqiq64i1ctjndg7	\N	bt	t	\N	cew6e8ajouj98ks	muktwldhfn4x6gi	cspixnw7wg80jr8	c79yuvg7344emms	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
lmyotzldmsfnu24	\N	hm	t	\N	cfeqvvbh4fun0qf	m1yk0s3vo310v22	cspixnw7wg80jr8	c79yuvg7344emms	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
lypmmvn867j9aqs	\N	bt	t	\N	cexr97lomgc1b63	mp95ctr4880xk7r	ctu4cm757xqa7ia	cqw4osstvnidbdx	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
ljwo8w46gd2dno9	\N	hm	t	\N	ct274vvmpthxt4f	m1yk0s3vo310v22	ctu4cm757xqa7ia	cqw4osstvnidbdx	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
l3g3t5usxvvt4cc	\N	mm	t	\N	c3ly8gfl78g4f7n	muktwldhfn4x6gi	cqw4osstvnidbdx	c79yuvg7344emms	m1yk0s3vo310v22	ctu4cm757xqa7ia	cspixnw7wg80jr8	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
luwl8cldopsk968	\N	mm	t	\N	cu1owbs99nlqler	mp95ctr4880xk7r	c79yuvg7344emms	cqw4osstvnidbdx	m1yk0s3vo310v22	cspixnw7wg80jr8	ctu4cm757xqa7ia	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
lk2aisu68rw22xr	\N	bt	t	\N	cdanxa9nu86ig4q	muktwldhfn4x6gi	cczsixmoss6rgkc	c79yuvg7344emms	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
l2n3rwdr65nwexq	\N	hm	t	\N	ca5m0kcy6pudper	mt90g3ieje9tawr	cczsixmoss6rgkc	c79yuvg7344emms	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
l76be1a2i3aukvy	\N	bt	t	\N	czayma06hse2p3h	m3g9kou5r88eiuh	cod9djkey7gmp9b	c18jtstzhnma8fm	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
l960o3j3t2ip58w	\N	hm	t	\N	cnu7t9pv5j02qgg	mt90g3ieje9tawr	cod9djkey7gmp9b	c18jtstzhnma8fm	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
lrgzadqo3dn2d47	\N	mm	t	\N	ccrzmz4rln7djs3	muktwldhfn4x6gi	c18jtstzhnma8fm	c79yuvg7344emms	mt90g3ieje9tawr	cod9djkey7gmp9b	cczsixmoss6rgkc	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
l63o7grxudih338	\N	mm	t	\N	c4wmq2hyfjp8vso	m3g9kou5r88eiuh	c79yuvg7344emms	c18jtstzhnma8fm	mt90g3ieje9tawr	cczsixmoss6rgkc	cod9djkey7gmp9b	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
lz9e3dooaadbt47	\N	bt	t	\N	cljyggnz6diej80	m3w5kh70kk3c2l0	c68hy4xu4uknswl	cg3d80bkjn88fh0	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
llbt2jzppr0af71	\N	hm	t	\N	ch4ldryiu5i50e0	m5vrl3zsxmrxcsy	c68hy4xu4uknswl	cg3d80bkjn88fh0	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
ls7x907jx8ob9ud	\N	bt	t	\N	cu2h2moy3zh6qt1	muktwldhfn4x6gi	c01ioaaedmao998	c79yuvg7344emms	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
l3q3ijfijb2fv2o	\N	hm	t	\N	cq5zzm2h798z443	m5vrl3zsxmrxcsy	c01ioaaedmao998	c79yuvg7344emms	\N	\N	\N	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
l507nr8n5ey7zv8	\N	mm	t	\N	cwmwxtsga3qwy43	m3w5kh70kk3c2l0	c79yuvg7344emms	cg3d80bkjn88fh0	m5vrl3zsxmrxcsy	c01ioaaedmao998	c68hy4xu4uknswl	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
la870w09ojglxg3	\N	mm	t	\N	cd1mddqfxnugaq1	muktwldhfn4x6gi	cg3d80bkjn88fh0	c79yuvg7344emms	m5vrl3zsxmrxcsy	c68hy4xu4uknswl	c01ioaaedmao998	\N	\N	\N	\N	\N	p3llodmezayxe7x	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
\.


--
-- Data for Name: nc_col_rollup_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_col_rollup_v2 (id, fk_column_id, fk_relation_column_id, fk_rollup_column_id, rollup_function, deleted, base_id, fk_workspace_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_col_select_options_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_col_select_options_v2 (id, fk_column_id, title, color, "order", base_id, fk_workspace_id, created_at, updated_at) FROM stdin;
skrvwi94pyfdehf	c0jnjk2odll3lua	 ADR Box	#ffdaf6	1	pupuc6ugup9dm03	wqid8bq2	2026-02-09 16:58:32+00	2026-02-09 16:58:32+00
s3wmuyf1hg07i35	c0jnjk2odll3lua	Tankfahrzeug	#fee2d5	2	pupuc6ugup9dm03	wqid8bq2	2026-02-09 16:58:32+00	2026-02-09 16:58:32+00
sx6gy30ybd94d4f	c0jnjk2odll3lua	Kühlkoffer	#ffeab6	3	pupuc6ugup9dm03	wqid8bq2	2026-02-09 16:58:32+00	2026-02-09 16:58:32+00
sua1k6bn5g2u24w	c0jnjk2odll3lua	Containerchassis	#d1f7c4	4	pupuc6ugup9dm03	wqid8bq2	2026-02-09 16:58:32+00	2026-02-09 16:58:32+00
sidrnizbklg89hf	c0jnjk2odll3lua	Plane/Tautliner	#ede2fe	5	pupuc6ugup9dm03	wqid8bq2	2026-02-09 16:58:32+00	2026-02-09 16:58:32+00
so3snspelzwzckp	c0jnjk2odll3lua	Kastenwagen	#eeeeee	6	pupuc6ugup9dm03	wqid8bq2	2026-02-09 16:58:32+00	2026-02-09 16:58:32+00
sx1nu0aozpdpshy	cqn3y5r2szclrrt	1	#cfdffe	1	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:00:41+00	2026-02-09 17:00:41+00
szlw6ktnthmnk3m	cqn3y5r2szclrrt	2	#d0f1fd	2	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:00:41+00	2026-02-09 17:00:41+00
s54tbxmlkx60fji	cqn3y5r2szclrrt	3	#c2f5e8	3	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:00:41+00	2026-02-09 17:00:41+00
som3dujjj2avr3i	cqn3y5r2szclrrt	4.1	#ffdaf6	4	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:00:41+00	2026-02-09 17:00:41+00
sxr6ld3gbt6678p	cqn3y5r2szclrrt	4.2	#ffdce5	5	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:00:41+00	2026-02-09 17:00:41+00
snphtt9w11oqggs	cqn3y5r2szclrrt	4.3	#fee2d5	6	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:00:41+00	2026-02-09 17:00:41+00
szuh26m6ay4qngv	cqn3y5r2szclrrt	5.1	#ffeab6	7	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:00:41+00	2026-02-09 17:00:41+00
sgz2wegv0v4ddlo	cqn3y5r2szclrrt	5.2	#d1f7c4	8	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:00:41+00	2026-02-09 17:00:41+00
s32aifsbrylfk6w	cqn3y5r2szclrrt	6.1	#ede2fe	9	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:00:41+00	2026-02-09 17:00:41+00
s4mlzoalwmy7m84	cqn3y5r2szclrrt	6.2	#eeeeee	10	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:00:41+00	2026-02-09 17:00:41+00
sqsjei1jyxwunml	cqn3y5r2szclrrt	7	#cfdffe	11	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:00:41+00	2026-02-09 17:00:41+00
s9c50hismg1fi1r	cqn3y5r2szclrrt	8	#d0f1fd	12	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:00:41+00	2026-02-09 17:00:41+00
si7ort1wf1nzcs1	cqn3y5r2szclrrt	9	#c2f5e8	13	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:00:41+00	2026-02-09 17:00:41+00
sczyv50l34r0z2w	codggsij3km6lx8	B	#cfdffe	1	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:05:53+00	2026-02-09 17:05:53+00
sxdstnekyhoco1g	codggsij3km6lx8	C	#d0f1fd	2	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:05:53+00	2026-02-09 17:05:53+00
s6dam9wtskr8mld	codggsij3km6lx8	C+E	#c2f5e8	3	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:05:53+00	2026-02-09 17:05:53+00
s9r01b0ijlmzt36	codggsij3km6lx8	D	#ffdaf6	4	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:05:53+00	2026-02-09 17:05:53+00
szsidxpste3wq1d	czg2afeptb6je6u	1	#cfdffe	1	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:08:07+00	2026-02-09 17:08:07+00
s2gjev3p0dj3r6n	czg2afeptb6je6u	2	#d0f1fd	2	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:08:07+00	2026-02-09 17:08:07+00
s5spll5yo493qxb	czg2afeptb6je6u	3	#c2f5e8	3	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:08:07+00	2026-02-09 17:08:07+00
s8ukpzekse8dp0i	czg2afeptb6je6u	4.1	#ffdaf6	4	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:08:07+00	2026-02-09 17:08:07+00
s087p082si8rln6	czg2afeptb6je6u	4.2	#ffdce5	5	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:08:07+00	2026-02-09 17:08:07+00
szwd1tx8voyzjj3	czg2afeptb6je6u	4.3	#fee2d5	6	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:08:07+00	2026-02-09 17:08:07+00
sw6letd9ln7jp59	czg2afeptb6je6u	5.1	#ffeab6	7	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:08:07+00	2026-02-09 17:08:07+00
spsl195ptm9d50r	czg2afeptb6je6u	5.2	#d1f7c4	8	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:08:07+00	2026-02-09 17:08:07+00
sqyw506dug3dtqm	czg2afeptb6je6u	6.1	#ede2fe	9	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:08:07+00	2026-02-09 17:08:07+00
sg909qlidoi6ix5	czg2afeptb6je6u	6.2	#eeeeee	10	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:08:07+00	2026-02-09 17:08:07+00
sscskosq8lvutfy	czg2afeptb6je6u	7	#cfdffe	11	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:08:07+00	2026-02-09 17:08:07+00
s9mp1lzb1msnxpy	czg2afeptb6je6u	8	#d0f1fd	12	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:08:07+00	2026-02-09 17:08:07+00
somb2o7st0bicxx	czg2afeptb6je6u	9	#c2f5e8	13	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:08:07+00	2026-02-09 17:08:07+00
sk6jqkj5h775kqh	c6zwoo8y63ltyv3	1	#cfdffe	1	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:16:41+00	2026-02-09 17:16:41+00
sq5etvi9tsz76kh	c6zwoo8y63ltyv3	2	#d0f1fd	2	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:16:41+00	2026-02-09 17:16:41+00
sxwghqiqy2katat	c6zwoo8y63ltyv3	3	#c2f5e8	3	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:16:41+00	2026-02-09 17:16:41+00
skr6o5c13symjfv	c6zwoo8y63ltyv3	4.1	#ffdaf6	4	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:16:41+00	2026-02-09 17:16:41+00
syo2dpd4ypqnanb	c6zwoo8y63ltyv3	4.2	#ffdce5	5	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:16:41+00	2026-02-09 17:16:41+00
sfpxbprqsdlfdsr	c6zwoo8y63ltyv3	4.3	#fee2d5	6	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:16:41+00	2026-02-09 17:16:41+00
se4kz6k12kyw84r	c6zwoo8y63ltyv3	5.1	#ffeab6	7	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:16:41+00	2026-02-09 17:16:41+00
slncgarvrllvf0v	c6zwoo8y63ltyv3	5.2	#d1f7c4	8	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:16:41+00	2026-02-09 17:16:41+00
s7eq5yxl2m5yth1	c6zwoo8y63ltyv3	6.1	#ede2fe	9	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:16:41+00	2026-02-09 17:16:41+00
sqmrs37i3f5j5qs	c6zwoo8y63ltyv3	6.2	#eeeeee	10	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:16:41+00	2026-02-09 17:16:41+00
sb2qivfr3uq5yh6	c6zwoo8y63ltyv3	7	#cfdffe	11	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:16:41+00	2026-02-09 17:16:41+00
sdkfxqo71018iqr	c6zwoo8y63ltyv3	8	#d0f1fd	12	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:16:41+00	2026-02-09 17:16:41+00
s59k4wuj7cwyljk	c6zwoo8y63ltyv3	9	#c2f5e8	13	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:16:41+00	2026-02-09 17:16:41+00
srala16g8tyki6r	cd389hjyxspaaxb	New	#cfdffe	1	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:18:49+00	2026-02-09 17:18:49+00
s66zspwmlczxr3e	cd389hjyxspaaxb	Accepted	#d0f1fd	2	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:18:49+00	2026-02-09 17:18:49+00
s1bhzwksbgotwho	cd389hjyxspaaxb	Quoted	#c2f5e8	3	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:18:49+00	2026-02-09 17:18:49+00
skdhz9nzrow80e3	cc24y3hh7vpd4dj	Email	#cfdffe	1	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:19:13+00	2026-02-09 17:19:13+00
srik274qbnohwjn	cc24y3hh7vpd4dj	Web Form	#d0f1fd	2	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:19:13+00	2026-02-09 17:19:13+00
sbpo1gl0hej8q3k	cc24y3hh7vpd4dj	Phone	#c2f5e8	3	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:19:13+00	2026-02-09 17:19:13+00
s5b2waie6k39mrr	cmy7ib7lxogr0wy	Planned	#cfdffe	1	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:21:06+00	2026-02-09 17:21:06+00
sv0gygymfaw9b7m	cmy7ib7lxogr0wy	In Progress	#d0f1fd	2	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:21:06+00	2026-02-09 17:21:06+00
szs36xd6yj2j4bt	cmy7ib7lxogr0wy	Completed	#c2f5e8	3	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:21:06+00	2026-02-09 17:21:06+00
suemy9dbvkvtqwj	ciizexx8gnmmh8u	ADR	#cfdffe	1	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:21:51+00	2026-02-09 17:21:51+00
su3v2tc5xgsgwg6	ciizexx8gnmmh8u	Other	#d0f1fd	2	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:21:51+00	2026-02-09 17:21:51+00
s8z8yhl88vr2o0v	ciizexx8gnmmh8u	Pallet	#c2f5e8	3	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:21:51+00	2026-02-09 17:21:51+00
ss1fub5cia5fv3w	ciizexx8gnmmh8u	Box	#ffdaf6	4	pupuc6ugup9dm03	wqid8bq2	2026-02-09 17:21:51+00	2026-02-09 17:21:51+00
srrmu3uqmnycn54	co9080h9kgxik6c	 ADR Box	#ffdaf6	1	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
su0wuopi1ifgcqb	co9080h9kgxik6c	Tankfahrzeug	#fee2d5	2	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
sr87qzgez26hayl	co9080h9kgxik6c	Kühlkoffer	#ffeab6	3	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
si3qt9xl2tk5hrv	co9080h9kgxik6c	Containerchassis	#d1f7c4	4	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
s0abgc9cttt3fik	co9080h9kgxik6c	Plane/Tautliner	#ede2fe	5	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
s0qtk8shn834njz	co9080h9kgxik6c	Kastenwagen	#eeeeee	6	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
sma4wc8y1biu2c7	cl36dscpbhaygb4	1	#cfdffe	1	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
scu1fl0lgvzgnqj	cl36dscpbhaygb4	2	#d0f1fd	2	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
spio1i52fiw2u2i	cl36dscpbhaygb4	3	#c2f5e8	3	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
slht2l2utktympv	cl36dscpbhaygb4	4.1	#ffdaf6	4	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
sfqomba23u77z3a	cl36dscpbhaygb4	4.2	#ffdce5	5	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
sqk77s93m3tn606	cl36dscpbhaygb4	4.3	#fee2d5	6	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
sp3pok6gzqjtvcz	cl36dscpbhaygb4	5.1	#ffeab6	7	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
sk4b0a94itsgaeo	cl36dscpbhaygb4	5.2	#d1f7c4	8	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
sufghf3s22016zb	cl36dscpbhaygb4	6.1	#ede2fe	9	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
suu8y5wxv9gdy56	cl36dscpbhaygb4	6.2	#eeeeee	10	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
s97d5gvs6wpf584	cl36dscpbhaygb4	7	#cfdffe	11	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
s3b9bz23pw11ge4	cl36dscpbhaygb4	8	#d0f1fd	12	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
sy14czpav3d07xn	cl36dscpbhaygb4	9	#c2f5e8	13	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
shx4emrsjb1qg90	c9uunk3hcho4ah6	B	#cfdffe	1	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
s93pz7k7pdfpqi2	c9uunk3hcho4ah6	C	#d0f1fd	2	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
s66l9c0ftp1uxac	c9uunk3hcho4ah6	C+E	#c2f5e8	3	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
sb6xbg1baaxn9qf	c9uunk3hcho4ah6	D	#ffdaf6	4	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
sbjx251i6go52v5	c9bt0ufh57afkmc	1	#cfdffe	1	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
s9ueywtxugplkdp	c9bt0ufh57afkmc	2	#d0f1fd	2	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
ss3mol8mvkcwpdf	c9bt0ufh57afkmc	3	#c2f5e8	3	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
spjz37knjm7psp2	c9bt0ufh57afkmc	4.1	#ffdaf6	4	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
s5ko4hpxg39exu4	c9bt0ufh57afkmc	4.2	#ffdce5	5	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
s54265qr8s1k54t	c9bt0ufh57afkmc	4.3	#fee2d5	6	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
s097matxjyl2y6n	c9bt0ufh57afkmc	5.1	#ffeab6	7	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
sorelasvjq1jryq	c9bt0ufh57afkmc	5.2	#d1f7c4	8	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
s4yelpqwabw416k	c9bt0ufh57afkmc	6.1	#ede2fe	9	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
sar2s1abhm0puwm	c9bt0ufh57afkmc	6.2	#eeeeee	10	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
sowta40pbcxjmlg	c9bt0ufh57afkmc	7	#cfdffe	11	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
sfoplmg1gore4gb	c9bt0ufh57afkmc	8	#d0f1fd	12	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
sbfovyxa389fc98	c9b52pesups302t	1	#cfdffe	1	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
s3yo3fhosc998km	c9b52pesups302t	2	#d0f1fd	2	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
s8zflu4i7fh3anb	c9b52pesups302t	3	#c2f5e8	3	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
sxr3pdvupa20aal	c9b52pesups302t	4.1	#ffdaf6	4	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
ssvyotuu06najzy	c9bt0ufh57afkmc	9	#c2f5e8	13	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
slmrisk6gum13jp	c9b52pesups302t	4.2	#ffdce5	5	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
sy2bxrq1fpczhzm	c9b52pesups302t	4.3	#fee2d5	6	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
seopkyq4h6por6u	c9b52pesups302t	5.1	#ffeab6	7	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
swmuvq3s52rv43t	c9b52pesups302t	5.2	#d1f7c4	8	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
sn15jrth4h1e0id	c9b52pesups302t	6.1	#ede2fe	9	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
smtww7q8h9arj4k	c9b52pesups302t	6.2	#eeeeee	10	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
sao3sgmduva19gb	c9b52pesups302t	7	#cfdffe	11	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
sj3adtzlpzpiwoa	c9b52pesups302t	8	#d0f1fd	12	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
s9ves2yv9zfr77i	c9b52pesups302t	9	#c2f5e8	13	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
s422km9kn1fxqou	cq6lnt43w69vfhp	New	#cfdffe	1	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
s0lhong32sksfpb	cq6lnt43w69vfhp	Accepted	#d0f1fd	2	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
s8y4oimb0lfdi2t	cq6lnt43w69vfhp	Quoted	#c2f5e8	3	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
sougcq5hjt90rb7	cru5revvvw9trzl	Email	#cfdffe	1	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
se0dp5ywmyb573a	cru5revvvw9trzl	Web Form	#d0f1fd	2	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
s36ht2baetn7ryh	cru5revvvw9trzl	Phone	#c2f5e8	3	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
s2c6xypbn8fncxf	cbl4sswrm0gq15b	Planned	#cfdffe	1	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
snw04kaix1jd9n2	cbl4sswrm0gq15b	In Progress	#d0f1fd	2	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
se5mcl5wwgkdl0y	cbl4sswrm0gq15b	Completed	#c2f5e8	3	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
s8r7wneopqkfblc	cgk36zdeuu6mlrc	ADR	#cfdffe	1	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
swj0k8zwra6pz71	cgk36zdeuu6mlrc	Other	#d0f1fd	2	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
sv7hwos25s03apx	cgk36zdeuu6mlrc	Pallet	#c2f5e8	3	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
s5ige02dw5si0oa	cgk36zdeuu6mlrc	Box	#ffdaf6	4	p3llodmezayxe7x	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
\.


--
-- Data for Name: nc_columns_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_columns_v2 (id, source_id, base_id, fk_model_id, title, column_name, uidt, dt, np, ns, clen, cop, pk, pv, rqd, un, ct, ai, "unique", cdf, cc, csn, dtx, dtxp, dtxs, au, validate, virtual, deleted, system, "order", meta, description, readonly, fk_workspace_id, custom_index_name, created_at, updated_at, internal_meta) FROM stdin;
c7jqmgjul0mr8vd	b5b4nwkmm6723gc	ptbstfo5b36htsq	mle5vnsx04y6xo2	Id	id	ID	int4	\N	\N	\N	\N	t	\N	t	t	\N	t	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	f	1	{}	\N	f	wqid8bq2	\N	2026-02-04 13:41:42+00	2026-02-04 13:41:42+00	\N
cjakigzauy8917c	b5b4nwkmm6723gc	ptbstfo5b36htsq	mle5vnsx04y6xo2	CreatedAt	created_at	CreatedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	2	{}	\N	f	wqid8bq2	\N	2026-02-04 13:41:42+00	2026-02-04 13:41:42+00	\N
cq2b9damb5urruk	b5b4nwkmm6723gc	ptbstfo5b36htsq	mle5vnsx04y6xo2	UpdatedAt	updated_at	LastModifiedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	3	{}	\N	f	wqid8bq2	\N	2026-02-04 13:41:42+00	2026-02-04 13:41:42+00	\N
ctm8lkzhqqpsqin	b5b4nwkmm6723gc	ptbstfo5b36htsq	mle5vnsx04y6xo2	nc_created_by	created_by	CreatedBy	character varying	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	4	{}	\N	f	wqid8bq2	\N	2026-02-04 13:41:42+00	2026-02-04 13:41:42+00	\N
c1hvjefion51jma	b5b4nwkmm6723gc	ptbstfo5b36htsq	mle5vnsx04y6xo2	nc_updated_by	updated_by	LastModifiedBy	character varying	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	5	{}	\N	f	wqid8bq2	\N	2026-02-04 13:41:42+00	2026-02-04 13:41:42+00	\N
c0twc61pibclxe2	b5b4nwkmm6723gc	ptbstfo5b36htsq	mle5vnsx04y6xo2	nc_order	nc_order	Order	numeric	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	6	{}	\N	f	wqid8bq2	\N	2026-02-04 13:41:42+00	2026-02-04 13:41:42+00	\N
cx0wkox5z2pekwl	b5b4nwkmm6723gc	ptbstfo5b36htsq	mle5vnsx04y6xo2	Title	title	SingleLineText	text	\N	\N	\N	\N	f	t	f	f	\N	f	\N	\N	\N	\N	specificType			\N	\N	\N	\N	\N	7	{}	\N	f	wqid8bq2	\N	2026-02-04 13:41:42+00	2026-02-04 13:41:42+00	\N
cyziwb8livhn9x3	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	Id	id	ID	int4	\N	\N	\N	\N	t	\N	t	t	\N	t	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	f	1	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00	\N
c5d6v51kycylviz	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	CreatedAt	created_at	CreatedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	2	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00	\N
cvty1pbubjyvast	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	UpdatedAt	updated_at	LastModifiedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	3	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00	\N
c5duftdm5yrdqrs	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	nc_created_by	created_by	CreatedBy	character varying	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	4	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00	\N
c8bd3kxq0bin69g	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	nc_updated_by	updated_by	LastModifiedBy	character varying	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	5	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00	\N
ckwg9jsnem6d812	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	nc_order	nc_order	Order	numeric	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	6	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00	\N
ctit2jdxf8xi0y6	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	Company Name	Company_Name	SingleLineText	text	\N	\N	\N	\N	f	t	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	7	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00	\N
cyf95ycuc1dir5x	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	VAT ID	VAT_ID	SingleLineText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	8	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00	\N
chttsusxo5xpqq6	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	Address	Address	SingleLineText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	9	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00	\N
c6gzyjny49zofc9	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	Notes	Notes	SingleLineText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	12	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00	\N
cchwvjoyq7bj1hk	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	Id	id	ID	int4	\N	\N	\N	\N	t	\N	t	t	\N	t	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	f	1	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00	\N
ciu86ephgoccs1j	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	CreatedAt	created_at	CreatedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	2	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00	\N
c63yc9sjogxsgbp	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	UpdatedAt	updated_at	LastModifiedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	3	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00	\N
cuo2921tvs7yj7x	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	nc_created_by	created_by	CreatedBy	character varying	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	4	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00	\N
c4s16wqlszj77kj	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	nc_updated_by	updated_by	LastModifiedBy	character varying	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	5	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00	\N
cllzyshti3ft6uw	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	nc_order	nc_order	Order	numeric	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	6	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00	\N
c2nbpggrn6owwf0	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	Full Name	Full_Name	SingleLineText	text	\N	\N	\N	\N	f	t	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	7	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00	\N
c6xwf0zvnc0i1wv	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	Position	Position	SingleLineText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	8	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00	\N
c34quk1et4y5pcz	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	Email	Email	Email	character varying	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	{"func":["isEmail"],"args":[""],"msg":["Validation failed : isEmail"]}	\N	\N	\N	10	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 14:03:20+00	\N
ccdtc2e1rudxdyi	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	Phone	Phone	PhoneNumber	character varying	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	{"func":["isMobilePhone"],"args":[""],"msg":["Validation failed : isMobilePhone"]}	\N	\N	\N	11	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 14:04:19+00	\N
chs7p910b3q6yqm	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	Id	id	ID	int4	\N	\N	\N	\N	t	\N	t	t	\N	t	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	f	1	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00	\N
cb2lea7uclll4xr	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	CreatedAt	created_at	CreatedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	2	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00	\N
cprrkoqjjy9l5w4	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	UpdatedAt	updated_at	LastModifiedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	3	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00	\N
cxy2p323hd0qxqy	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	nc_created_by	created_by	CreatedBy	character varying	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	4	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00	\N
c1htv3a08clctde	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	nc_updated_by	updated_by	LastModifiedBy	character varying	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	5	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00	\N
cq9bcqdp1uddy8v	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	nc_order	nc_order	Order	numeric	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	6	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00	\N
cdfgt6v8nwr9y3i	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	Registration Number	Registration_Number	SingleLineText	text	\N	\N	\N	\N	f	t	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	7	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00	\N
cra65d75swysgg2	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	Id	id	ID	int4	\N	\N	\N	\N	t	\N	t	t	\N	t	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	f	1	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:52+00	2026-02-04 14:00:52+00	\N
c5a77avh7ubza4h	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	CreatedAt	created_at	CreatedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	2	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:52+00	2026-02-04 14:00:52+00	\N
c97ngcx7orh3bzb	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	UpdatedAt	updated_at	LastModifiedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	3	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:52+00	2026-02-04 14:00:52+00	\N
c1ugs0ap4yky8o0	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	nc_created_by	created_by	CreatedBy	character varying	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	4	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:52+00	2026-02-04 14:00:52+00	\N
c16srdwhzz0a7pp	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	nc_updated_by	updated_by	LastModifiedBy	character varying	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	5	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:52+00	2026-02-04 14:00:52+00	\N
ca2tjo3nddmel5y	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	nc_order	nc_order	Order	numeric	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	6	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:52+00	2026-02-04 14:00:52+00	\N
cbq31ueyugq2iav	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	Full Name	Full_Name	SingleLineText	text	\N	\N	\N	\N	f	t	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	7	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:52+00	2026-02-04 14:00:52+00	\N
ctfseugejnckr3v	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	Id	id	ID	int4	\N	\N	\N	\N	t	\N	t	t	\N	t	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	f	1	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00	\N
cou2x126i74vb4i	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	CreatedAt	created_at	CreatedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	2	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00	\N
c23coqijztqlony	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	UpdatedAt	updated_at	LastModifiedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	3	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00	\N
cgzz9bqe8zukewh	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	nc_created_by	created_by	CreatedBy	character varying	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	4	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00	\N
cy5q2fosg5ptppw	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	nc_updated_by	updated_by	LastModifiedBy	character varying	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	5	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00	\N
cagos3j9ylye6h0	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	Phone	Phone	PhoneNumber	character varying	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	{"func":["isMobilePhone"],"args":[""],"msg":["Validation failed : isMobilePhone"]}	\N	\N	\N	10	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 14:10:06+00	\N
c6iwsnpecti6kwh	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	Insurance Expiry	Insurance_Expiry	Date	date	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N		\N	\N	\N	15	{"date_format":"YYYY-MM-DD"}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-09 17:01:25+00	\N
ckaouubcd7i4gyu	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	Capacity kg	Capacity_kg	Number	bigint	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N		\N	\N	\N	9	{"isLocaleString":false}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-09 16:58:49+00	\N
c0jnjk2odll3lua	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	Body Type	Body_Type	SingleSelect	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	' ADR Box','Tankfahrzeug','Kühlkoffer','Containerchassis','Plane/Tautliner','Kastenwagen'	 	\N		\N	\N	\N	8	{"defaultViewColOrder":8,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-09 16:58:32+00	\N
cesdp9nw5n67yxk	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	Capacity m3	Capacity_m3	Number	bigint	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N		\N	\N	\N	10	{"isLocaleString":false}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-09 16:59:01+00	\N
cq97xn3cuh3mohw	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	Pallet Spaces	Pallet_Spaces	Number	bigint	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N		\N	\N	\N	11	{"isLocaleString":false}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-09 16:59:19+00	\N
cqn3y5r2szclrrt	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	ADR Classes	ADR_Classes	MultiSelect	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	'1','2','3','4.1','4.2','4.3','5.1','5.2','6.1','6.2','7','8','9'	 	\N		\N	\N	\N	13	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-09 17:00:41+00	\N
ca5tehxb5qu3trm	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	Inspection Date	Inspection_Date	Date	date	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N		\N	\N	\N	14	{"date_format":"YYYY-MM-DD","defaultViewColOrder":14,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-09 17:00:57+00	\N
c4zvkx95ndqle16	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	Notes	Notes	LongText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N		\N	\N	\N	16	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-09 17:01:37+00	\N
cqrt8an0urr8w35	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	Phone	Phone	PhoneNumber	character varying	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	{"func":["isMobilePhone"],"args":[""],"msg":["Validation failed : isMobilePhone"]}	\N	\N	\N	8	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:52+00	2026-02-09 17:05:20+00	\N
czg2afeptb6je6u	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	ADR Classes	ADR_Classes	MultiSelect	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	'1','2','3','4.1','4.2','4.3','5.1','5.2','6.1','6.2','7','8','9'	 	\N		\N	\N	\N	11	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:52+00	2026-02-09 17:08:07+00	\N
cqjeqj5psqekap9	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	ADR	ADR	Checkbox	bool	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	false	\N	\N	specificType	\N	\N	\N		\N	\N	\N	10	{"iconIdx":1,"icon":{"checked":"mdi-check-circle-outline","unchecked":"mdi-checkbox-blank-circle-outline"},"color":"#27D665","defaultViewColOrder":10,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-04 14:00:52+00	2026-02-09 17:06:21+00	\N
choxwcuo6pmcyk6	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	ADR Expiry Date	ADR_Expiry_Date	Date	date	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N		\N	\N	\N	12	{"date_format":"YYYY-MM-DD"}	\N	f	wqid8bq2	\N	2026-02-04 14:00:52+00	2026-02-09 17:08:18+00	\N
c3uybhwo4d34h36	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	Medical Exam Expiry	Medical_Exam_Expiry	Date	date	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N		\N	\N	\N	13	{"date_format":"YYYY-MM-DD"}	\N	f	wqid8bq2	\N	2026-02-04 14:00:52+00	2026-02-09 17:08:34+00	\N
crc6aim561n4s9s	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	Notes	Notes	LongText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N		\N	\N	\N	15	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:52+00	2026-02-09 17:09:06+00	\N
c29udfv0h7p7jwm	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	nc_order	nc_order	Order	numeric	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	6	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00	\N
cpqf815rcewemca	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	Origin City/Postal	Origin_City_Postal	SingleLineText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	10	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00	\N
co2p76yxmu15j0c	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	Destination City/Postal	Destination_City_Postal	SingleLineText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	11	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00	\N
c235bwvy3tdxwf6	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	Cargo Type	Cargo_Type	SingleLineText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	14	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00	\N
cjghtnwgjnrzevk	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	Dimensions	Dimensions	SingleLineText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	17	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00	\N
cmiuaf9abst33dy	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	Id	id	ID	int4	\N	\N	\N	\N	t	\N	t	t	\N	t	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	f	1	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00	\N
cchcqx0rzyqm1a5	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	CreatedAt	created_at	CreatedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	2	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00	\N
clfgr6vekrae1ao	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	UpdatedAt	updated_at	LastModifiedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	3	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00	\N
c4488jqu1cfwreb	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	nc_created_by	created_by	CreatedBy	character varying	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	4	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00	\N
cxq6pp2ysg4v85k	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	nc_updated_by	updated_by	LastModifiedBy	character varying	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	5	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00	\N
crlqeqpq8zrh94k	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	nc_order	nc_order	Order	numeric	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	6	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00	\N
c77cudldn2ldi4z	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	Origin	Origin	SingleLineText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	8	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00	\N
ct1zt0dav2juhz2	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	Destination	Destination	SingleLineText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	9	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00	\N
cydwridzimubwq2	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	Id	id	ID	int4	\N	\N	\N	\N	t	\N	t	t	\N	t	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	f	1	{}	\N	f	wqid8bq2	\N	2026-02-04 14:01:47+00	2026-02-04 14:01:47+00	\N
cdpwzn80phliz20	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	CreatedAt	created_at	CreatedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	2	{}	\N	f	wqid8bq2	\N	2026-02-04 14:01:47+00	2026-02-04 14:01:47+00	\N
c3u3scecll79398	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	UpdatedAt	updated_at	LastModifiedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	3	{}	\N	f	wqid8bq2	\N	2026-02-04 14:01:47+00	2026-02-04 14:01:47+00	\N
cpagmhhd6g0fcvk	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	nc_created_by	created_by	CreatedBy	character varying	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	4	{}	\N	f	wqid8bq2	\N	2026-02-04 14:01:47+00	2026-02-04 14:01:47+00	\N
cc2llzh7oihvjhk	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	nc_updated_by	updated_by	LastModifiedBy	character varying	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	5	{}	\N	f	wqid8bq2	\N	2026-02-04 14:01:47+00	2026-02-04 14:01:47+00	\N
cl28kb4gtf60kyp	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	nc_order	nc_order	Order	numeric	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	6	{}	\N	f	wqid8bq2	\N	2026-02-04 14:01:47+00	2026-02-04 14:01:47+00	\N
c2l6l8py4xjuu7j	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	Client	Client	SingleLineText	text	\N	\N	\N	\N	f	t	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	7	{}	\N	f	wqid8bq2	\N	2026-02-04 14:01:47+00	2026-02-04 14:01:47+00	\N
chn4jquzl3h28zo	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	Loading Date	Loading_Date	Date	date	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N		\N	\N	\N	12	{"date_format":"YYYY-MM-DD"}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-09 17:11:11+00	\N
c8sm408mq0rdcto	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	Delivery Date	Delivery_Date	Date	date	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N		\N	\N	\N	13	{"date_format":"YYYY-MM-DD"}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-09 17:11:17+00	\N
c0ym69tqbt8gwt3	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	ADR	ADR	Checkbox	bool	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	false	\N	\N	specificType	\N	\N	\N		\N	\N	\N	15	{"iconIdx":1,"icon":{"checked":"mdi-check-circle-outline","unchecked":"mdi-checkbox-blank-circle-outline"},"color":"#52DE84"}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-09 17:13:18+00	\N
cjbz903x16h3fxq	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	Weight kg	Weight_kg	Number	bigint	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N		\N	\N	\N	18	{"isLocaleString":false}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-09 17:17:05+00	\N
cd389hjyxspaaxb	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	Status	Status	SingleSelect	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	'New','Accepted','Quoted'	 	\N		\N	\N	\N	19	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-09 17:18:49+00	\N
cc24y3hh7vpd4dj	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	Source	Source	SingleSelect	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	'Email','Web Form','Phone'	 	\N		\N	\N	\N	20	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-09 17:19:13+00	\N
cmf6l7fe8gjbnxj	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	UTM Source	UTM_Source	SingleLineText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N		\N	\N	\N	21	{"defaultViewColOrder":21,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-09 17:19:26+00	\N
c9o7z61oc3yjk9a	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	Notes	Notes	LongText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N		\N	\N	\N	22	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-09 17:19:40+00	\N
ckfllneskfstzzf	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	Departure Date	Departure_Date	Date	date	\N	\N	\N	\N	f	t	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N		\N	\N	\N	7	{"date_format":"YYYY-MM-DD"}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-09 17:19:59+00	\N
chtfkfr68ef5chk	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	Notes	Notes	LongText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N		\N	\N	\N	13	{}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-09 17:21:15+00	\N
ciizexx8gnmmh8u	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	Unit Type	Unit_Type	SingleSelect	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	'ADR','Other','Pallet','Box'	 	\N		\N	\N	\N	9	{}	\N	f	wqid8bq2	\N	2026-02-04 14:01:47+00	2026-02-09 17:21:51+00	\N
c0c98b5g14umg7j	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	Quantity	Quantity	Number	bigint	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N		\N	\N	\N	10	{"isLocaleString":false}	\N	f	wqid8bq2	\N	2026-02-04 14:01:47+00	2026-02-09 17:22:02+00	\N
czjl2l2p4tdngdk	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	Email	Email	Email	character varying	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	{"func":["isEmail"],"args":[""],"msg":["Validation failed : isEmail"]}	\N	\N	\N	9	{}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 14:09:57+00	\N
cdu655wgil3odmm	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	Primary Contact	Primary_Contact	Checkbox	bool	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	false	\N	\N	specificType	\N	\N	\N		\N	\N	\N	12	{"iconIdx":1,"icon":{"checked":"mdi-check-circle-outline","unchecked":"mdi-checkbox-blank-circle-outline"},"color":"#27D665","defaultViewColOrder":12,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-04 14:11:16+00	\N
c66lc7ur0u96fqs	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	ADR	ADR	Checkbox	bool	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	false	\N	\N	specificType	\N	\N	\N		\N	\N	\N	12	{"iconIdx":1,"icon":{"checked":"mdi-check-circle-outline","unchecked":"mdi-checkbox-blank-circle-outline"},"color":"#27D665","defaultViewColOrder":12,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-04 13:56:02+00	2026-02-09 16:59:40+00	\N
codggsij3km6lx8	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	License Categories	License_Categories	MultiSelect	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	'B','C','C+E','D'	 	\N		\N	\N	\N	9	{"defaultViewColOrder":9,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-04 14:00:52+00	2026-02-09 17:05:53+00	\N
cmn1ybxtu5x8dir	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	Inquiry Date	Inquiry_Date	DateTime	timestamp	\N	\N	\N	\N	f	t	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N		\N	\N	\N	7	{"date_format":"YYYY-MM-DD","time_format":"HH:mm","is12hrFormat":false}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-09 17:09:43+00	\N
c6zwoo8y63ltyv3	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	ADR Class/UN	ADR_Class_UN	MultiSelect	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	'1','2','3','4.1','4.2','4.3','5.1','5.2','6.1','6.2','7','8','9'	 	\N		\N	\N	\N	16	{"defaultViewColOrder":16,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-09 17:16:41+00	\N
cmy7ib7lxogr0wy	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	Status	Status	SingleSelect	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	'Planned','In Progress','Completed'	 	\N		\N	\N	\N	12	{"defaultViewColOrder":12,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-04 14:00:53+00	2026-02-09 17:21:06+00	\N
cz4rzid030j5ukx	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	Cargo Description	Cargo_Description	SingleLineText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N		\N	\N	\N	11	{"defaultViewColOrder":11,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-04 14:01:47+00	2026-02-09 17:22:11+00	\N
c4fz8qjifateuuv	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	Pickup Address	Pickup_Address	LongText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N		\N	\N	\N	12	{}	\N	f	wqid8bq2	\N	2026-02-04 14:01:47+00	2026-02-09 17:22:38+00	\N
c6h4pr6nf24v55t	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	Delivery Address	Delivery_Address	LongText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N		\N	\N	\N	13	{}	\N	f	wqid8bq2	\N	2026-02-04 14:01:47+00	2026-02-09 17:22:53+00	\N
cwmv5m3yjc4vjgd	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	Freight Price EUR	Freight_Price_EUR	Currency	decimal	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	19	2	\N		\N	\N	\N	15	{"currency_locale":"de","currency_code":"EUR","precision":2}	\N	f	wqid8bq2	\N	2026-02-04 14:01:47+00	2026-02-09 17:24:23+00	\N
c1ao0fait4zsa1t	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	Invoiced	Invoiced	Checkbox	bool	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	false	\N	\N	specificType	\N	\N	\N		\N	\N	\N	16	{"iconIdx":0,"icon":{"checked":"mdi-check-bold","unchecked":"mdi-crop-square","label":"square"},"color":"#52DE84"}	\N	f	wqid8bq2	\N	2026-02-04 14:01:47+00	2026-02-09 17:24:41+00	\N
cvk3wq35dagvfah	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	Invoice Number	Invoice_Number	SingleLineText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N		\N	\N	\N	17	{"defaultViewColOrder":17,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-04 14:01:47+00	2026-02-09 17:24:48+00	\N
cve6so9t8q8g5en	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	Notes	Notes	LongText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N		\N	\N	\N	18	{}	\N	f	wqid8bq2	\N	2026-02-04 14:01:47+00	2026-02-09 17:24:54+00	\N
cp5qde7762p94od	bznmoxpma3xn3sb	pupuc6ugup9dm03	ma2bsaypbay1l2e	1_CLIENTS_id	1_CLIENTS_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-09 17:46:33+00	2026-02-09 17:46:33+00	\N
cjlmtyr4lqeiae5	bznmoxpma3xn3sb	pupuc6ugup9dm03	ma2bsaypbay1l2e	2_CONTACTS_id	2_CONTACTS_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-09 17:46:33+00	2026-02-09 17:46:33+00	\N
c6hdxzzb4nk3wli	bznmoxpma3xn3sb	pupuc6ugup9dm03	ma2bsaypbay1l2e	1_CLIENTS	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	1	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-09 17:46:33+00	2026-02-09 17:46:33+00	\N
cnl2ar5uezykpju	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	_nc_m2m_2_CONTACTS_1_CLIENTs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	19	{"plural":"_nc_m2m_2_CONTACTS_1_CLIENTs","singular":"_nc_m2m_2_CONTACTS_1_CLIENT","custom":false}	\N	f	wqid8bq2	\N	2026-02-09 17:46:33+00	2026-02-09 17:46:33+00	\N
cmxxts2k95wo8gt	bznmoxpma3xn3sb	pupuc6ugup9dm03	ma2bsaypbay1l2e	2_CONTACTS	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	2	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-09 17:46:34+00	2026-02-09 17:46:34+00	\N
cptx2p0w7d45sir	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	_nc_m2m_2_CONTACTS_1_CLIENTs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	17	{"plural":"_nc_m2m_2_CONTACTS_1_CLIENTs","singular":"_nc_m2m_2_CONTACTS_1_CLIENT","custom":false}	\N	f	wqid8bq2	\N	2026-02-09 17:46:34+00	2026-02-09 17:46:34+00	\N
c05e11ftou4idmo	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	1_CLIENTs 1	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	18	{"singular":"1_CLIENT","plural":"1_CLIENTs"}	\N	f	wqid8bq2	\N	2026-02-09 17:46:34+00	2026-02-09 17:46:34+00	\N
cu0bwr7p9nxapn0	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	2_CONTACTs	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	20	{"plural":"2_CONTACTs","singular":"2_CONTACT"}	\N	f	wqid8bq2	\N	2026-02-09 17:46:34+00	2026-02-09 17:46:34+00	\N
cdh5ieiy9swc0dc	bznmoxpma3xn3sb	pupuc6ugup9dm03	mwqo4tyim3er84z	3_VEHICLES_id	3_VEHICLES_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-09 17:58:12+00	2026-02-09 17:58:12+00	\N
cnxam7bzha5n05r	bznmoxpma3xn3sb	pupuc6ugup9dm03	mwqo4tyim3er84z	4_DRIVERS_id	4_DRIVERS_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-09 17:58:12+00	2026-02-09 17:58:12+00	\N
cc19tkhguph30nb	bznmoxpma3xn3sb	pupuc6ugup9dm03	mwqo4tyim3er84z	3_VEHICLES	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	1	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-09 17:58:12+00	2026-02-09 17:58:12+00	\N
cbs91tiep4lbcn4	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	_nc_m2m_4_DRIVERS_3_VEHICLEs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	19	{"plural":"_nc_m2m_4_DRIVERS_3_VEHICLEs","singular":"_nc_m2m_4_DRIVERS_3_VEHICLE","custom":false}	\N	f	wqid8bq2	\N	2026-02-09 17:58:12+00	2026-02-09 17:58:12+00	\N
czxs4da12eivtmk	bznmoxpma3xn3sb	pupuc6ugup9dm03	mwqo4tyim3er84z	4_DRIVERS	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	2	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-09 17:58:12+00	2026-02-09 17:58:12+00	\N
cia1yht1f9lb8v6	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	_nc_m2m_4_DRIVERS_3_VEHICLEs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	17	{"plural":"_nc_m2m_4_DRIVERS_3_VEHICLEs","singular":"_nc_m2m_4_DRIVERS_3_VEHICLE","custom":false}	\N	f	wqid8bq2	\N	2026-02-09 17:58:12+00	2026-02-09 17:58:12+00	\N
clmoy1dn4a0cj4i	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	3_VEHICLEs 1	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	18	{"plural":"3_VEHICLEs","singular":"3_VEHICLE"}	\N	f	wqid8bq2	\N	2026-02-09 17:58:12+00	2026-02-09 17:58:12+00	\N
c5nm24mhw8dqqgx	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	4_DRIVERs	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	20	{"plural":"4_DRIVERs","singular":"4_DRIVER"}	\N	f	wqid8bq2	\N	2026-02-09 17:58:12+00	2026-02-09 17:58:12+00	\N
cv71nqyp9d6iblu	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	Full Name (from 4_DRIVERS)	Full Name (from 4_DRIVERS)	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	18	\N	\N	f	wqid8bq2	\N	2026-02-09 18:00:26+00	2026-02-09 18:00:26+00	\N
cnsr2795ce18wkx	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	Full Name (from 2_CONTACTS)	Full Name (from 2_CONTACTS)	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	14	\N	\N	f	wqid8bq2	\N	2026-02-09 18:01:37+00	2026-02-09 18:01:37+00	\N
cvl6cwfjsgn9rm4	bznmoxpma3xn3sb	pupuc6ugup9dm03	mbrdjwqzi4k85pu	1_CLIENTS_id	1_CLIENTS_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-09 18:05:18+00	2026-02-09 18:05:18+00	\N
cx1qffbaisk4k1m	bznmoxpma3xn3sb	pupuc6ugup9dm03	mbrdjwqzi4k85pu	5_INQUIRIES_id	5_INQUIRIES_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-09 18:05:18+00	2026-02-09 18:05:18+00	\N
cap1qxgskyvdy2v	bznmoxpma3xn3sb	pupuc6ugup9dm03	mbrdjwqzi4k85pu	1_CLIENTS	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	1	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-09 18:05:18+00	2026-02-09 18:05:18+00	\N
cuqoryv861aqpu6	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	_nc_m2m_5_INQUIRIES_1_CLIENTs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	23	{"plural":"_nc_m2m_5_INQUIRIES_1_CLIENTs","singular":"_nc_m2m_5_INQUIRIES_1_CLIENT","custom":false}	\N	f	wqid8bq2	\N	2026-02-09 18:05:18+00	2026-02-09 18:05:18+00	\N
ci4o7j3hime7f6z	bznmoxpma3xn3sb	pupuc6ugup9dm03	mbrdjwqzi4k85pu	5_INQUIRIES	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	2	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-09 18:05:18+00	2026-02-09 18:05:18+00	\N
cp9hbd7r3agj1yp	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	_nc_m2m_5_INQUIRIES_1_CLIENTs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	24	{"plural":"_nc_m2m_5_INQUIRIES_1_CLIENTs","singular":"_nc_m2m_5_INQUIRIES_1_CLIENT","custom":false}	\N	f	wqid8bq2	\N	2026-02-09 18:05:18+00	2026-02-09 18:05:18+00	\N
c6covu3mw8ifwyx	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	1_CLIENTs 1	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	25	{"plural":"1_CLIENTs","singular":"1_CLIENT"}	\N	f	wqid8bq2	\N	2026-02-09 18:05:19+00	2026-02-09 18:05:19+00	\N
cud7ibgfdtc5rlj	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	5_INQUIRIES1	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	24	{"plural":"5_INQUIRIES","singular":"5_INQUIRy"}	\N	f	wqid8bq2	\N	2026-02-09 18:05:19+00	2026-02-09 18:05:19+00	\N
cfkewqb8ein2k7e	bznmoxpma3xn3sb	pupuc6ugup9dm03	muzy18i6jdjkcao	3_VEHICLES	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	1	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-09 18:14:43+00	2026-02-09 18:14:43+00	\N
cf7fhgh14nrhrkn	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	Client	Client	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	f	26	{"defaultViewColOrder":8.25,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-09 18:07:46+00	2026-02-09 18:08:20+00	\N
cyml861u7wzdzqc	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	Company Name (from 1_CLIENTS)	Company Name (from 1_CLIENTS)	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	19	{}	\N	f	wqid8bq2	\N	2026-02-09 18:09:36+00	2026-02-09 18:09:36+00	\N
cpdvdr3j94euxci	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	_nc_m2m_6_TRANSPORTS_3_VEHICLEs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	21	{"plural":"_nc_m2m_6_TRANSPORTS_3_VEHICLEs","singular":"_nc_m2m_6_TRANSPORTS_3_VEHICLE","custom":false}	\N	f	wqid8bq2	\N	2026-02-09 18:14:43+00	2026-02-09 18:14:43+00	\N
cw6vsvzfnq5linv	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	Vehicle	Vehicle	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	f	19	{"defaultViewColOrder":14.25,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-09 18:10:49+00	2026-02-09 18:10:59+00	\N
ciu5dhnkukkfvzy	bznmoxpma3xn3sb	pupuc6ugup9dm03	mv9v9zjgzfy5elx	2_CONTACTS_id	2_CONTACTS_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-09 18:12:06+00	2026-02-09 18:12:06+00	\N
cc4ldogr5cbdoll	bznmoxpma3xn3sb	pupuc6ugup9dm03	mv9v9zjgzfy5elx	5_INQUIRIES_id	5_INQUIRIES_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-09 18:12:06+00	2026-02-09 18:12:06+00	\N
clvh6ivzzvi3ooo	bznmoxpma3xn3sb	pupuc6ugup9dm03	mv9v9zjgzfy5elx	2_CONTACTS	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	1	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-09 18:12:06+00	2026-02-09 18:12:06+00	\N
c6kmuu3sxabonbl	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	_nc_m2m_5_INQUIRIES_2_CONTACTs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	20	{"plural":"_nc_m2m_5_INQUIRIES_2_CONTACTs","singular":"_nc_m2m_5_INQUIRIES_2_CONTACT","custom":false}	\N	f	wqid8bq2	\N	2026-02-09 18:12:06+00	2026-02-09 18:12:06+00	\N
czk3l3g0bvvcnsn	bznmoxpma3xn3sb	pupuc6ugup9dm03	mv9v9zjgzfy5elx	5_INQUIRIES	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	2	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-09 18:12:06+00	2026-02-09 18:12:06+00	\N
c3o8g32cmdd866m	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	_nc_m2m_5_INQUIRIES_2_CONTACTs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	27	{"plural":"_nc_m2m_5_INQUIRIES_2_CONTACTs","singular":"_nc_m2m_5_INQUIRIES_2_CONTACT","custom":false}	\N	f	wqid8bq2	\N	2026-02-09 18:12:06+00	2026-02-09 18:12:06+00	\N
cm75kuwju8h6d53	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	2_CONTACTs	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	28	{"plural":"2_CONTACTs","singular":"2_CONTACT"}	\N	f	wqid8bq2	\N	2026-02-09 18:12:06+00	2026-02-09 18:12:06+00	\N
cqj68if71u1536q	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	5_INQUIRIES	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	21	{"plural":"5_INQUIRIES","singular":"5_INQUIRy"}	\N	f	wqid8bq2	\N	2026-02-09 18:12:06+00	2026-02-09 18:12:06+00	\N
cnv6alltf9f39kh	bznmoxpma3xn3sb	pupuc6ugup9dm03	muzy18i6jdjkcao	6_TRANSPORTS	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	2	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-09 18:14:43+00	2026-02-09 18:14:43+00	\N
cb6kyebvgf4c1k9	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	Contact	Contact	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	f	29	{"defaultViewColOrder":10.25,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-09 18:13:17+00	2026-02-09 18:13:44+00	\N
c6e9ihzhyby9enp	bznmoxpma3xn3sb	pupuc6ugup9dm03	muzy18i6jdjkcao	3_VEHICLES_id	3_VEHICLES_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-09 18:14:43+00	2026-02-09 18:14:43+00	\N
crrs08f7cgpdcp1	bznmoxpma3xn3sb	pupuc6ugup9dm03	muzy18i6jdjkcao	6_TRANSPORTS_id	6_TRANSPORTS_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-09 18:14:43+00	2026-02-09 18:14:43+00	\N
cheyslwwnaslwi3	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	_nc_m2m_6_TRANSPORTS_3_VEHICLEs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	14	{"plural":"_nc_m2m_6_TRANSPORTS_3_VEHICLEs","singular":"_nc_m2m_6_TRANSPORTS_3_VEHICLE","custom":false}	\N	f	wqid8bq2	\N	2026-02-09 18:14:43+00	2026-02-09 18:14:43+00	\N
cb9zfb6cmyk3nb3	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	3_VEHICLEs	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	15	{"plural":"3_VEHICLEs","singular":"3_VEHICLE"}	\N	f	wqid8bq2	\N	2026-02-09 18:14:43+00	2026-02-09 18:14:43+00	\N
c940zopwks20w59	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	6_TRANSPORTs	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	22	{"plural":"6_TRANSPORTs","singular":"6_TRANSPORT"}	\N	f	wqid8bq2	\N	2026-02-09 18:14:43+00	2026-02-09 18:14:43+00	\N
crxv61a9whrnn6d	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0tv1ftq4mjvyyl	4_DRIVERS_id	4_DRIVERS_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-09 18:17:38+00	2026-02-09 18:17:38+00	\N
cuwu5vokhwerd37	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	Vehicle	Vehicle	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	f	16	{"defaultViewColOrder":10.25,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-09 18:15:16+00	2026-02-09 18:15:32+00	\N
c3r3mrybwsqdo6u	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0tv1ftq4mjvyyl	6_TRANSPORTS_id	6_TRANSPORTS_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-09 18:17:38+00	2026-02-09 18:17:38+00	\N
cbc5a026my67zsy	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0tv1ftq4mjvyyl	4_DRIVERS	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	1	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-09 18:17:38+00	2026-02-09 18:17:38+00	\N
cypop3x59q51hu6	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	_nc_m2m_6_TRANSPORTS_4_DRIVERs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	20	{"plural":"_nc_m2m_6_TRANSPORTS_4_DRIVERs","singular":"_nc_m2m_6_TRANSPORTS_4_DRIVER","custom":false}	\N	f	wqid8bq2	\N	2026-02-09 18:17:38+00	2026-02-09 18:17:38+00	\N
caoici07xkegpkn	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0tv1ftq4mjvyyl	6_TRANSPORTS	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	2	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-09 18:17:38+00	2026-02-09 18:17:38+00	\N
cxwl6txkfe3uf7p	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	_nc_m2m_6_TRANSPORTS_4_DRIVERs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	17	{"plural":"_nc_m2m_6_TRANSPORTS_4_DRIVERs","singular":"_nc_m2m_6_TRANSPORTS_4_DRIVER","custom":false}	\N	f	wqid8bq2	\N	2026-02-09 18:17:38+00	2026-02-09 18:17:38+00	\N
cd03nr1ew2nvc55	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	4_DRIVERs	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	18	{"plural":"4_DRIVERs","singular":"4_DRIVER"}	\N	f	wqid8bq2	\N	2026-02-09 18:17:38+00	2026-02-09 18:17:38+00	\N
c3qx3qpy29mmgoj	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	6_TRANSPORTs	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	21	{"plural":"6_TRANSPORTs","singular":"6_TRANSPORT"}	\N	f	wqid8bq2	\N	2026-02-09 18:17:38+00	2026-02-09 18:17:38+00	\N
cv0nu1w5m6g4k0p	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	Driver	Driver	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	19	{}	\N	f	wqid8bq2	\N	2026-02-09 18:19:31+00	2026-02-09 18:19:31+00	\N
c3sley7vn6e2886	bznmoxpma3xn3sb	pupuc6ugup9dm03	m6t6dzpzjsh3pou	1_CLIENTS_id	1_CLIENTS_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-09 18:21:32+00	2026-02-09 18:21:32+00	\N
cs2zr31rp5jlhnd	bznmoxpma3xn3sb	pupuc6ugup9dm03	m6t6dzpzjsh3pou	7_FREIGHTS_id	7_FREIGHTS_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-09 18:21:32+00	2026-02-09 18:21:32+00	\N
cqwo4he88ae7kj6	bznmoxpma3xn3sb	pupuc6ugup9dm03	m6t6dzpzjsh3pou	1_CLIENTS	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	1	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-09 18:21:32+00	2026-02-09 18:21:32+00	\N
c4fak0a46kr1oiu	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	_nc_m2m_7_FREIGHTS_1_CLIENTs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	25	{"plural":"_nc_m2m_7_FREIGHTS_1_CLIENTs","singular":"_nc_m2m_7_FREIGHTS_1_CLIENT","custom":false}	\N	f	wqid8bq2	\N	2026-02-09 18:21:32+00	2026-02-09 18:21:32+00	\N
cxd7yi6n4xr67cm	bznmoxpma3xn3sb	pupuc6ugup9dm03	m6t6dzpzjsh3pou	7_FREIGHTS	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	2	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-09 18:21:32+00	2026-02-09 18:21:32+00	\N
cqpd6c27fhb1mnq	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	_nc_m2m_7_FREIGHTS_1_CLIENTs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	19	{"plural":"_nc_m2m_7_FREIGHTS_1_CLIENTs","singular":"_nc_m2m_7_FREIGHTS_1_CLIENT","custom":false}	\N	f	wqid8bq2	\N	2026-02-09 18:21:32+00	2026-02-09 18:21:32+00	\N
cmkzvu89sq1tqwe	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	1_CLIENTs	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	20	{"plural":"1_CLIENTs","singular":"1_CLIENT"}	\N	f	wqid8bq2	\N	2026-02-09 18:21:32+00	2026-02-09 18:21:32+00	\N
c66j0cxivg3e6zi	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	7_FREIGHTs	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	26	{"plural":"7_FREIGHTs","singular":"7_FREIGHT"}	\N	f	wqid8bq2	\N	2026-02-09 18:21:32+00	2026-02-09 18:21:32+00	\N
cmuad2sogee58l5	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	Company Name (from 1_CLIENTS)	Company Name (from 1_CLIENTS)	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	21	{}	\N	f	wqid8bq2	\N	2026-02-09 18:22:15+00	2026-02-09 18:22:15+00	\N
cbz8mnuo2l8m3o1	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mxkvccdz2e8k27r	Id	id	ID	int4	\N	\N	\N	\N	t	\N	t	t	\N	t	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	f	1	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cfjg9mlzkwehm1g	bznmoxpma3xn3sb	pupuc6ugup9dm03	md4f4x5bej6pcfo	6_TRANSPORTS_id	6_TRANSPORTS_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-09 18:29:11+00	2026-02-09 18:29:11+00	\N
coa8hstes7jqmmm	bznmoxpma3xn3sb	pupuc6ugup9dm03	md4f4x5bej6pcfo	7_FREIGHTS_id	7_FREIGHTS_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-09 18:29:11+00	2026-02-09 18:29:11+00	\N
ch9wfw8yzj4yzlf	bznmoxpma3xn3sb	pupuc6ugup9dm03	md4f4x5bej6pcfo	6_TRANSPORTS	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	1	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-09 18:29:11+00	2026-02-09 18:29:11+00	\N
cfdmjgmx05n40su	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	_nc_m2m_7_FREIGHTS_6_TRANSPORTs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	20	{"plural":"_nc_m2m_7_FREIGHTS_6_TRANSPORTs","singular":"_nc_m2m_7_FREIGHTS_6_TRANSPORT","custom":false}	\N	f	wqid8bq2	\N	2026-02-09 18:29:11+00	2026-02-09 18:29:11+00	\N
c3wwelfkh14yr85	bznmoxpma3xn3sb	pupuc6ugup9dm03	md4f4x5bej6pcfo	7_FREIGHTS	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	2	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-09 18:29:11+00	2026-02-09 18:29:11+00	\N
capd7u5lhggawnz	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	_nc_m2m_7_FREIGHTS_6_TRANSPORTs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	22	{"plural":"_nc_m2m_7_FREIGHTS_6_TRANSPORTs","singular":"_nc_m2m_7_FREIGHTS_6_TRANSPORT","custom":false}	\N	f	wqid8bq2	\N	2026-02-09 18:29:11+00	2026-02-09 18:29:11+00	\N
cbwarj2unek0fx7	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	6_TRANSPORTs	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	23	{"plural":"6_TRANSPORTs","singular":"6_TRANSPORT"}	\N	f	wqid8bq2	\N	2026-02-09 18:29:11+00	2026-02-09 18:29:11+00	\N
cfjdmoaypas3ot4	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	7_FREIGHTs	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	21	{"plural":"7_FREIGHTs","singular":"7_FREIGHT"}	\N	f	wqid8bq2	\N	2026-02-09 18:29:11+00	2026-02-09 18:29:11+00	\N
cqa5y3yzcdt5ltr	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	Departure Date (from 6_TRANSPORTS)	Departure Date (from 6_TRANSPORTS)	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	24	{}	\N	f	wqid8bq2	\N	2026-02-09 18:33:12+00	2026-02-09 18:33:12+00	\N
c6zmah4nvr48ngd	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	Origin (from 6_TRANSPORTS)	Origin (from 6_TRANSPORTS)	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	25	{}	\N	f	wqid8bq2	\N	2026-02-09 18:33:32+00	2026-02-09 18:33:32+00	\N
c3305onaea54zoz	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	Destination (from 6_TRANSPORTS)	Destination (from 6_TRANSPORTS)	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	26	{}	\N	f	wqid8bq2	\N	2026-02-09 18:33:43+00	2026-02-09 18:33:43+00	\N
cvwuynxzwp0ukig	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	Transport Capacity %	Transport_Capacity__	Percent	double precision	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	f	22	{"precision":2,"is_progress":false}	\N	f	wqid8bq2	\N	2026-02-10 13:09:09+00	2026-02-10 13:09:09+00	\N
cv8ytsdg9nq16kt	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	Vehicle Pallet Spaces	Vehicle Pallet Spaces	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	23	{}	\N	f	wqid8bq2	\N	2026-02-10 15:46:28+00	2026-02-10 15:46:28+00	\N
cjiu54csjvbbl7f	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	Vehicle Capacity (kg)	Vehicle Capacity (kg)	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	24	{}	\N	f	wqid8bq2	\N	2026-02-10 15:46:52+00	2026-02-10 15:46:52+00	\N
c5sxauwunyn6r03	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	Free Percent	Free Percent	Formula	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	25	{"display_column_meta":{"meta":{},"custom":{}},"display_type":null}	\N	f	wqid8bq2	\N	2026-02-10 15:47:32+00	2026-02-10 15:47:32+00	\N
ch362zepnzku4nx	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	Free Pallets	Free Pallets	Formula	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	26	{"display_column_meta":{"meta":{},"custom":{}},"display_type":null}	\N	f	wqid8bq2	\N	2026-02-10 15:48:01+00	2026-02-10 15:48:01+00	\N
ckfemyv8pfxvwpm	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	Free Capacity (kg)	Free Capacity (kg)	Formula	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	27	{"display_column_meta":{"meta":{},"custom":{}},"display_type":null}	\N	f	wqid8bq2	\N	2026-02-10 15:48:22+00	2026-02-10 15:48:22+00	\N
cxwr5vfmfx540ez	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mxkvccdz2e8k27r	CreatedAt	created_at	CreatedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	2	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
c1jkprvgzsa61uk	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mxkvccdz2e8k27r	UpdatedAt	updated_at	LastModifiedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	3	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cwlqeh8c4lke7z9	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mxkvccdz2e8k27r	nc_order	nc_order	Order	numeric	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	4	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cwm6g4nzu8jcjm8	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mxkvccdz2e8k27r	Company Name	Company_Name	SingleLineText	text	\N	\N	\N	\N	f	t	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	5	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
co3dbbavglak1af	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mxkvccdz2e8k27r	VAT ID	VAT_ID	SingleLineText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	6	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cod0tyvckt5vxi9	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mxkvccdz2e8k27r	Address	Address	SingleLineText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	7	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
c99jlfguprb9qr7	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mxkvccdz2e8k27r	Email	Email	Email	character varying	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	{"func":["isEmail"],"args":[""],"msg":["Validation failed : isEmail"]}	\N	\N	\N	8	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
ct9ghzra1zol12a	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mxkvccdz2e8k27r	Phone	Phone	PhoneNumber	character varying	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	{"func":["isMobilePhone"],"args":[""],"msg":["Validation failed : isMobilePhone"]}	\N	\N	\N	9	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cr38v3sfkf7zv14	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mxkvccdz2e8k27r	Notes	Notes	SingleLineText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	10	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cms65bharp4uhnd	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mg8glgpealdlzio	Id	id	ID	int4	\N	\N	\N	\N	t	\N	t	t	\N	t	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	f	1	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
csu8d2pcseoufcn	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mg8glgpealdlzio	CreatedAt	created_at	CreatedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	2	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
c9wbobtedeefox5	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mg8glgpealdlzio	UpdatedAt	updated_at	LastModifiedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	3	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cwk2ro06qvqcz5e	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mg8glgpealdlzio	nc_order	nc_order	Order	numeric	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	4	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cd5em2l75qq6th6	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mg8glgpealdlzio	Full Name	Full_Name	SingleLineText	text	\N	\N	\N	\N	f	t	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	5	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cl6fnhx95d9hr6n	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mg8glgpealdlzio	Position	Position	SingleLineText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	6	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cd67oyc9lz0a39t	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mg8glgpealdlzio	Email	Email	Email	character varying	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	{"func":["isEmail"],"args":[""],"msg":["Validation failed : isEmail"]}	\N	\N	\N	7	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cdptpo6qgxsztvx	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mg8glgpealdlzio	Phone	Phone	PhoneNumber	character varying	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	{"func":["isMobilePhone"],"args":[""],"msg":["Validation failed : isMobilePhone"]}	\N	\N	\N	8	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cryq2fxuyh4byse	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mg8glgpealdlzio	Primary Contact	Primary_Contact	Checkbox	bool	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	false	\N	\N	specificType	\N	\N	\N	\N	\N	\N	\N	9	{"iconIdx":1,"icon":{"checked":"mdi-check-circle-outline","unchecked":"mdi-checkbox-blank-circle-outline"},"color":"#27D665","defaultViewColOrder":12,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cqw4osstvnidbdx	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mp95ctr4880xk7r	Id	id	ID	int4	\N	\N	\N	\N	t	\N	t	t	\N	t	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	f	1	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
ckhrx6fuxcfsbwm	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mp95ctr4880xk7r	CreatedAt	created_at	CreatedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	2	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
c05bciajjxnzhdh	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mp95ctr4880xk7r	UpdatedAt	updated_at	LastModifiedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	3	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
ckxugqrfbgafutd	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mp95ctr4880xk7r	nc_order	nc_order	Order	numeric	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	4	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
c4nfxjmto81hsbf	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mp95ctr4880xk7r	Registration Number	Registration_Number	SingleLineText	text	\N	\N	\N	\N	f	t	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	5	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
co9080h9kgxik6c	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mp95ctr4880xk7r	Body Type	Body_Type	SingleSelect	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	' ADR Box','Tankfahrzeug','Kühlkoffer','Containerchassis','Plane/Tautliner','Kastenwagen'	 	\N	\N	\N	\N	\N	6	{"defaultViewColOrder":8,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
crnle1wp9n7bcer	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mp95ctr4880xk7r	Capacity kg	Capacity_kg	Number	bigint	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	7	{"isLocaleString":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cq6yw7rx026p1sw	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mp95ctr4880xk7r	Capacity m3	Capacity_m3	Number	bigint	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	8	{"isLocaleString":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
clu4djodmjcincm	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mp95ctr4880xk7r	Pallet Spaces	Pallet_Spaces	Number	bigint	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	9	{"isLocaleString":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
c5ol9ibsl6gcezw	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mp95ctr4880xk7r	ADR	ADR	Checkbox	bool	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	false	\N	\N	specificType	\N	\N	\N	\N	\N	\N	\N	10	{"iconIdx":1,"icon":{"checked":"mdi-check-circle-outline","unchecked":"mdi-checkbox-blank-circle-outline"},"color":"#27D665","defaultViewColOrder":12,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cl36dscpbhaygb4	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mp95ctr4880xk7r	ADR Classes	ADR_Classes	MultiSelect	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	'1','2','3','4.1','4.2','4.3','5.1','5.2','6.1','6.2','7','8','9'	 	\N	\N	\N	\N	\N	11	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cfi018q7u3lsfur	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mp95ctr4880xk7r	Inspection Date	Inspection_Date	Date	date	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	12	{"date_format":"YYYY-MM-DD","defaultViewColOrder":14,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cyepgxey61i5py0	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mp95ctr4880xk7r	Insurance Expiry	Insurance_Expiry	Date	date	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	13	{"date_format":"YYYY-MM-DD"}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cf58x63rojb8pex	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mp95ctr4880xk7r	Notes	Notes	LongText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	14	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
c18jtstzhnma8fm	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3g9kou5r88eiuh	Id	id	ID	int4	\N	\N	\N	\N	t	\N	t	t	\N	t	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	f	1	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
c2qghv2npthks3d	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3g9kou5r88eiuh	CreatedAt	created_at	CreatedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	2	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
c13926iimrrv9gf	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3g9kou5r88eiuh	UpdatedAt	updated_at	LastModifiedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	3	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cew7o4le3t12tlk	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3g9kou5r88eiuh	nc_order	nc_order	Order	numeric	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	4	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
co64i4u7pt4r6k9	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3g9kou5r88eiuh	Full Name	Full_Name	SingleLineText	text	\N	\N	\N	\N	f	t	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	5	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cdrojiau1elmykx	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3g9kou5r88eiuh	Phone	Phone	PhoneNumber	character varying	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	{"func":["isMobilePhone"],"args":[""],"msg":["Validation failed : isMobilePhone"]}	\N	\N	\N	6	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
c9uunk3hcho4ah6	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3g9kou5r88eiuh	License Categories	License_Categories	MultiSelect	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	'B','C','C+E','D'	 	\N	\N	\N	\N	\N	7	{"defaultViewColOrder":9,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
c6ifzkrv9gu3n3a	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3g9kou5r88eiuh	ADR	ADR	Checkbox	bool	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	false	\N	\N	specificType	\N	\N	\N	\N	\N	\N	\N	8	{"iconIdx":1,"icon":{"checked":"mdi-check-circle-outline","unchecked":"mdi-checkbox-blank-circle-outline"},"color":"#27D665","defaultViewColOrder":10,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
c9bt0ufh57afkmc	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3g9kou5r88eiuh	ADR Classes	ADR_Classes	MultiSelect	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	'1','2','3','4.1','4.2','4.3','5.1','5.2','6.1','6.2','7','8','9'	 	\N	\N	\N	\N	\N	9	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
clegmghzbn5vfge	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3g9kou5r88eiuh	ADR Expiry Date	ADR_Expiry_Date	Date	date	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	10	{"date_format":"YYYY-MM-DD"}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
ckj9auhm9snfr19	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3g9kou5r88eiuh	Medical Exam Expiry	Medical_Exam_Expiry	Date	date	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	11	{"date_format":"YYYY-MM-DD"}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cywduqzci09tp0d	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3g9kou5r88eiuh	Notes	Notes	LongText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	12	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
ck3avnsr92u5m29	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m2s591s1lnxfu6a	Id	id	ID	int4	\N	\N	\N	\N	t	\N	t	t	\N	t	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	f	1	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
ca6w3hhmo7q2vs5	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m2s591s1lnxfu6a	CreatedAt	created_at	CreatedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	2	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
chdi8n7f3l96z86	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m2s591s1lnxfu6a	UpdatedAt	updated_at	LastModifiedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	3	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cv5xpqyqlf71qft	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m2s591s1lnxfu6a	nc_order	nc_order	Order	numeric	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	4	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
c9q7yfk9cj3ojfc	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m2s591s1lnxfu6a	Inquiry Date	Inquiry_Date	DateTime	timestamp	\N	\N	\N	\N	f	t	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	5	{"date_format":"YYYY-MM-DD","time_format":"HH:mm","is12hrFormat":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cf5tlbcrgv7yztd	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m2s591s1lnxfu6a	Origin City/Postal	Origin_City_Postal	SingleLineText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	6	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
ct9a7jjs9320394	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m2s591s1lnxfu6a	Destination City/Postal	Destination_City_Postal	SingleLineText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	7	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
c7z0n78mk97z2pd	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m2s591s1lnxfu6a	Loading Date	Loading_Date	Date	date	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	8	{"date_format":"YYYY-MM-DD"}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cvtpk19swemnm04	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m2s591s1lnxfu6a	Delivery Date	Delivery_Date	Date	date	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	9	{"date_format":"YYYY-MM-DD"}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
c3avfncif6tv51z	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m2s591s1lnxfu6a	Cargo Type	Cargo_Type	SingleLineText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	10	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cfu2sqs8lykbfma	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m2s591s1lnxfu6a	ADR	ADR	Checkbox	bool	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	false	\N	\N	specificType	\N	\N	\N	\N	\N	\N	\N	11	{"iconIdx":1,"icon":{"checked":"mdi-check-circle-outline","unchecked":"mdi-checkbox-blank-circle-outline"},"color":"#52DE84"}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
c9b52pesups302t	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m2s591s1lnxfu6a	ADR Class/UN	ADR_Class_UN	MultiSelect	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	'1','2','3','4.1','4.2','4.3','5.1','5.2','6.1','6.2','7','8','9'	 	\N	\N	\N	\N	\N	12	{"defaultViewColOrder":16,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
c49y7u4b9xdunws	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m2s591s1lnxfu6a	Dimensions	Dimensions	SingleLineText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	13	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
ceipulnhqpr610f	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m2s591s1lnxfu6a	Weight kg	Weight_kg	Number	bigint	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	14	{"isLocaleString":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cq6lnt43w69vfhp	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m2s591s1lnxfu6a	Status	Status	SingleSelect	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	'New','Accepted','Quoted'	 	\N	\N	\N	\N	\N	15	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cru5revvvw9trzl	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m2s591s1lnxfu6a	Source	Source	SingleSelect	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	'Email','Web Form','Phone'	 	\N	\N	\N	\N	\N	16	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cjy0qc5zdbior60	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m2s591s1lnxfu6a	UTM Source	UTM_Source	SingleLineText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	17	{"defaultViewColOrder":21,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
c8beeabco27w2wb	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m2s591s1lnxfu6a	Notes	Notes	LongText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	18	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
c79yuvg7344emms	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	Id	id	ID	int4	\N	\N	\N	\N	t	\N	t	t	\N	t	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	f	1	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
ccpi7ncgcnpnynu	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	CreatedAt	created_at	CreatedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	2	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cbl6jx8pv9olf98	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	UpdatedAt	updated_at	LastModifiedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	3	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cuubl86zu5f58fj	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	nc_order	nc_order	Order	numeric	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	4	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
c1vwnz3lnox54kz	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	Departure Date	Departure_Date	Date	date	\N	\N	\N	\N	f	t	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	5	{"date_format":"YYYY-MM-DD"}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
ct4fse4fn1g2b0p	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	Origin	Origin	SingleLineText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	6	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cdrxhq7sj28nxzq	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	Destination	Destination	SingleLineText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	7	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cbl4sswrm0gq15b	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	Status	Status	SingleSelect	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	'Planned','In Progress','Completed'	 	\N	\N	\N	\N	\N	8	{"defaultViewColOrder":12,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
ccpzp2183phyy9q	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	Notes	Notes	LongText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	9	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cv7j5xabbktmkgy	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	Transport Capacity %	Transport_Capacity__	Percent	double precision	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	f	10	{"precision":2,"is_progress":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00	\N
cg3d80bkjn88fh0	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3w5kh70kk3c2l0	Id	id	ID	int4	\N	\N	\N	\N	t	\N	t	t	\N	t	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	f	1	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
cko5yg3y74xu798	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3w5kh70kk3c2l0	CreatedAt	created_at	CreatedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	2	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
cn4ojnqxp5j4fny	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3w5kh70kk3c2l0	UpdatedAt	updated_at	LastModifiedTime	timestamp	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	t	3	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
c45avkl5z3x22it	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3w5kh70kk3c2l0	nc_order	nc_order	Order	numeric	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	\N	\N	\N	\N	\N	\N	t	4	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
clnvr4viug5041q	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3w5kh70kk3c2l0	Client	Client	SingleLineText	text	\N	\N	\N	\N	f	t	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	5	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
cgk36zdeuu6mlrc	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3w5kh70kk3c2l0	Unit Type	Unit_Type	SingleSelect	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	'ADR','Other','Pallet','Box'	 	\N	\N	\N	\N	\N	6	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
clctzdyrpo87u84	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3w5kh70kk3c2l0	Quantity	Quantity	Number	bigint	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	7	{"isLocaleString":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
cjm9lz2ecsbf0ak	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3w5kh70kk3c2l0	Cargo Description	Cargo_Description	SingleLineText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	8	{"defaultViewColOrder":11,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
c8v0qjz5r4ssjfs	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3w5kh70kk3c2l0	Pickup Address	Pickup_Address	LongText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	9	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
cmqscgkv53zb1nr	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3w5kh70kk3c2l0	Delivery Address	Delivery_Address	LongText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	10	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
cnjy0cy495avtkr	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3w5kh70kk3c2l0	Freight Price EUR	Freight_Price_EUR	Currency	decimal	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType	19	2	\N	{"func":["isCurrency"],"args":[""],"msg":["Validation failed : isCurrency"]}	\N	\N	\N	11	{"currency_locale":"de","currency_code":"EUR","precision":2}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
crri08817y0hzxj	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3w5kh70kk3c2l0	Invoiced	Invoiced	Checkbox	bool	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	false	\N	\N	specificType	\N	\N	\N	\N	\N	\N	\N	12	{"iconIdx":0,"icon":{"checked":"mdi-check-bold","unchecked":"mdi-crop-square","label":"square"},"color":"#52DE84"}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
coijtx5oskcxw92	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3w5kh70kk3c2l0	Invoice Number	Invoice_Number	SingleLineText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	13	{"defaultViewColOrder":17,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
cg6d3lfdzrri7ff	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3w5kh70kk3c2l0	Notes	Notes	LongText	text	\N	\N	\N	\N	f	\N	f	f	\N	f	\N	\N	\N	\N	specificType		 	\N	\N	\N	\N	\N	14	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
cd9tr4kyk3z7egt	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mqy196heavkuj1e	2_CONTACTS_id	2_CONTACTS_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
cpjjcxt0ijinu23	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mqy196heavkuj1e	1_CLIENTS_id	1_CLIENTS_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
c5kvk0hg3to1zhy	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mqy196heavkuj1e	2_CONTACTS	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	1	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
cw3yhgw61wgtv4s	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mg8glgpealdlzio	_nc_m2m_1_CLIENTS_2_CONTACTs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	10	{"plural":"_nc_m2m_1_CLIENTS_2_CONTACTs","singular":"_nc_m2m_1_CLIENTS_2_CONTACT","custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
cku5520yux9lekg	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mqy196heavkuj1e	1_CLIENTS	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	2	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
cp5fywmukyzpoh7	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mxkvccdz2e8k27r	_nc_m2m_1_CLIENTS_2_CONTACTs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	11	{"plural":"_nc_m2m_1_CLIENTS_2_CONTACTs","singular":"_nc_m2m_1_CLIENTS_2_CONTACT","custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
czyh7mb08nyb6d8	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mxkvccdz2e8k27r	2_CONTACTs	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	12	{"plural":"2_CONTACTs","singular":"2_CONTACT"}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
c800f4bexya0eua	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mljwzfc2a38b60h	5_INQUIRIES	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	1	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
cc2tzrc5ua5jca6	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mg8glgpealdlzio	1_CLIENTs 1	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	11	{"plural":"1_CLIENTs","singular":"1_CLIENT"}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
clmedcl82wbomk2	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mujx6juym4kwxgi	5_INQUIRIES_id	5_INQUIRIES_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
cobsxoav39tkupt	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mujx6juym4kwxgi	1_CLIENTS_id	1_CLIENTS_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
chkdw667n70hpj3	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mujx6juym4kwxgi	5_INQUIRIES	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	1	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
clnt0ubbrm5iu67	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m2s591s1lnxfu6a	_nc_m2m_1_CLIENTS_5_INQUIRIES	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	19	{"plural":"_nc_m2m_1_CLIENTS_5_INQUIRIES","singular":"_nc_m2m_1_CLIENTS_5_INQUIRy","custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
c8ep02qv4kehxmv	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mujx6juym4kwxgi	1_CLIENTS	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	2	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
cpo3d6df3wmx7gj	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mxkvccdz2e8k27r	_nc_m2m_1_CLIENTS_5_INQUIRIES	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	13	{"plural":"_nc_m2m_1_CLIENTS_5_INQUIRIES","singular":"_nc_m2m_1_CLIENTS_5_INQUIRy","custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
c08ktvsgypu9m9o	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mxkvccdz2e8k27r	5_INQUIRIES1	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	14	{"plural":"5_INQUIRIES","singular":"5_INQUIRy"}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
cf2k2yrggfnmuc8	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m2s591s1lnxfu6a	_nc_m2m_2_CONTACTS_5_INQUIRIES	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	21	{"plural":"_nc_m2m_2_CONTACTS_5_INQUIRIES","singular":"_nc_m2m_2_CONTACTS_5_INQUIRy","custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
ctw9ifw88oex0qo	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m2s591s1lnxfu6a	1_CLIENTs 1	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	20	{"plural":"1_CLIENTs","singular":"1_CLIENT"}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
c9pe06neephs7nb	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m5rlxcrg06scr7z	7_FREIGHTS_id	7_FREIGHTS_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
cigg9fsnzbtadn0	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m5rlxcrg06scr7z	1_CLIENTS_id	1_CLIENTS_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
ckky9x1lnhrnrf1	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m5rlxcrg06scr7z	7_FREIGHTS	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	1	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
cu1g4ukt1xot671	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3w5kh70kk3c2l0	_nc_m2m_1_CLIENTS_7_FREIGHTs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	15	{"plural":"_nc_m2m_1_CLIENTS_7_FREIGHTs","singular":"_nc_m2m_1_CLIENTS_7_FREIGHT","custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
c9v7u7yugmbv3hd	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m5rlxcrg06scr7z	1_CLIENTS	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	2	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
c9jrg9srm28mowl	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mxkvccdz2e8k27r	_nc_m2m_1_CLIENTS_7_FREIGHTs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	15	{"plural":"_nc_m2m_1_CLIENTS_7_FREIGHTs","singular":"_nc_m2m_1_CLIENTS_7_FREIGHT","custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
c5bh9b3o6kc0c3l	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mxkvccdz2e8k27r	7_FREIGHTs	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	16	{"plural":"7_FREIGHTs","singular":"7_FREIGHT"}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
cgvw6sc7ktb7tua	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3w5kh70kk3c2l0	1_CLIENTs	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	16	{"plural":"1_CLIENTs","singular":"1_CLIENT"}	\N	f	wqid8bq2	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00	\N
cfpahetg08r0ttj	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mljwzfc2a38b60h	5_INQUIRIES_id	5_INQUIRIES_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
cd5za1mkxz2emxj	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mljwzfc2a38b60h	2_CONTACTS_id	2_CONTACTS_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
ch0obw9pmwvbrxh	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mljwzfc2a38b60h	2_CONTACTS	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	2	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
c2jh7ruj62tad2t	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mg8glgpealdlzio	_nc_m2m_2_CONTACTS_5_INQUIRIES	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	12	{"plural":"_nc_m2m_2_CONTACTS_5_INQUIRIES","singular":"_nc_m2m_2_CONTACTS_5_INQUIRy","custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
cpodsuifpnpd2fh	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mg8glgpealdlzio	5_INQUIRIES	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	13	{"plural":"5_INQUIRIES","singular":"5_INQUIRy"}	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
csj1yf0mmbovzpf	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m2s591s1lnxfu6a	2_CONTACTs	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	22	{"plural":"2_CONTACTs","singular":"2_CONTACT"}	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
c1gtvlmujcc1u6u	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mxa4kgd3chtt5j3	4_DRIVERS_id	4_DRIVERS_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
c65mmf5ls3ttmu5	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mxa4kgd3chtt5j3	3_VEHICLES_id	3_VEHICLES_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
crg7nfp9olntk34	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mxa4kgd3chtt5j3	4_DRIVERS	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	1	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
cd5umle6gt12pk0	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3g9kou5r88eiuh	_nc_m2m_3_VEHICLES_4_DRIVERs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	13	{"plural":"_nc_m2m_3_VEHICLES_4_DRIVERs","singular":"_nc_m2m_3_VEHICLES_4_DRIVER","custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
ceamwkdlfa0h3pk	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mxa4kgd3chtt5j3	3_VEHICLES	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	2	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
cp51ox8m3kcvkfj	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mp95ctr4880xk7r	_nc_m2m_3_VEHICLES_4_DRIVERs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	15	{"plural":"_nc_m2m_3_VEHICLES_4_DRIVERs","singular":"_nc_m2m_3_VEHICLES_4_DRIVER","custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
cdf69h02znto6yx	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mp95ctr4880xk7r	4_DRIVERs	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	16	{"plural":"4_DRIVERs","singular":"4_DRIVER"}	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
cmbl579v4xzuilu	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3w5kh70kk3c2l0	Origin (from 6_TRANSPORTS)	Origin (from 6_TRANSPORTS)	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	25	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00	\N
c4e0ek1a9kpk2sz	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3g9kou5r88eiuh	3_VEHICLEs 1	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	14	{"plural":"3_VEHICLEs","singular":"3_VEHICLE"}	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
cspixnw7wg80jr8	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m1yk0s3vo310v22	6_TRANSPORTS_id	6_TRANSPORTS_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
ctu4cm757xqa7ia	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m1yk0s3vo310v22	3_VEHICLES_id	3_VEHICLES_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
cew6e8ajouj98ks	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m1yk0s3vo310v22	6_TRANSPORTS	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	1	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
cfeqvvbh4fun0qf	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	_nc_m2m_3_VEHICLES_6_TRANSPORTs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	11	{"plural":"_nc_m2m_3_VEHICLES_6_TRANSPORTs","singular":"_nc_m2m_3_VEHICLES_6_TRANSPORT","custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
cexr97lomgc1b63	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m1yk0s3vo310v22	3_VEHICLES	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	2	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
ct274vvmpthxt4f	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mp95ctr4880xk7r	_nc_m2m_3_VEHICLES_6_TRANSPORTs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	17	{"plural":"_nc_m2m_3_VEHICLES_6_TRANSPORTs","singular":"_nc_m2m_3_VEHICLES_6_TRANSPORT","custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
c3ly8gfl78g4f7n	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mp95ctr4880xk7r	6_TRANSPORTs	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	18	{"plural":"6_TRANSPORTs","singular":"6_TRANSPORT"}	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
cu1owbs99nlqler	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	3_VEHICLEs	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	12	{"plural":"3_VEHICLEs","singular":"3_VEHICLE"}	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
cczsixmoss6rgkc	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mt90g3ieje9tawr	6_TRANSPORTS_id	6_TRANSPORTS_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
cod9djkey7gmp9b	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mt90g3ieje9tawr	4_DRIVERS_id	4_DRIVERS_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
cdanxa9nu86ig4q	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mt90g3ieje9tawr	6_TRANSPORTS	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	1	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
ca5m0kcy6pudper	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	_nc_m2m_4_DRIVERS_6_TRANSPORTs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	13	{"plural":"_nc_m2m_4_DRIVERS_6_TRANSPORTs","singular":"_nc_m2m_4_DRIVERS_6_TRANSPORT","custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
czayma06hse2p3h	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mt90g3ieje9tawr	4_DRIVERS	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	2	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
cnu7t9pv5j02qgg	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3g9kou5r88eiuh	_nc_m2m_4_DRIVERS_6_TRANSPORTs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	15	{"plural":"_nc_m2m_4_DRIVERS_6_TRANSPORTs","singular":"_nc_m2m_4_DRIVERS_6_TRANSPORT","custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00	\N
ccrzmz4rln7djs3	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3g9kou5r88eiuh	6_TRANSPORTs	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	16	{"plural":"6_TRANSPORTs","singular":"6_TRANSPORT"}	\N	f	wqid8bq2	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00	\N
c4wmq2hyfjp8vso	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	4_DRIVERs	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	14	{"plural":"4_DRIVERs","singular":"4_DRIVER"}	\N	f	wqid8bq2	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00	\N
c68hy4xu4uknswl	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m5vrl3zsxmrxcsy	7_FREIGHTS_id	7_FREIGHTS_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00	\N
c01ioaaedmao998	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m5vrl3zsxmrxcsy	6_TRANSPORTS_id	6_TRANSPORTS_id	ForeignKey	int4	\N	\N	\N	\N	t	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	wqid8bq2	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00	\N
cljyggnz6diej80	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m5vrl3zsxmrxcsy	7_FREIGHTS	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	1	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00	\N
ch4ldryiu5i50e0	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3w5kh70kk3c2l0	_nc_m2m_6_TRANSPORTS_7_FREIGHTs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	17	{"plural":"_nc_m2m_6_TRANSPORTS_7_FREIGHTs","singular":"_nc_m2m_6_TRANSPORTS_7_FREIGHT","custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00	\N
cu2h2moy3zh6qt1	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m5vrl3zsxmrxcsy	6_TRANSPORTS	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	2	{"custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00	\N
cq5zzm2h798z443	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	_nc_m2m_6_TRANSPORTS_7_FREIGHTs	\N	LinkToAnotherRecord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	t	15	{"plural":"_nc_m2m_6_TRANSPORTS_7_FREIGHTs","singular":"_nc_m2m_6_TRANSPORTS_7_FREIGHT","custom":false}	\N	f	wqid8bq2	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00	\N
cwmwxtsga3qwy43	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	7_FREIGHTs	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	16	{"plural":"7_FREIGHTs","singular":"7_FREIGHT"}	\N	f	wqid8bq2	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00	\N
cd1mddqfxnugaq1	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3w5kh70kk3c2l0	6_TRANSPORTs	\N	Links	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	f	18	{"plural":"6_TRANSPORTs","singular":"6_TRANSPORT"}	\N	f	wqid8bq2	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00	\N
c7g9fddmsk3b0ax	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3w5kh70kk3c2l0	Destination (from 6_TRANSPORTS)	Destination (from 6_TRANSPORTS)	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	26	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00	\N
cdcpnyz7n5c2kp4	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3w5kh70kk3c2l0	Departure Date (from 6_TRANSPORTS)	Departure Date (from 6_TRANSPORTS)	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	24	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00	\N
cujsf5t2ifqilrq	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3w5kh70kk3c2l0	Company Name (from 1_CLIENTS)	Company Name (from 1_CLIENTS)	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	21	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00	\N
cstfwpku5xjfmkv	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	Free Percent	Free Percent	Formula	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	25	{"display_column_meta":{"meta":{},"custom":{}},"display_type":null}	\N	f	wqid8bq2	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00	\N
ccm5qxuzl332t23	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	Vehicle Capacity (kg)	Vehicle Capacity (kg)	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	24	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00	\N
chwu65i1koltwil	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	Free Capacity (kg)	Free Capacity (kg)	Formula	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	27	{"display_column_meta":{"meta":{},"custom":{}},"display_type":null}	\N	f	wqid8bq2	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00	\N
cjwn9pp8ncgexwg	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	Vehicle Pallet Spaces	Vehicle Pallet Spaces	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	23	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00	\N
cbleodw1myj0pax	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	Free Pallets	Free Pallets	Formula	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	26	{"display_column_meta":{"meta":{},"custom":{}},"display_type":null}	\N	f	wqid8bq2	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00	\N
cn0vcb15ajvvyhw	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	Driver	Driver	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	19	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00	\N
caql0obpzuqbk2e	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	Vehicle	Vehicle	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	16	{"defaultViewColOrder":10.25,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00	\N
cfwjiomt1iioww0	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m2s591s1lnxfu6a	Contact	Contact	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	29	{"defaultViewColOrder":10.25,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00	\N
ctrn5xolyinajkn	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m2s591s1lnxfu6a	Client	Client	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	26	{"defaultViewColOrder":8.25,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00	\N
cz34w4837wu40p7	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3g9kou5r88eiuh	Vehicle	Vehicle	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	19	{"defaultViewColOrder":14.25,"defaultViewColVisibility":true}	\N	f	wqid8bq2	\N	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00	\N
ce1w2bne17h7b34	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mp95ctr4880xk7r	Full Name (from 4_DRIVERS)	Full Name (from 4_DRIVERS)	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	18	\N	\N	f	wqid8bq2	\N	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00	\N
c85it7rqagnzw9a	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mg8glgpealdlzio	Company Name (from 1_CLIENTS)	Company Name (from 1_CLIENTS)	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	19	{}	\N	f	wqid8bq2	\N	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00	\N
c6pdb246lwxur0y	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mxkvccdz2e8k27r	Full Name (from 2_CONTACTS)	Full Name (from 2_CONTACTS)	Lookup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	14	\N	\N	f	wqid8bq2	\N	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00	\N
\.


--
-- Data for Name: nc_comment_reactions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_comment_reactions (id, row_id, comment_id, source_id, fk_model_id, base_id, reaction, created_by, fk_workspace_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_comments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_comments (id, row_id, comment, created_by, created_by_email, resolved_by, resolved_by_email, parent_comment_id, source_id, base_id, fk_model_id, is_deleted, fk_workspace_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_custom_urls_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_custom_urls_v2 (id, fk_workspace_id, base_id, fk_model_id, view_id, original_path, custom_path, fk_dashboard_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_dashboards_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_dashboards_v2 (id, fk_workspace_id, base_id, title, description, meta, "order", created_by, owned_by, uuid, password, fk_custom_url_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_data_reflection; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_data_reflection (id, fk_workspace_id, username, password, database, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_db_servers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_db_servers (id, title, is_shared, max_tenant_count, current_tenant_count, config, conditions, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_dependency_tracker; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_dependency_tracker (id, fk_workspace_id, base_id, source_type, source_id, dependent_type, dependent_id, created_at, updated_at, queryable_field_0, queryable_field_1, meta, queryable_field_2) FROM stdin;
\.


--
-- Data for Name: nc_disabled_models_for_role_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_disabled_models_for_role_v2 (id, source_id, base_id, fk_view_id, role, disabled, fk_workspace_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_extensions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_extensions (id, base_id, fk_user_id, extension_id, title, kv_store, meta, "order", fk_workspace_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_file_references; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_file_references (id, storage, file_url, file_size, fk_user_id, fk_workspace_id, base_id, source_id, fk_model_id, fk_column_id, is_external, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_filter_exp_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_filter_exp_v2 (id, source_id, base_id, fk_view_id, fk_hook_id, fk_column_id, fk_parent_id, logical_op, comparison_op, value, is_group, "order", comparison_sub_op, fk_link_col_id, fk_value_col_id, fk_parent_column_id, fk_workspace_id, fk_row_color_condition_id, fk_widget_id, meta, created_at, updated_at) FROM stdin;
fiyssde9ec6a8njg	bznmoxpma3xn3sb	pupuc6ugup9dm03	vw46sghw4wkff1ls	\N	ckfllneskfstzzf	\N	and	isWithin	\N	\N	1	nextWeek	\N	\N	\N	wqid8bq2	\N	\N	{"timezone":"Europe/Warsaw"}	2026-02-10 13:35:43+00	2026-02-10 13:36:32+00
fihzwurmetmc58gk	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwk9ual73mgqq663	\N	ckfllneskfstzzf	\N	and	isWithin	\N	\N	1	nextWeek	\N	\N	\N	wqid8bq2	\N	\N	{"timezone":"Europe/Warsaw"}	2026-02-10 13:48:31+00	2026-02-10 13:48:49+00
fiswco0lmcekgar3	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwk9ual73mgqq663	\N	cvwuynxzwp0ukig	\N	and	lte	65	\N	2	\N	\N	\N	\N	wqid8bq2	\N	\N	{"timezone":"Europe/Warsaw"}	2026-02-10 13:49:18+00	2026-02-10 13:49:18+00
fitczgibc7ey4x30	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwc4675ak5vvvugu	\N	c1vwnz3lnox54kz	\N	and	isWithin	\N	\N	1	nextWeek	\N	\N	\N	wqid8bq2	\N	\N	{"timezone":"Europe/Warsaw"}	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fiq06a71xc0pxb6e	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwm2p25qoevx79zl	\N	c1vwnz3lnox54kz	\N	and	isWithin	\N	\N	1	nextWeek	\N	\N	\N	wqid8bq2	\N	\N	{"timezone":"Europe/Warsaw"}	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fi1dgiyi0w6eka32	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwm2p25qoevx79zl	\N	cv7j5xabbktmkgy	\N	and	lte	65	\N	2	\N	\N	\N	\N	wqid8bq2	\N	\N	{"timezone":"Europe/Warsaw"}	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
\.


--
-- Data for Name: nc_follower; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_follower (fk_user_id, fk_follower_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_form_view_columns_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_form_view_columns_v2 (id, source_id, base_id, fk_view_id, fk_column_id, uuid, label, help, description, required, show, "order", meta, enable_scanner, fk_workspace_id, created_at, updated_at) FROM stdin;
fvc811ihfsyos2n1m	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwvuylwyl9110rhb	ckfllneskfstzzf	\N	\N	\N	\N	\N	t	1	\N	\N	wqid8bq2	2026-02-10 13:12:38+00	2026-02-10 13:12:38+00
fvctmvsmg03lhog01	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwvuylwyl9110rhb	cmiuaf9abst33dy	\N	\N	\N	\N	\N	f	2	\N	\N	wqid8bq2	2026-02-10 13:12:38+00	2026-02-10 13:12:38+00
fvcpz2slh2n2ib85m	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwvuylwyl9110rhb	cchcqx0rzyqm1a5	\N	\N	\N	\N	\N	f	3	\N	\N	wqid8bq2	2026-02-10 13:12:38+00	2026-02-10 13:12:38+00
fvc7ddv01m4mcty8p	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwvuylwyl9110rhb	clfgr6vekrae1ao	\N	\N	\N	\N	\N	f	4	\N	\N	wqid8bq2	2026-02-10 13:12:38+00	2026-02-10 13:12:38+00
fvc9530ykcdn0h40k	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwvuylwyl9110rhb	c4488jqu1cfwreb	\N	\N	\N	\N	\N	f	5	\N	\N	wqid8bq2	2026-02-10 13:12:38+00	2026-02-10 13:12:38+00
fvcf8cwiogj9b1yi4	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwvuylwyl9110rhb	cxq6pp2ysg4v85k	\N	\N	\N	\N	\N	f	6	\N	\N	wqid8bq2	2026-02-10 13:12:38+00	2026-02-10 13:12:38+00
fvc9gtbs5kxysz10z	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwvuylwyl9110rhb	crlqeqpq8zrh94k	\N	\N	\N	\N	\N	f	7	\N	\N	wqid8bq2	2026-02-10 13:12:38+00	2026-02-10 13:12:38+00
fvc6kd1ujxh5j9poz	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwvuylwyl9110rhb	ct1zt0dav2juhz2	\N	\N	\N	\N	\N	t	9	\N	\N	wqid8bq2	2026-02-10 13:12:38+00	2026-02-10 13:12:38+00
fvchae4wr9i50i8az	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwvuylwyl9110rhb	cmy7ib7lxogr0wy	\N	\N	\N	\N	\N	t	10	\N	\N	wqid8bq2	2026-02-10 13:12:38+00	2026-02-10 13:12:38+00
fvck8sfznrsituak9	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwvuylwyl9110rhb	cheyslwwnaslwi3	\N	\N	\N	\N	\N	f	12	\N	\N	wqid8bq2	2026-02-10 13:12:38+00	2026-02-10 13:12:38+00
fvc2joa4k203e7sbz	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwvuylwyl9110rhb	cb9zfb6cmyk3nb3	\N	\N	\N	\N	\N	t	13	\N	\N	wqid8bq2	2026-02-10 13:12:38+00	2026-02-10 13:12:38+00
fvc6p7yljp7kfen75	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwvuylwyl9110rhb	cuwu5vokhwerd37	\N	\N	\N	\N	\N	t	14	\N	\N	wqid8bq2	2026-02-10 13:12:38+00	2026-02-10 13:12:38+00
fvccpvqj8yecg714d	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwvuylwyl9110rhb	cxwl6txkfe3uf7p	\N	\N	\N	\N	\N	f	15	\N	\N	wqid8bq2	2026-02-10 13:12:38+00	2026-02-10 13:12:38+00
fvcyjzoegzz46alwv	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwvuylwyl9110rhb	cd03nr1ew2nvc55	\N	\N	\N	\N	\N	t	16	\N	\N	wqid8bq2	2026-02-10 13:12:38+00	2026-02-10 13:12:38+00
fvc83d8wkiirn1o4f	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwvuylwyl9110rhb	cv0nu1w5m6g4k0p	\N	\N	\N	\N	\N	t	17	\N	\N	wqid8bq2	2026-02-10 13:12:38+00	2026-02-10 13:12:38+00
fvc5tlwtxz8vr2ahj	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwvuylwyl9110rhb	cfdmjgmx05n40su	\N	\N	\N	\N	\N	f	18	\N	\N	wqid8bq2	2026-02-10 13:12:38+00	2026-02-10 13:12:38+00
fvc86glzc1rzvjs07	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwvuylwyl9110rhb	cvwuynxzwp0ukig	\N	\N	\N	\N	\N	t	20	\N	\N	wqid8bq2	2026-02-10 13:12:38+00	2026-02-10 13:12:38+00
fvcjjq4m7bty1al4g	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwvuylwyl9110rhb	c77cudldn2ldi4z	\N	Origin	\N		f	t	8	{"validators":[],"visibility":{"errors":{}},"defaultViewColOrder":8,"defaultViewColVisibility":true}	\N	wqid8bq2	2026-02-10 13:12:38+00	2026-02-10 13:13:30+00
fvcencupfn6tb3nnq	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwvuylwyl9110rhb	chtfkfr68ef5chk	\N	Notes	\N		f	t	11	{"validators":[],"visibility":{"errors":{}},"defaultViewColOrder":13,"defaultViewColVisibility":true}	\N	wqid8bq2	2026-02-10 13:12:38+00	2026-02-10 13:14:50+00
fvcomjntoig2zrogi	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwvuylwyl9110rhb	cfjdmoaypas3ot4	\N	7_FREIGHTs	\N		f	t	19	{"validators":[],"visibility":{"errors":{}},"plural":"7_FREIGHTs","singular":"7_FREIGHT","defaultViewColOrder":17,"defaultViewColVisibility":true}	\N	wqid8bq2	2026-02-10 13:12:38+00	2026-02-10 13:14:52+00
fvcurn23lp40rkw6e	bznmoxpma3xn3sb	pupuc6ugup9dm03	vw64ans3hxhs2kec	cydwridzimubwq2	\N	\N	\N	\N	\N	f	2	\N	\N	wqid8bq2	2026-02-10 13:20:19+00	2026-02-10 13:20:19+00
fvc43o6fwxj4o6v6n	bznmoxpma3xn3sb	pupuc6ugup9dm03	vw64ans3hxhs2kec	cdpwzn80phliz20	\N	\N	\N	\N	\N	f	3	\N	\N	wqid8bq2	2026-02-10 13:20:19+00	2026-02-10 13:20:19+00
fvcub9vyfbt8iftu9	bznmoxpma3xn3sb	pupuc6ugup9dm03	vw64ans3hxhs2kec	c3u3scecll79398	\N	\N	\N	\N	\N	f	4	\N	\N	wqid8bq2	2026-02-10 13:20:19+00	2026-02-10 13:20:19+00
fvcaalugfnt1kgikt	bznmoxpma3xn3sb	pupuc6ugup9dm03	vw64ans3hxhs2kec	cpagmhhd6g0fcvk	\N	\N	\N	\N	\N	f	5	\N	\N	wqid8bq2	2026-02-10 13:20:19+00	2026-02-10 13:20:19+00
fvcri8xksbhwsvo9c	bznmoxpma3xn3sb	pupuc6ugup9dm03	vw64ans3hxhs2kec	cc2llzh7oihvjhk	\N	\N	\N	\N	\N	f	6	\N	\N	wqid8bq2	2026-02-10 13:20:19+00	2026-02-10 13:20:19+00
fvcugyo1zlcuujfnt	bznmoxpma3xn3sb	pupuc6ugup9dm03	vw64ans3hxhs2kec	cl28kb4gtf60kyp	\N	\N	\N	\N	\N	f	7	\N	\N	wqid8bq2	2026-02-10 13:20:19+00	2026-02-10 13:20:19+00
fvch7lwn56lhew2f1	bznmoxpma3xn3sb	pupuc6ugup9dm03	vw64ans3hxhs2kec	ciizexx8gnmmh8u	\N	\N	\N	\N	\N	t	8	\N	\N	wqid8bq2	2026-02-10 13:20:19+00	2026-02-10 13:20:19+00
fvc5ai0xiy67s3l1f	bznmoxpma3xn3sb	pupuc6ugup9dm03	vw64ans3hxhs2kec	c4fz8qjifateuuv	\N	\N	\N	\N	\N	t	11	\N	\N	wqid8bq2	2026-02-10 13:20:19+00	2026-02-10 13:20:19+00
fvc4vavpvogwdek7l	bznmoxpma3xn3sb	pupuc6ugup9dm03	vw64ans3hxhs2kec	c6h4pr6nf24v55t	\N	\N	\N	\N	\N	t	12	\N	\N	wqid8bq2	2026-02-10 13:20:19+00	2026-02-10 13:20:19+00
fvc939xkwrnsj5d9g	bznmoxpma3xn3sb	pupuc6ugup9dm03	vw64ans3hxhs2kec	c2l6l8py4xjuu7j	\N	Client	\N		f	t	1	{"validators":[],"visibility":{"errors":{}},"defaultViewColOrder":1,"defaultViewColVisibility":true}	\N	wqid8bq2	2026-02-10 13:20:19+00	2026-02-10 13:21:07+00
fvc7m1m30nc30xsfr	bznmoxpma3xn3sb	pupuc6ugup9dm03	vw64ans3hxhs2kec	c0c98b5g14umg7j	\N	Quantity	\N		f	t	9	{"validators":[],"visibility":{"errors":{}},"isLocaleString":false,"defaultViewColOrder":11,"defaultViewColVisibility":true}	\N	wqid8bq2	2026-02-10 13:20:19+00	2026-02-10 13:21:16+00
fvcfphzsnwuto34kf	bznmoxpma3xn3sb	pupuc6ugup9dm03	vw64ans3hxhs2kec	cz4rzid030j5ukx	\N	Cargo Description	\N		f	t	10	{"validators":[],"visibility":{"errors":{}},"defaultViewColOrder":12,"defaultViewColVisibility":true}	\N	wqid8bq2	2026-02-10 13:20:19+00	2026-02-10 13:28:25+00
fvcrgl5pkbf5rppx1	bznmoxpma3xn3sb	pupuc6ugup9dm03	vw64ans3hxhs2kec	cvk3wq35dagvfah	\N	\N	\N	\N	\N	t	15	\N	\N	wqid8bq2	2026-02-10 13:20:19+00	2026-02-10 13:20:19+00
fvcqot05u1kv48kq0	bznmoxpma3xn3sb	pupuc6ugup9dm03	vw64ans3hxhs2kec	cve6so9t8q8g5en	\N	\N	\N	\N	\N	t	16	\N	\N	wqid8bq2	2026-02-10 13:20:19+00	2026-02-10 13:20:19+00
fvc43xr69i8fu0j6s	bznmoxpma3xn3sb	pupuc6ugup9dm03	vw64ans3hxhs2kec	cqpd6c27fhb1mnq	\N	\N	\N	\N	\N	f	17	\N	\N	wqid8bq2	2026-02-10 13:20:19+00	2026-02-10 13:20:19+00
fvcpgxut4cuw2ybmm	bznmoxpma3xn3sb	pupuc6ugup9dm03	vw64ans3hxhs2kec	cmkzvu89sq1tqwe	\N	\N	\N	\N	\N	t	18	\N	\N	wqid8bq2	2026-02-10 13:20:19+00	2026-02-10 13:20:19+00
fvcusndonp5zks4rd	bznmoxpma3xn3sb	pupuc6ugup9dm03	vw64ans3hxhs2kec	cmuad2sogee58l5	\N	\N	\N	\N	\N	t	19	\N	\N	wqid8bq2	2026-02-10 13:20:19+00	2026-02-10 13:20:19+00
fvcdquoxn6xr5y921	bznmoxpma3xn3sb	pupuc6ugup9dm03	vw64ans3hxhs2kec	capd7u5lhggawnz	\N	\N	\N	\N	\N	f	20	\N	\N	wqid8bq2	2026-02-10 13:20:19+00	2026-02-10 13:20:19+00
fvc3r2u3flnmii8vv	bznmoxpma3xn3sb	pupuc6ugup9dm03	vw64ans3hxhs2kec	cbwarj2unek0fx7	\N	\N	\N	\N	\N	t	21	\N	\N	wqid8bq2	2026-02-10 13:20:19+00	2026-02-10 13:20:19+00
fvc5nsszg2z4q6xpm	bznmoxpma3xn3sb	pupuc6ugup9dm03	vw64ans3hxhs2kec	cqa5y3yzcdt5ltr	\N	\N	\N	\N	\N	t	22	\N	\N	wqid8bq2	2026-02-10 13:20:19+00	2026-02-10 13:20:19+00
fvc3bn2djpde2g8qm	bznmoxpma3xn3sb	pupuc6ugup9dm03	vw64ans3hxhs2kec	c6zmah4nvr48ngd	\N	\N	\N	\N	\N	t	23	\N	\N	wqid8bq2	2026-02-10 13:20:19+00	2026-02-10 13:20:19+00
fvch81k7y2a47ju21	bznmoxpma3xn3sb	pupuc6ugup9dm03	vw64ans3hxhs2kec	c3305onaea54zoz	\N	\N	\N	\N	\N	t	24	\N	\N	wqid8bq2	2026-02-10 13:20:19+00	2026-02-10 13:20:19+00
fvc6axys3zrwbmrrd	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwjtp0nqbpcmfk57	c79yuvg7344emms	\N	\N	\N	\N	\N	f	2	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvc5ues58mqltmm7w	bznmoxpma3xn3sb	pupuc6ugup9dm03	vw64ans3hxhs2kec	c1ao0fait4zsa1t	\N	Invoiced	\N		f	t	15	{"validators":[],"visibility":{"errors":{}},"iconIdx":0,"icon":{"checked":"mdi-check-bold","unchecked":"mdi-crop-square","label":"square"},"color":"#52DE84","defaultViewColOrder":17,"defaultViewColVisibility":true}	\N	wqid8bq2	2026-02-10 13:20:19+00	2026-02-10 13:21:48+00
fvco1t9e9n6yx6m6w	bznmoxpma3xn3sb	pupuc6ugup9dm03	vw64ans3hxhs2kec	cwmv5m3yjc4vjgd	\N	\N	\N	\N	f	t	14	{"validators":[],"visibility":{"errors":{}},"currency_locale":"de","currency_code":"EUR","precision":2,"defaultViewColOrder":16,"defaultViewColVisibility":true}	\N	wqid8bq2	2026-02-10 13:20:19+00	2026-02-10 13:29:17+00
fvct06rxkyk2i021t	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwvuylwyl9110rhb	cv8ytsdg9nq16kt	\N	\N	\N	\N	\N	f	21	\N	\N	wqid8bq2	2026-02-10 15:46:28+00	2026-02-10 15:46:28+00
fvcb8r30npx4c0dlm	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwvuylwyl9110rhb	cjiu54csjvbbl7f	\N	\N	\N	\N	\N	f	22	\N	\N	wqid8bq2	2026-02-10 15:46:52+00	2026-02-10 15:46:52+00
fvcvvlz6r7rqypdin	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwvuylwyl9110rhb	c5sxauwunyn6r03	\N	\N	\N	\N	\N	f	23	\N	\N	wqid8bq2	2026-02-10 15:47:32+00	2026-02-10 15:47:32+00
fvc66j73m7x0jrvwf	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwvuylwyl9110rhb	ch362zepnzku4nx	\N	\N	\N	\N	\N	f	24	\N	\N	wqid8bq2	2026-02-10 15:48:01+00	2026-02-10 15:48:01+00
fvcp0d88jux0op2yf	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwvuylwyl9110rhb	ckfemyv8pfxvwpm	\N	\N	\N	\N	\N	f	25	\N	\N	wqid8bq2	2026-02-10 15:48:22+00	2026-02-10 15:48:22+00
fvcm3q6w9bis4i58c	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwjtp0nqbpcmfk57	cfeqvvbh4fun0qf	\N	\N	\N	\N	\N	f	11	\N	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvch8fxexb0632puw	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwjtp0nqbpcmfk57	ca5m0kcy6pudper	\N	\N	\N	\N	\N	f	13	\N	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvcsfk09es8jgryok	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwjtp0nqbpcmfk57	cq5zzm2h798z443	\N	\N	\N	\N	\N	f	15	\N	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvcj46862nbjdw7gz	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwjtp0nqbpcmfk57	c1vwnz3lnox54kz	\N	\N	\N	\N	\N	t	1	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvcv8lfvu63pit5x6	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwjtp0nqbpcmfk57	ccpi7ncgcnpnynu	\N	\N	\N	\N	\N	f	3	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvch0spchs5fz6kon	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwjtp0nqbpcmfk57	cbl6jx8pv9olf98	\N	\N	\N	\N	\N	f	4	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvcagydbmdsd5ing9	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwjtp0nqbpcmfk57	cuubl86zu5f58fj	\N	\N	\N	\N	\N	f	7	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvcwu9n3emizemkit	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwjtp0nqbpcmfk57	ct4fse4fn1g2b0p	\N	Origin	\N		f	t	8	{"validators":[],"visibility":{"errors":{}},"defaultViewColOrder":8,"defaultViewColVisibility":true}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvcai3q05sanimmst	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwjtp0nqbpcmfk57	cdrxhq7sj28nxzq	\N	\N	\N	\N	\N	t	9	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvc8qb8oavola0qlo	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwjtp0nqbpcmfk57	cbl4sswrm0gq15b	\N	\N	\N	\N	\N	t	10	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvcfhjslosl7lqrgy	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwjtp0nqbpcmfk57	cv7j5xabbktmkgy	\N	\N	\N	\N	\N	t	20	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvc112dggspkazz7i	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vw3byhppcky2j4uw	coijtx5oskcxw92	\N	\N	\N	\N	\N	t	15	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvc42yxck0g06jgdk	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vw3byhppcky2j4uw	cg6d3lfdzrri7ff	\N	\N	\N	\N	\N	t	16	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvcvscb1ytvncuqh4	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vw3byhppcky2j4uw	cgvw6sc7ktb7tua	\N	\N	\N	\N	\N	t	18	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvc2ggda81o3ttr9h	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vw3byhppcky2j4uw	cd1mddqfxnugaq1	\N	\N	\N	\N	\N	t	21	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvcdcgyuqct9zd4sv	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vw3byhppcky2j4uw	cujsf5t2ifqilrq	\N	\N	\N	\N	\N	t	19	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvcj964vm0bk8cxtf	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vw3byhppcky2j4uw	cdcpnyz7n5c2kp4	\N	\N	\N	\N	\N	t	22	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvcz6y8lxzn0yppb2	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vw3byhppcky2j4uw	cmbl579v4xzuilu	\N	\N	\N	\N	\N	t	23	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvcby89qxxlun294j	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vw3byhppcky2j4uw	c7g9fddmsk3b0ax	\N	\N	\N	\N	\N	t	24	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvckpzetk370oqcw3	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwjtp0nqbpcmfk57	ccpzp2183phyy9q	\N	Notes	\N		f	t	11	{"validators":[],"visibility":{"errors":{}},"defaultViewColOrder":13,"defaultViewColVisibility":true}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvcwwycuh6aryasc9	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwjtp0nqbpcmfk57	cu1owbs99nlqler	\N	\N	\N	\N	\N	t	13	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvcww0tly6jczy35r	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwjtp0nqbpcmfk57	c4wmq2hyfjp8vso	\N	\N	\N	\N	\N	t	16	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvchym8lh3zvsczk6	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwjtp0nqbpcmfk57	cwmwxtsga3qwy43	\N	7_FREIGHTs	\N		f	t	19	{"validators":[],"visibility":{"errors":{}},"plural":"7_FREIGHTs","singular":"7_FREIGHT","defaultViewColOrder":17,"defaultViewColVisibility":true}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvc1ss30yhz8ov4ej	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwjtp0nqbpcmfk57	caql0obpzuqbk2e	\N	\N	\N	\N	\N	t	14	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvcf70arbiqiforlj	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwjtp0nqbpcmfk57	cn0vcb15ajvvyhw	\N	\N	\N	\N	\N	t	17	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvc4ifsfi7cnv3x9w	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwjtp0nqbpcmfk57	cjwn9pp8ncgexwg	\N	\N	\N	\N	\N	f	21	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvc96rnwu54lvyxju	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwjtp0nqbpcmfk57	ccm5qxuzl332t23	\N	\N	\N	\N	\N	f	22	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvc8d9lbejvjyonne	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwjtp0nqbpcmfk57	cstfwpku5xjfmkv	\N	\N	\N	\N	\N	f	23	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvcnp5mkfxo4ssqtn	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwjtp0nqbpcmfk57	cbleodw1myj0pax	\N	\N	\N	\N	\N	f	24	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvcz9r9p155q0fidl	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwjtp0nqbpcmfk57	chwu65i1koltwil	\N	\N	\N	\N	\N	f	25	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvc7j3ykt16bmdekn	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vw3byhppcky2j4uw	cu1g4ukt1xot671	\N	\N	\N	\N	\N	f	15	\N	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvcudj5w32pguzkc3	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vw3byhppcky2j4uw	ch4ldryiu5i50e0	\N	\N	\N	\N	\N	f	17	\N	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvc428z6nxwlyou0h	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vw3byhppcky2j4uw	clnvr4viug5041q	\N	Client	\N		f	t	1	{"validators":[],"visibility":{"errors":{}},"defaultViewColOrder":1,"defaultViewColVisibility":true}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvcbkz3c8970m7l0z	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vw3byhppcky2j4uw	cg3d80bkjn88fh0	\N	\N	\N	\N	\N	f	2	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvc4rahvlavd49zi3	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vw3byhppcky2j4uw	cko5yg3y74xu798	\N	\N	\N	\N	\N	f	3	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvczrraqca4exffl5	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vw3byhppcky2j4uw	cn4ojnqxp5j4fny	\N	\N	\N	\N	\N	f	4	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvcqyhnyh8spwk7hs	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vw3byhppcky2j4uw	c45avkl5z3x22it	\N	\N	\N	\N	\N	f	7	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvc4szkjxorz2gzkv	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vw3byhppcky2j4uw	cgk36zdeuu6mlrc	\N	\N	\N	\N	\N	t	8	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvcq2flw722d0p166	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vw3byhppcky2j4uw	clctzdyrpo87u84	\N	Quantity	\N		f	t	9	{"validators":[],"visibility":{"errors":{}},"isLocaleString":false,"defaultViewColOrder":11,"defaultViewColVisibility":true}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvcfvrjae08j852lu	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vw3byhppcky2j4uw	cjm9lz2ecsbf0ak	\N	Cargo Description	\N		f	t	10	{"validators":[],"visibility":{"errors":{}},"defaultViewColOrder":12,"defaultViewColVisibility":true}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvcpcpk91f69511c6	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vw3byhppcky2j4uw	c8v0qjz5r4ssjfs	\N	\N	\N	\N	\N	t	11	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvcjkpytwm3c7iqp2	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vw3byhppcky2j4uw	cmqscgkv53zb1nr	\N	\N	\N	\N	\N	t	12	{}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvc4bk7duaj5eim77	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vw3byhppcky2j4uw	cnjy0cy495avtkr	\N	\N	\N	\N	f	t	14	{"validators":[],"visibility":{"errors":{}},"currency_locale":"de","currency_code":"EUR","precision":2,"defaultViewColOrder":16,"defaultViewColVisibility":true}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
fvcl7ulo9lcyj3092	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vw3byhppcky2j4uw	crri08817y0hzxj	\N	Invoiced	\N		f	t	15	{"validators":[],"visibility":{"errors":{}},"iconIdx":0,"icon":{"checked":"mdi-check-bold","unchecked":"mdi-crop-square","label":"square"},"color":"#52DE84","defaultViewColOrder":17,"defaultViewColVisibility":true}	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
\.


--
-- Data for Name: nc_form_view_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_form_view_v2 (source_id, base_id, fk_view_id, heading, subheading, success_msg, redirect_url, redirect_after_secs, email, submit_another_form, show_blank_form, uuid, banner_image_url, logo_url, meta, fk_workspace_id, created_at, updated_at) FROM stdin;
bznmoxpma3xn3sb	pupuc6ugup9dm03	vwvuylwyl9110rhb	Add_Transport			\N	\N	\N	f	f	\N	\N	\N	{"hide_branding":false,"background_color":"#D7F2FF","hide_banner":false}	wqid8bq2	2026-02-10 13:12:38+00	2026-02-11 11:56:25+00
bznmoxpma3xn3sb	pupuc6ugup9dm03	vw64ans3hxhs2kec	ADD_FREIGHT			\N	\N	\N	f	f	\N	\N	\N	{"hide_branding":false,"background_color":"#F9F9FA","hide_banner":false}	wqid8bq2	2026-02-10 13:20:19+00	2026-02-16 15:29:30+00
bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwjtp0nqbpcmfk57	Add_Transport			\N	\N	\N	f	f	\N	\N	\N	{"hide_branding":false,"background_color":"#D7F2FF","hide_banner":false}	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
bjtfj3ddt8m4k3e	p3llodmezayxe7x	vw3byhppcky2j4uw	ADD_FREIGHT			\N	\N	\N	f	f	\N	\N	\N	{"hide_branding":false,"background_color":"#F9F9FA","hide_banner":false}	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
\.


--
-- Data for Name: nc_gallery_view_columns_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_gallery_view_columns_v2 (id, source_id, base_id, fk_view_id, fk_column_id, uuid, label, help, show, "order", fk_workspace_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_gallery_view_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_gallery_view_v2 (source_id, base_id, fk_view_id, next_enabled, prev_enabled, cover_image_idx, fk_cover_image_col_id, cover_image, restrict_types, restrict_size, restrict_number, public, dimensions, responsive_columns, meta, fk_workspace_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_grid_view_columns_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_grid_view_columns_v2 (id, fk_view_id, fk_column_id, source_id, base_id, uuid, label, help, width, show, "order", group_by, group_by_order, group_by_sort, aggregation, fk_workspace_id, created_at, updated_at) FROM stdin;
ncidw9g6pv3tah50	vwjee43x47p4x517	c7jqmgjul0mr8vd	b5b4nwkmm6723gc	ptbstfo5b36htsq	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-04 13:41:42+00	2026-02-04 13:41:42+00
ncmgoarc5q806qyh	vwjee43x47p4x517	cjakigzauy8917c	b5b4nwkmm6723gc	ptbstfo5b36htsq	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-04 13:41:42+00	2026-02-04 13:41:42+00
ncgqgxm8woccre5e	vwjee43x47p4x517	cq2b9damb5urruk	b5b4nwkmm6723gc	ptbstfo5b36htsq	\N	\N	\N	200px	t	3	\N	\N	\N	none	wqid8bq2	2026-02-04 13:41:42+00	2026-02-04 13:41:42+00
ncj26si0y48repbz	vwjee43x47p4x517	ctm8lkzhqqpsqin	b5b4nwkmm6723gc	ptbstfo5b36htsq	\N	\N	\N	200px	t	4	\N	\N	\N	none	wqid8bq2	2026-02-04 13:41:42+00	2026-02-04 13:41:42+00
ncjnrkha0i98cmdd	vwjee43x47p4x517	c1hvjefion51jma	b5b4nwkmm6723gc	ptbstfo5b36htsq	\N	\N	\N	200px	t	5	\N	\N	\N	none	wqid8bq2	2026-02-04 13:41:42+00	2026-02-04 13:41:42+00
nctrinq7x5gcjkym	vwjee43x47p4x517	c0twc61pibclxe2	b5b4nwkmm6723gc	ptbstfo5b36htsq	\N	\N	\N	200px	t	6	\N	\N	\N	none	wqid8bq2	2026-02-04 13:41:42+00	2026-02-04 13:41:42+00
ncysepfzw0c5sigw	vwjee43x47p4x517	cx0wkox5z2pekwl	b5b4nwkmm6723gc	ptbstfo5b36htsq	\N	\N	\N	200px	t	7	\N	\N	\N	none	wqid8bq2	2026-02-04 13:41:42+00	2026-02-04 13:41:42+00
ncuz1750tb9lafe4	vwpiwjnlbkadm5qy	cyziwb8livhn9x3	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-04 14:03:48+00
ncwq3seiv9cwx60l	vwpiwjnlbkadm5qy	c5d6v51kycylviz	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	3	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-04 14:03:48+00
ncxw9atqv7kf7k9t	vwpiwjnlbkadm5qy	cvty1pbubjyvast	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	4	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-04 14:03:48+00
ncmtux4qwtkftbc1	vwpiwjnlbkadm5qy	c5duftdm5yrdqrs	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	5	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-04 14:03:48+00
ncu1lzr4i8boj23m	vwpiwjnlbkadm5qy	c8bd3kxq0bin69g	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	6	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-04 14:03:48+00
ncmn00sk69mv5y6l	vwpiwjnlbkadm5qy	ckwg9jsnem6d812	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	7	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-04 14:03:48+00
ncre3jixlfiyz0w4	vwpiwjnlbkadm5qy	cyf95ycuc1dir5x	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	8	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-04 14:03:48+00
ncijq7njpfq7m7wf	vwpiwjnlbkadm5qy	chttsusxo5xpqq6	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	9	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-04 14:03:48+00
nct4dcm65o1ccef6	vwpiwjnlbkadm5qy	c34quk1et4y5pcz	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	11	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-04 14:03:48+00
ncwyhpocc548wk63	vwpiwjnlbkadm5qy	ccdtc2e1rudxdyi	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	12	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-04 14:03:48+00
ncywb1kmhib21zdv	vwpiwjnlbkadm5qy	c6gzyjny49zofc9	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	13	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-04 14:03:48+00
ncu98z2pxhkrd07p	vw16iqj48dsn1t0l	c2nbpggrn6owwf0	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:38:18+00
nc5g6mekmzfr3iwt	vw16iqj48dsn1t0l	cchwvjoyq7bj1hk	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:38:18+00
ncj8bvayunor7iax	vw16iqj48dsn1t0l	ciu86ephgoccs1j	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	3	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:38:18+00
ncj5mcpvndfcx9ty	vw16iqj48dsn1t0l	c63yc9sjogxsgbp	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	4	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:38:18+00
nco5emnuw57xrdd2	vw16iqj48dsn1t0l	cuo2921tvs7yj7x	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	5	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:38:18+00
ncqcnp8304atb12b	vw16iqj48dsn1t0l	c4s16wqlszj77kj	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	6	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:38:18+00
ncqb08ig5nofgvd8	vw16iqj48dsn1t0l	cllzyshti3ft6uw	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	7	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:38:18+00
ncine9bprkf7d9wh	vw16iqj48dsn1t0l	c6xwf0zvnc0i1wv	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	8	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:38:18+00
ncjx3250fwluztse	vw16iqj48dsn1t0l	cagos3j9ylye6h0	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	10	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:38:18+00
nc4biqcegn1yjxx7	vw16iqj48dsn1t0l	cdu655wgil3odmm	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	12	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:38:18+00
ncvhaenx5ogbfgq9	vwng57dgeuwixxem	cdfgt6v8nwr9y3i	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:55:51+00
ncbxb23ncamjc51k	vwng57dgeuwixxem	chs7p910b3q6yqm	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:55:51+00
ncwbtsgz3u9g4y2o	vwng57dgeuwixxem	cb2lea7uclll4xr	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	3	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:55:51+00
nc4s14u1uat7ody1	vwng57dgeuwixxem	cprrkoqjjy9l5w4	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	4	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:55:51+00
ncg9mo0hsgyd0ofr	vwng57dgeuwixxem	cxy2p323hd0qxqy	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	5	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:55:51+00
ncl87oj15g49oc6j	vwng57dgeuwixxem	c1htv3a08clctde	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	6	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:55:51+00
ncrwhyuyg6nmknkf	vwng57dgeuwixxem	cq9bcqdp1uddy8v	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	7	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:55:51+00
ncy67a9u8v226x7o	vwng57dgeuwixxem	c0jnjk2odll3lua	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	8	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:55:51+00
ncn18ifleceuuiq5	vwng57dgeuwixxem	ckaouubcd7i4gyu	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	9	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:55:51+00
ncyve32ffhlfjc23	vwng57dgeuwixxem	cesdp9nw5n67yxk	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	10	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:55:51+00
nceihryqb905dleb	vwng57dgeuwixxem	cq97xn3cuh3mohw	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	11	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:55:51+00
ncrp7ei7wyjhjo1e	vwng57dgeuwixxem	c66lc7ur0u96fqs	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	12	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:55:51+00
nch13d4ggceokbrj	vwng57dgeuwixxem	cqn3y5r2szclrrt	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	13	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:55:51+00
ncdys446zjese7ww	vwng57dgeuwixxem	ca5tehxb5qu3trm	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	14	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:55:51+00
ncojqkfmdezbmnar	vwng57dgeuwixxem	c6iwsnpecti6kwh	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	15	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:55:51+00
ncwfrq8t42twmggp	vwng57dgeuwixxem	c4zvkx95ndqle16	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	16	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:55:51+00
nc3f8d9s7as5ogva	vwtg43x3weqf23yy	cra65d75swysgg2	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:52+00	2026-02-09 17:55:51+00
nc04kviwnc3xstp4	vwtg43x3weqf23yy	c5a77avh7ubza4h	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	3	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:52+00	2026-02-09 17:55:51+00
nc75xux5x77gdo53	vwtg43x3weqf23yy	c97ngcx7orh3bzb	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	4	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:52+00	2026-02-09 17:55:51+00
ncg8u6aaeed3fmtl	vwtg43x3weqf23yy	c1ugs0ap4yky8o0	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	5	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:52+00	2026-02-09 17:55:51+00
nczytgjuci320n8e	vwtg43x3weqf23yy	c16srdwhzz0a7pp	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	6	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:52+00	2026-02-09 17:55:51+00
ncbdtrdwcxh7rnds	vwtg43x3weqf23yy	ca2tjo3nddmel5y	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	7	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:52+00	2026-02-09 17:55:51+00
nchlzd239233v06k	vwtg43x3weqf23yy	cqrt8an0urr8w35	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	8	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:52+00	2026-02-09 17:55:51+00
nc16115bz4ccqhts	vwtg43x3weqf23yy	codggsij3km6lx8	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	9	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:52+00	2026-02-09 17:55:51+00
ncz5it8e6s4va8a9	vwtg43x3weqf23yy	cqjeqj5psqekap9	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	10	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:52+00	2026-02-09 17:55:51+00
nchrlzo3wm1rhwjz	vwtg43x3weqf23yy	czg2afeptb6je6u	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	11	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:52+00	2026-02-09 17:55:51+00
ncdsm8kvj7c1ti7b	vwtg43x3weqf23yy	choxwcuo6pmcyk6	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	12	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:52+00	2026-02-09 17:55:51+00
nczhutgfe0biahih	vwtg43x3weqf23yy	c3uybhwo4d34h36	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	13	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:52+00	2026-02-09 17:55:51+00
ncla6rsngkpakpkz	vwdgbj96cj6updef	ckfllneskfstzzf	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:14:43+00
nc5v2qaa2hwl1yum	vwtg43x3weqf23yy	crc6aim561n4s9s	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	15	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:52+00	2026-02-09 17:55:51+00
ncs4xzkm9w4flv0n	vwhwhzpkek3zzhv4	cmn1ybxtu5x8dir	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:04:28+00
ncj9e3qs3sa2lx68	vwhwhzpkek3zzhv4	ctfseugejnckr3v	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:04:28+00
ncho5o3o06dw19x5	vwhwhzpkek3zzhv4	cou2x126i74vb4i	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	3	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:04:28+00
nc8f1c7gsjz4udcj	vwhwhzpkek3zzhv4	c23coqijztqlony	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	4	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:04:28+00
nc64pb1n1uqdtuqg	vwhwhzpkek3zzhv4	cgzz9bqe8zukewh	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	5	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:04:28+00
nci7hhqu3wb3uz3a	vwhwhzpkek3zzhv4	cy5q2fosg5ptppw	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	6	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:04:28+00
ncjil64hskop2gcn	vwhwhzpkek3zzhv4	c29udfv0h7p7jwm	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	7	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:04:28+00
nc4scfi6vd79yftw	vwdgbj96cj6updef	cmiuaf9abst33dy	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:14:43+00
nc5391vw3ituqqb6	vwdgbj96cj6updef	cchcqx0rzyqm1a5	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	3	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:14:43+00
ncf5am352npi634n	vwhwhzpkek3zzhv4	cpqf815rcewemca	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	11	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:04:28+00
nc2ojiztnrnpg3gq	vwhwhzpkek3zzhv4	co2p76yxmu15j0c	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	12	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:04:28+00
nca4onjsyzl3plqo	vwhwhzpkek3zzhv4	chn4jquzl3h28zo	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	13	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:04:28+00
ncji96vo125objkt	vwhwhzpkek3zzhv4	c8sm408mq0rdcto	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	14	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:04:28+00
ncpwcq6pt06001xv	vwhwhzpkek3zzhv4	c235bwvy3tdxwf6	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	15	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:04:28+00
nctc9ncq24uen5w6	vwhwhzpkek3zzhv4	c0ym69tqbt8gwt3	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	16	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:04:28+00
ncehybwpqj9c2jnv	vwhwhzpkek3zzhv4	c6zwoo8y63ltyv3	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	17	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:04:28+00
nc62cq8n1xvppgtn	vwhwhzpkek3zzhv4	cjghtnwgjnrzevk	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	18	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:04:28+00
ncvwtur8aaslo1s5	vwhwhzpkek3zzhv4	cjbz903x16h3fxq	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	19	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:04:28+00
nc6ica5ym7zdt52u	vwhwhzpkek3zzhv4	cd389hjyxspaaxb	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	20	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:04:28+00
nchf0gddv9qjyxgi	vwhwhzpkek3zzhv4	cc24y3hh7vpd4dj	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	21	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:04:28+00
ncjjqnue1ankd3ga	vwhwhzpkek3zzhv4	cmf6l7fe8gjbnxj	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	22	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:04:28+00
nc29cepgj26o8bc8	vwdgbj96cj6updef	clfgr6vekrae1ao	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	4	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:14:43+00
nci23j9goi6ujdvs	vwdgbj96cj6updef	c4488jqu1cfwreb	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	5	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:14:43+00
ncxok1d5vyyncwqk	vwdgbj96cj6updef	cxq6pp2ysg4v85k	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	6	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:14:43+00
nccginatbx1r8s8x	vwdgbj96cj6updef	crlqeqpq8zrh94k	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	7	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:14:43+00
nc7aitzh8sksvfvj	vwdgbj96cj6updef	c77cudldn2ldi4z	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	8	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:14:43+00
nci4r6fm7ej9ka8w	vwdgbj96cj6updef	ct1zt0dav2juhz2	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	9	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:14:43+00
ncp6vj3iay0nplro	vw86ojeksm77qo9v	cydwridzimubwq2	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-04 14:01:47+00	2026-02-09 18:20:35+00
nc2psmi3ogj89sse	vwdgbj96cj6updef	cmy7ib7lxogr0wy	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	12	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:14:43+00
nc55f86dum3jpsuf	vwdgbj96cj6updef	chtfkfr68ef5chk	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	13	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:14:43+00
nco41ioncxzf1pdm	vwpiwjnlbkadm5qy	ctit2jdxf8xi0y6	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-04 14:03:48+00
nc9zxv5zw2ss7mnt	vwtg43x3weqf23yy	cia1yht1f9lb8v6	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	16	\N	\N	\N	\N	wqid8bq2	2026-02-09 17:58:12+00	2026-02-09 17:58:12+00
nc38i1cujg51rzfy	vw16iqj48dsn1t0l	czjl2l2p4tdngdk	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	9	\N	\N	\N	none	wqid8bq2	2026-02-04 13:56:02+00	2026-02-09 17:38:18+00
ncw823bwe5gu8q67	vw16iqj48dsn1t0l	c05e11ftou4idmo	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	11.5	\N	\N	\N	\N	wqid8bq2	2026-02-09 17:46:34+00	2026-02-09 17:46:42+00
ncvh3xjuwbhueweh	vw9lfb4i0ub1zfnw	cp5qde7762p94od	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-09 17:46:33+00	2026-02-09 17:46:33+00
ncsloyia1d5y5hqo	vw9lfb4i0ub1zfnw	cjlmtyr4lqeiae5	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-09 17:46:33+00	2026-02-09 17:46:33+00
ncdn5yic4d67x8cz	vw9lfb4i0ub1zfnw	c6hdxzzb4nk3wli	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	3	\N	\N	\N	\N	wqid8bq2	2026-02-09 17:46:33+00	2026-02-09 17:46:33+00
nch2tbwcslk9q8bq	vwpiwjnlbkadm5qy	cnl2ar5uezykpju	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	20	\N	\N	\N	\N	wqid8bq2	2026-02-09 17:46:33+00	2026-02-09 17:46:33+00
nc51ebirs56rqioy	vw9lfb4i0ub1zfnw	cmxxts2k95wo8gt	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	4	\N	\N	\N	\N	wqid8bq2	2026-02-09 17:46:34+00	2026-02-09 17:46:34+00
nc9jbu400d71b4s0	vw16iqj48dsn1t0l	cptx2p0w7d45sir	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	13	\N	\N	\N	\N	wqid8bq2	2026-02-09 17:46:34+00	2026-02-09 17:46:34+00
nc2borcpstk2kzuj	vwpiwjnlbkadm5qy	cu0bwr7p9nxapn0	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	21	\N	\N	\N	\N	wqid8bq2	2026-02-09 17:46:34+00	2026-02-09 17:46:34+00
ncqcx8tlalpak449	vwtg43x3weqf23yy	cbq31ueyugq2iav	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:52+00	2026-02-09 17:55:51+00
ncyvvxj16ap8w7oe	vwng57dgeuwixxem	c5nm24mhw8dqqgx	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	20	\N	\N	\N	\N	wqid8bq2	2026-02-09 17:58:12+00	2026-02-09 17:58:12+00
nchb340kr1vpkuk3	vw86ojeksm77qo9v	c2l6l8py4xjuu7j	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-04 14:01:47+00	2026-02-09 18:20:35+00
nc069zosd1ymhpjv	vwhwhzpkek3zzhv4	c9o7z61oc3yjk9a	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	23	\N	\N	\N	none	wqid8bq2	2026-02-04 14:00:53+00	2026-02-09 18:04:28+00
nc0liwm44axegett	vwe43mvm6lqyz7zr	cdh5ieiy9swc0dc	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-09 17:58:12+00	2026-02-09 17:58:12+00
ncrc5i20r8ygwpw5	vwe43mvm6lqyz7zr	cnxam7bzha5n05r	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-09 17:58:12+00	2026-02-09 17:58:12+00
nck1oyegu1v3w6oa	vwe43mvm6lqyz7zr	cc19tkhguph30nb	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	3	\N	\N	\N	\N	wqid8bq2	2026-02-09 17:58:12+00	2026-02-09 17:58:12+00
ncqa4mwybtmt8824	vwng57dgeuwixxem	cbs91tiep4lbcn4	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	19	\N	\N	\N	\N	wqid8bq2	2026-02-09 17:58:12+00	2026-02-09 17:58:12+00
ncpsz1yrzh1r4lp4	vwe43mvm6lqyz7zr	czxs4da12eivtmk	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	4	\N	\N	\N	\N	wqid8bq2	2026-02-09 17:58:12+00	2026-02-09 17:58:12+00
nc0c9j6ny2g67sj6	vwtg43x3weqf23yy	clmoy1dn4a0cj4i	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	14.5	\N	\N	\N	\N	wqid8bq2	2026-02-09 17:58:12+00	2026-02-09 17:58:23+00
nc1jdlkxk5xd755w	vwng57dgeuwixxem	cv71nqyp9d6iblu	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	18	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:00:26+00	2026-02-09 18:00:26+00
ncgl8v22txfm62lg	vwpiwjnlbkadm5qy	cnsr2795ce18wkx	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	14	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:01:37+00	2026-02-09 18:01:37+00
ncvdobrshleyu0co	vw9d71t076ku4yr8	cvl6cwfjsgn9rm4	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-09 18:05:18+00	2026-02-09 18:05:18+00
nc9if6mkaqvwqe99	vw9d71t076ku4yr8	cx1qffbaisk4k1m	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-09 18:05:18+00	2026-02-09 18:05:18+00
ncrsd1j5ewlo5a9x	vw9d71t076ku4yr8	cap1qxgskyvdy2v	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	3	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:05:18+00	2026-02-09 18:05:18+00
ncimwy7hai65pxo6	vwpiwjnlbkadm5qy	cuqoryv861aqpu6	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	24	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:05:18+00	2026-02-09 18:05:18+00
nc6t6pp2eap3yg1g	vw9d71t076ku4yr8	ci4o7j3hime7f6z	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	4	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:05:18+00	2026-02-09 18:05:18+00
nccmynkw1w7gzghe	vwhwhzpkek3zzhv4	cp9hbd7r3agj1yp	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	24	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:05:18+00	2026-02-09 18:05:18+00
ncvje6c18qineeig	vwhwhzpkek3zzhv4	c6covu3mw8ifwyx	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	8.5	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:05:19+00	2026-02-09 18:05:19+00
ncx5y5ec969yac9x	vw86ojeksm77qo9v	cdpwzn80phliz20	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	3	\N	\N	\N	none	wqid8bq2	2026-02-04 14:01:47+00	2026-02-09 18:20:35+00
nc834z05g910kgut	vw86ojeksm77qo9v	c3u3scecll79398	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	4	\N	\N	\N	none	wqid8bq2	2026-02-04 14:01:47+00	2026-02-09 18:20:35+00
ncsw8c7qgqc1yx0w	vw86ojeksm77qo9v	cpagmhhd6g0fcvk	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	5	\N	\N	\N	none	wqid8bq2	2026-02-04 14:01:47+00	2026-02-09 18:20:35+00
nc528zrzno6npcc4	vw86ojeksm77qo9v	cc2llzh7oihvjhk	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	6	\N	\N	\N	none	wqid8bq2	2026-02-04 14:01:47+00	2026-02-09 18:20:35+00
nc925djzcwad1wqt	vw86ojeksm77qo9v	cl28kb4gtf60kyp	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	7	\N	\N	\N	none	wqid8bq2	2026-02-04 14:01:47+00	2026-02-09 18:20:35+00
nc5sklaznl7tfl86	vw86ojeksm77qo9v	ciizexx8gnmmh8u	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	10	\N	\N	\N	none	wqid8bq2	2026-02-04 14:01:47+00	2026-02-09 18:20:35+00
ncrpcaen309pljfi	vw86ojeksm77qo9v	c0c98b5g14umg7j	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	11	\N	\N	\N	none	wqid8bq2	2026-02-04 14:01:47+00	2026-02-09 18:20:35+00
nc1oks1inph8u5lw	vw86ojeksm77qo9v	cz4rzid030j5ukx	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	12	\N	\N	\N	none	wqid8bq2	2026-02-04 14:01:47+00	2026-02-09 18:20:35+00
nc2lgayp59b1x2j2	vw86ojeksm77qo9v	c4fz8qjifateuuv	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	13	\N	\N	\N	none	wqid8bq2	2026-02-04 14:01:47+00	2026-02-09 18:20:35+00
ncz6m2eizmbhqtyt	vw86ojeksm77qo9v	c6h4pr6nf24v55t	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	14	\N	\N	\N	none	wqid8bq2	2026-02-04 14:01:47+00	2026-02-09 18:20:35+00
ncy4yucccxpragnr	vw86ojeksm77qo9v	cwmv5m3yjc4vjgd	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	16	\N	\N	\N	none	wqid8bq2	2026-02-04 14:01:47+00	2026-02-09 18:20:35+00
ncwxilw6u9710bao	vw86ojeksm77qo9v	c1ao0fait4zsa1t	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	17	\N	\N	\N	none	wqid8bq2	2026-02-04 14:01:47+00	2026-02-09 18:20:35+00
nclpj2zgm9glkscd	vw86ojeksm77qo9v	cvk3wq35dagvfah	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	18	\N	\N	\N	none	wqid8bq2	2026-02-04 14:01:47+00	2026-02-09 18:20:35+00
ncp62iwp1d0aogci	vw86ojeksm77qo9v	cve6so9t8q8g5en	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	19	\N	\N	\N	none	wqid8bq2	2026-02-04 14:01:47+00	2026-02-09 18:20:35+00
nc7p3exprrnhc1k0	vwpiwjnlbkadm5qy	cud7ibgfdtc5rlj	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	25	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:05:19+00	2026-02-09 18:05:19+00
nc9n3qf3i2zby48s	vwhwhzpkek3zzhv4	cf7fhgh14nrhrkn	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	8.25	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:07:46+00	2026-02-09 18:07:46+00
ncy18399wppv6lfd	vw16iqj48dsn1t0l	cyml861u7wzdzqc	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	11.25	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:09:36+00	2026-02-09 18:09:36+00
ncxe412bgwnx6nmk	vwtg43x3weqf23yy	cw6vsvzfnq5linv	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	14.25	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:10:49+00	2026-02-09 18:10:49+00
nchnrde9svsrdqxx	vwjvznhyf8z6iq12	ciu5dhnkukkfvzy	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-09 18:12:06+00	2026-02-09 18:12:06+00
ncr85fpf5y2um4wv	vwjvznhyf8z6iq12	cc4ldogr5cbdoll	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-09 18:12:06+00	2026-02-09 18:12:06+00
ncgu8lkzfek42isb	vwjvznhyf8z6iq12	clvh6ivzzvi3ooo	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	3	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:12:06+00	2026-02-09 18:12:06+00
nccb9j1iruiyghol	vw16iqj48dsn1t0l	c6kmuu3sxabonbl	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	14	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:12:06+00	2026-02-09 18:12:06+00
ncje5ibuu6n7tglv	vwjvznhyf8z6iq12	czk3l3g0bvvcnsn	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	4	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:12:06+00	2026-02-09 18:12:06+00
nc8cbrh4k73whaw5	vwhwhzpkek3zzhv4	c3o8g32cmdd866m	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	25	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:12:06+00	2026-02-09 18:12:06+00
nc39g2sp75zdeldo	vwhwhzpkek3zzhv4	cm75kuwju8h6d53	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	10.5	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:12:06+00	2026-02-09 18:12:06+00
nct3ujd5cuae1p2z	vw16iqj48dsn1t0l	cqj68if71u1536q	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	15	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:12:06+00	2026-02-09 18:12:06+00
ncfpp71w9e0pfayy	vwhwhzpkek3zzhv4	cb6kyebvgf4c1k9	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	10.25	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:13:17+00	2026-02-09 18:13:17+00
ncol37ijssgk9wja	vwxjh3d8edlx5yyt	c6e9ihzhyby9enp	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-09 18:14:43+00	2026-02-09 18:14:43+00
nccb71g3md0gt2lw	vwxjh3d8edlx5yyt	crrs08f7cgpdcp1	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-09 18:14:43+00	2026-02-09 18:14:43+00
nc2g5db7npcgjpmh	vwxjh3d8edlx5yyt	cfkewqb8ein2k7e	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	3	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:14:43+00	2026-02-09 18:14:43+00
nc00mxb9cf95kns1	vwng57dgeuwixxem	cpdvdr3j94euxci	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	21	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:14:43+00	2026-02-09 18:14:43+00
ncwmip5fqn0m25ue	vwxjh3d8edlx5yyt	cnv6alltf9f39kh	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	4	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:14:43+00	2026-02-09 18:14:43+00
ncf5dchp3319eb8l	vwdgbj96cj6updef	cheyslwwnaslwi3	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	14	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:14:43+00	2026-02-09 18:14:43+00
nc5uqgv5rnlcbqm4	vwdgbj96cj6updef	cb9zfb6cmyk3nb3	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	10.5	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:14:43+00	2026-02-09 18:14:43+00
nch4odnanltr2his	vwng57dgeuwixxem	c940zopwks20w59	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	22	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:14:43+00	2026-02-09 18:14:43+00
ncv3q1zd0mt1y0r5	vwdgbj96cj6updef	cuwu5vokhwerd37	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	10.25	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:15:16+00	2026-02-09 18:15:16+00
nc1dafvrq5272txs	vwog9d2ape9qti8s	crxv61a9whrnn6d	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-09 18:17:38+00	2026-02-09 18:17:38+00
nca0xkkc8or015xr	vwog9d2ape9qti8s	c3r3mrybwsqdo6u	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-09 18:17:38+00	2026-02-09 18:17:38+00
ncs1po23ulcg6hcx	vwog9d2ape9qti8s	cbc5a026my67zsy	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	3	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:17:38+00	2026-02-09 18:17:38+00
ncpp865hqxngwmnf	vwtg43x3weqf23yy	cypop3x59q51hu6	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	17	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:17:38+00	2026-02-09 18:17:38+00
ncup58aavundtgaq	vwog9d2ape9qti8s	caoici07xkegpkn	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	4	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:17:38+00	2026-02-09 18:17:38+00
ncixftil4ip2m6ln	vwdgbj96cj6updef	cxwl6txkfe3uf7p	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	15	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:17:38+00	2026-02-09 18:17:38+00
ncnq82xsjfz9mrmy	vwdgbj96cj6updef	cd03nr1ew2nvc55	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	10.75	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:17:38+00	2026-02-09 18:17:38+00
ncwz1q6o5gb9tgd1	vwtg43x3weqf23yy	c3qx3qpy29mmgoj	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	18	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:17:38+00	2026-02-09 18:17:38+00
ncvdrwo9s2neqxtr	vwdgbj96cj6updef	cv0nu1w5m6g4k0p	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	10.625	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:19:31+00	2026-02-09 18:19:31+00
ncd02m68v0dyqc0f	vwpiwjnlbkadm5qy	c66j0cxivg3e6zi	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	27	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:21:32+00	2026-02-09 18:21:32+00
ncyciwowpbctk5a2	vwxff097chyfimpg	c3sley7vn6e2886	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-09 18:21:32+00	2026-02-09 18:21:32+00
ncntuupydi5e7we4	vwxff097chyfimpg	cs2zr31rp5jlhnd	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-09 18:21:32+00	2026-02-09 18:21:32+00
nchxwygspwdbibnj	vwxff097chyfimpg	cqwo4he88ae7kj6	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	3	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:21:32+00	2026-02-09 18:21:32+00
ncqtnsqgqj9yif4r	vwpiwjnlbkadm5qy	c4fak0a46kr1oiu	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	26	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:21:32+00	2026-02-09 18:21:32+00
ncpu5mzjghveezw4	vwxff097chyfimpg	cxd7yi6n4xr67cm	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	4	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:21:32+00	2026-02-09 18:21:32+00
ncxztyjem9ddgzw3	vw86ojeksm77qo9v	cqpd6c27fhb1mnq	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	20	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:21:32+00	2026-02-09 18:21:32+00
ncs3fvleckx31rm7	vw86ojeksm77qo9v	cmuad2sogee58l5	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	1.25	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:22:15+00	2026-02-09 18:22:15+00
nc8z1uqa28vyulqi	vwo4viai74qstu40	ch9wfw8yzj4yzlf	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	3	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:29:11+00	2026-02-09 18:29:11+00
nc1o1hfc7bw1b2hn	vw86ojeksm77qo9v	cmkzvu89sq1tqwe	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	1.3125	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:21:32+00	2026-02-09 18:28:58+00
nc7ftobclbuu2hab	vwo4viai74qstu40	cfjg9mlzkwehm1g	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-09 18:29:11+00	2026-02-09 18:29:11+00
ncljtzlxgjdqfkjk	vwo4viai74qstu40	coa8hstes7jqmmm	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-09 18:29:11+00	2026-02-09 18:29:11+00
ncfkywuz9uhqyb36	vwdgbj96cj6updef	cfdmjgmx05n40su	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	16	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:29:11+00	2026-02-09 18:29:11+00
nc4vwmsjbln9r70n	vwo4viai74qstu40	c3wwelfkh14yr85	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	4	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:29:11+00	2026-02-09 18:29:11+00
nci9y0tjrlntnuuh	vw86ojeksm77qo9v	capd7u5lhggawnz	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	21	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:29:11+00	2026-02-09 18:29:11+00
ncrukoatok1beywl	vw86ojeksm77qo9v	cbwarj2unek0fx7	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	1.6875	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:29:11+00	2026-02-09 18:29:11+00
nc40s3055891v6a7	vwdgbj96cj6updef	cfjdmoaypas3ot4	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	17	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:29:11+00	2026-02-09 18:29:11+00
nc61aeq3ardpt3hh	vw86ojeksm77qo9v	cqa5y3yzcdt5ltr	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	1.53125	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:33:12+00	2026-02-09 18:33:12+00
ncvxxq6s05q3871v	vw86ojeksm77qo9v	c6zmah4nvr48ngd	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	1.609375	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:33:32+00	2026-02-09 18:33:32+00
ncteogrpz45k2p9m	vw86ojeksm77qo9v	c3305onaea54zoz	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	1.6484375	\N	\N	\N	\N	wqid8bq2	2026-02-09 18:33:43+00	2026-02-09 18:33:43+00
ncsrj2exkdyw9zsj	vwdgbj96cj6updef	cvwuynxzwp0ukig	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	11.375	\N	\N	\N	\N	wqid8bq2	2026-02-10 13:09:09+00	2026-02-10 13:09:09+00
nc58lt1o27d64z4p	vw46sghw4wkff1ls	ckfllneskfstzzf	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-10 13:35:24+00	2026-02-10 13:35:24+00
nctzi833s8vaz8pp	vw46sghw4wkff1ls	cmiuaf9abst33dy	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-10 13:35:24+00	2026-02-10 13:35:24+00
nckk9lcrb9wekvmr	vw46sghw4wkff1ls	cchcqx0rzyqm1a5	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	3	\N	\N	\N	none	wqid8bq2	2026-02-10 13:35:24+00	2026-02-10 13:35:24+00
ncmv79jiiazflvjn	vw46sghw4wkff1ls	clfgr6vekrae1ao	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	4	\N	\N	\N	none	wqid8bq2	2026-02-10 13:35:24+00	2026-02-10 13:35:24+00
ncbfylk66wliewlw	vw46sghw4wkff1ls	c4488jqu1cfwreb	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	5	\N	\N	\N	none	wqid8bq2	2026-02-10 13:35:24+00	2026-02-10 13:35:24+00
ncfxspqqroul66hv	vw46sghw4wkff1ls	cxq6pp2ysg4v85k	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	6	\N	\N	\N	none	wqid8bq2	2026-02-10 13:35:24+00	2026-02-10 13:35:24+00
nc2zovkg1jwwj9xf	vw46sghw4wkff1ls	crlqeqpq8zrh94k	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	7	\N	\N	\N	none	wqid8bq2	2026-02-10 13:35:24+00	2026-02-10 13:35:24+00
ncryx422v2uk1oto	vw46sghw4wkff1ls	c77cudldn2ldi4z	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	8	\N	\N	\N	none	wqid8bq2	2026-02-10 13:35:24+00	2026-02-10 13:35:24+00
nc7inec3o0b8zw9p	vw46sghw4wkff1ls	ct1zt0dav2juhz2	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	9	\N	\N	\N	none	wqid8bq2	2026-02-10 13:35:24+00	2026-02-10 13:35:24+00
nc3pba9tf5hjr75d	vw46sghw4wkff1ls	cmy7ib7lxogr0wy	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	10	\N	\N	\N	none	wqid8bq2	2026-02-10 13:35:24+00	2026-02-10 13:35:24+00
ncz2ijk3i446gg5h	vw46sghw4wkff1ls	chtfkfr68ef5chk	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	11	\N	\N	\N	none	wqid8bq2	2026-02-10 13:35:24+00	2026-02-10 13:35:24+00
nczums7kr2px4l6j	vw46sghw4wkff1ls	cheyslwwnaslwi3	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	12	\N	\N	\N	none	wqid8bq2	2026-02-10 13:35:24+00	2026-02-10 13:35:24+00
nc2k8h5g6t4nezaq	vw46sghw4wkff1ls	cb9zfb6cmyk3nb3	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	13	\N	\N	\N	none	wqid8bq2	2026-02-10 13:35:24+00	2026-02-10 13:35:24+00
ncqi2zvnt1rbz4eo	vw46sghw4wkff1ls	cuwu5vokhwerd37	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	14	\N	\N	\N	none	wqid8bq2	2026-02-10 13:35:24+00	2026-02-10 13:35:24+00
nc5fff5dxcnt3zhf	vw46sghw4wkff1ls	cxwl6txkfe3uf7p	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	15	\N	\N	\N	none	wqid8bq2	2026-02-10 13:35:24+00	2026-02-10 13:35:24+00
ncdmkiawcqzn86vg	vw46sghw4wkff1ls	cd03nr1ew2nvc55	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	16	\N	\N	\N	none	wqid8bq2	2026-02-10 13:35:24+00	2026-02-10 13:35:24+00
ncg12l5vdluwpo5k	vw46sghw4wkff1ls	cv0nu1w5m6g4k0p	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	17	\N	\N	\N	none	wqid8bq2	2026-02-10 13:35:24+00	2026-02-10 13:35:24+00
nc29o4rqqmt3af1u	vw46sghw4wkff1ls	cfdmjgmx05n40su	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	18	\N	\N	\N	none	wqid8bq2	2026-02-10 13:35:24+00	2026-02-10 13:35:24+00
nc3m880njz2qun4f	vw46sghw4wkff1ls	cfjdmoaypas3ot4	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	19	\N	\N	\N	none	wqid8bq2	2026-02-10 13:35:24+00	2026-02-10 13:35:24+00
nc9fo98zuqzie56d	vw46sghw4wkff1ls	cvwuynxzwp0ukig	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	20	\N	\N	\N	none	wqid8bq2	2026-02-10 13:35:24+00	2026-02-10 13:35:24+00
ncrinlghzvwwp0q4	vwk9ual73mgqq663	ckfllneskfstzzf	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-10 13:48:18+00	2026-02-10 13:48:18+00
ncd2m9h9ae83ij8h	vwk9ual73mgqq663	cmiuaf9abst33dy	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-10 13:48:18+00	2026-02-10 13:48:18+00
ncrx8mdovfq6w40y	vwk9ual73mgqq663	cchcqx0rzyqm1a5	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	3	\N	\N	\N	none	wqid8bq2	2026-02-10 13:48:18+00	2026-02-10 13:48:18+00
nc21dlasxryl6479	vwk9ual73mgqq663	clfgr6vekrae1ao	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	4	\N	\N	\N	none	wqid8bq2	2026-02-10 13:48:18+00	2026-02-10 13:48:18+00
ncm951bcus515vsz	vwk9ual73mgqq663	c4488jqu1cfwreb	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	5	\N	\N	\N	none	wqid8bq2	2026-02-10 13:48:18+00	2026-02-10 13:48:18+00
nc29y5ozm7h4fg4o	vwk9ual73mgqq663	cxq6pp2ysg4v85k	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	6	\N	\N	\N	none	wqid8bq2	2026-02-10 13:48:18+00	2026-02-10 13:48:18+00
nc60lpj4jf9axpbg	vwk9ual73mgqq663	crlqeqpq8zrh94k	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	7	\N	\N	\N	none	wqid8bq2	2026-02-10 13:48:18+00	2026-02-10 13:48:18+00
nc41xdroidhixanf	vwk9ual73mgqq663	c77cudldn2ldi4z	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	8	\N	\N	\N	none	wqid8bq2	2026-02-10 13:48:18+00	2026-02-10 13:48:18+00
nciot7o1yf08uh8s	vwk9ual73mgqq663	ct1zt0dav2juhz2	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	9	\N	\N	\N	none	wqid8bq2	2026-02-10 13:48:18+00	2026-02-10 13:48:18+00
ncng9rutltvfm4ma	vwk9ual73mgqq663	cmy7ib7lxogr0wy	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	10	\N	\N	\N	none	wqid8bq2	2026-02-10 13:48:18+00	2026-02-10 13:48:18+00
nc05kikduvo7p17l	vwk9ual73mgqq663	chtfkfr68ef5chk	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	11	\N	\N	\N	none	wqid8bq2	2026-02-10 13:48:18+00	2026-02-10 13:48:18+00
nc739opdi0i0521s	vwk9ual73mgqq663	cheyslwwnaslwi3	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	12	\N	\N	\N	none	wqid8bq2	2026-02-10 13:48:18+00	2026-02-10 13:48:18+00
nch433lpjkad4rst	vwk9ual73mgqq663	cb9zfb6cmyk3nb3	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	13	\N	\N	\N	none	wqid8bq2	2026-02-10 13:48:18+00	2026-02-10 13:48:18+00
ncmyl6k0xw286kq3	vwk9ual73mgqq663	cuwu5vokhwerd37	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	14	\N	\N	\N	none	wqid8bq2	2026-02-10 13:48:18+00	2026-02-10 13:48:18+00
ncui0m2k3iw7xe9u	vwk9ual73mgqq663	cxwl6txkfe3uf7p	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	15	\N	\N	\N	none	wqid8bq2	2026-02-10 13:48:18+00	2026-02-10 13:48:18+00
ncshfmg0k8ed5zbg	vwk9ual73mgqq663	cd03nr1ew2nvc55	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	16	\N	\N	\N	none	wqid8bq2	2026-02-10 13:48:18+00	2026-02-10 13:48:18+00
ncfxa1mfor5oo147	vwk9ual73mgqq663	cv0nu1w5m6g4k0p	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	17	\N	\N	\N	none	wqid8bq2	2026-02-10 13:48:18+00	2026-02-10 13:48:18+00
ncphreiffytfazgl	vwk9ual73mgqq663	cfdmjgmx05n40su	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	18	\N	\N	\N	none	wqid8bq2	2026-02-10 13:48:18+00	2026-02-10 13:48:18+00
ncbyybbw7x78qdw0	vwk9ual73mgqq663	cfjdmoaypas3ot4	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	19	\N	\N	\N	none	wqid8bq2	2026-02-10 13:48:18+00	2026-02-10 13:48:18+00
nccyngkatthke9rp	vwk9ual73mgqq663	cvwuynxzwp0ukig	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	20	\N	\N	\N	none	wqid8bq2	2026-02-10 13:48:18+00	2026-02-10 13:48:18+00
ncyatv2qj1n89jra	vwdgbj96cj6updef	cv8ytsdg9nq16kt	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	18	\N	\N	\N	\N	wqid8bq2	2026-02-10 15:46:28+00	2026-02-10 15:46:28+00
nc4qeq6m3s5qgztn	vw46sghw4wkff1ls	cv8ytsdg9nq16kt	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	21	\N	\N	\N	\N	wqid8bq2	2026-02-10 15:46:28+00	2026-02-10 15:46:28+00
nclvvhgaowsc4w9k	vwk9ual73mgqq663	cv8ytsdg9nq16kt	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	21	\N	\N	\N	\N	wqid8bq2	2026-02-10 15:46:28+00	2026-02-10 15:46:28+00
ncvntsf7ducrmf1u	vwdgbj96cj6updef	cjiu54csjvbbl7f	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	19	\N	\N	\N	\N	wqid8bq2	2026-02-10 15:46:52+00	2026-02-10 15:46:52+00
nc1uopp5tdrb5ohn	vw46sghw4wkff1ls	cjiu54csjvbbl7f	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	22	\N	\N	\N	\N	wqid8bq2	2026-02-10 15:46:52+00	2026-02-10 15:46:52+00
ncfy0utip4m6nc3k	vwk9ual73mgqq663	cjiu54csjvbbl7f	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	22	\N	\N	\N	\N	wqid8bq2	2026-02-10 15:46:52+00	2026-02-10 15:46:52+00
ncim3k24zwvhvd81	vwdgbj96cj6updef	c5sxauwunyn6r03	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	20	\N	\N	\N	\N	wqid8bq2	2026-02-10 15:47:32+00	2026-02-10 15:47:32+00
ncfnd6ja85spd587	vw46sghw4wkff1ls	c5sxauwunyn6r03	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	23	\N	\N	\N	\N	wqid8bq2	2026-02-10 15:47:32+00	2026-02-10 15:47:32+00
nc1m5qg7t0zwfqy3	vwk9ual73mgqq663	c5sxauwunyn6r03	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	23	\N	\N	\N	\N	wqid8bq2	2026-02-10 15:47:32+00	2026-02-10 15:47:32+00
ncb88zq4vsed0b9a	vwdgbj96cj6updef	ch362zepnzku4nx	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	21	\N	\N	\N	\N	wqid8bq2	2026-02-10 15:48:01+00	2026-02-10 15:48:01+00
nc3y94a0k9ox6f4x	vw46sghw4wkff1ls	ch362zepnzku4nx	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	24	\N	\N	\N	\N	wqid8bq2	2026-02-10 15:48:01+00	2026-02-10 15:48:01+00
ncpi1qwpijy9qo7s	vwk9ual73mgqq663	ch362zepnzku4nx	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	24	\N	\N	\N	\N	wqid8bq2	2026-02-10 15:48:01+00	2026-02-10 15:48:01+00
nclc30w9ugkayipo	vwdgbj96cj6updef	ckfemyv8pfxvwpm	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	22	\N	\N	\N	\N	wqid8bq2	2026-02-10 15:48:22+00	2026-02-10 15:48:22+00
nccg82puftxed2zh	vw46sghw4wkff1ls	ckfemyv8pfxvwpm	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	25	\N	\N	\N	\N	wqid8bq2	2026-02-10 15:48:22+00	2026-02-10 15:48:22+00
nc985qiq79g7e7xs	vwk9ual73mgqq663	ckfemyv8pfxvwpm	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	200px	t	25	\N	\N	\N	\N	wqid8bq2	2026-02-10 15:48:22+00	2026-02-10 15:48:22+00
nc946o4ml1iyy52u	vwe5wfvymv0fo67c	cl36dscpbhaygb4	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	13	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncw7bvmmzwxcjwm1	vwe5wfvymv0fo67c	cfi018q7u3lsfur	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	14	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncy8aq3fjueiw28r	vwe5wfvymv0fo67c	cyepgxey61i5py0	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	15	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nc8r1qudkyosv97v	vwe5wfvymv0fo67c	cf58x63rojb8pex	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	16	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nc2xs7rmqajgqpbs	vw3sfhplkx11a9o9	co64i4u7pt4r6k9	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncapz6n2djrfouh7	vw3sfhplkx11a9o9	c18jtstzhnma8fm	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncbn78f9z8w95x3u	vw3sfhplkx11a9o9	c2qghv2npthks3d	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	3	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncuzwcxjc74pofwb	vw3sfhplkx11a9o9	c13926iimrrv9gf	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	4	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nc6l6p45mwlxfmxl	vw3sfhplkx11a9o9	cew7o4le3t12tlk	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	7	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nc5c9ss8xxyqq8yt	vw3sfhplkx11a9o9	cdrojiau1elmykx	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	8	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncbe7ybnnmaplnlu	vw3sfhplkx11a9o9	c9uunk3hcho4ah6	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	9	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncfk51env78hft8c	vw3sfhplkx11a9o9	c6ifzkrv9gu3n3a	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	10	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncp8thoqghcm4odv	vwe5wfvymv0fo67c	c4nfxjmto81hsbf	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncxnilblgcoe20q2	vwe5wfvymv0fo67c	cqw4osstvnidbdx	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nc10cjyvyw263tis	vwe5wfvymv0fo67c	ckhrx6fuxcfsbwm	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	3	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nc7sz82p8racxbhp	vwe5wfvymv0fo67c	c05bciajjxnzhdh	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	4	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncoamnqcyynb7quu	vwe5wfvymv0fo67c	ckxugqrfbgafutd	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	7	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncxxf399dav6o2ao	vwe5wfvymv0fo67c	co9080h9kgxik6c	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	8	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncacfrtbf48yiomf	vwe5wfvymv0fo67c	crnle1wp9n7bcer	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	9	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncbgsxpu02paem16	vwe5wfvymv0fo67c	cq6yw7rx026p1sw	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	10	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncsstzcx89d5165v	vwe5wfvymv0fo67c	clu4djodmjcincm	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	11	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncenyyww6gxe1apj	vwe5wfvymv0fo67c	c5ol9ibsl6gcezw	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	12	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncufkz267gcj280w	vwe5wfvymv0fo67c	cdf69h02znto6yx	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	20	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:42+00
ncxie21ugm2qehj7	vwe5wfvymv0fo67c	c3ly8gfl78g4f7n	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	22	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:42+00
ncrz6hoeat2iq8w7	vw3sfhplkx11a9o9	c9bt0ufh57afkmc	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	11	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncfgl8m6egjghupr	vw3sfhplkx11a9o9	clegmghzbn5vfge	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	12	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncvhds2c5x9p4hmr	vw3sfhplkx11a9o9	ckj9auhm9snfr19	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	13	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nco7a9id1g9v15oy	vw3sfhplkx11a9o9	cywduqzci09tp0d	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	15	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nc4ax7ih6pffpn28	vw0i3t3tdffa2q1w	c1vwnz3lnox54kz	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncqj8595xmyjmg8l	vw0i3t3tdffa2q1w	c79yuvg7344emms	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nc74v7l6hker70ny	vw0i3t3tdffa2q1w	ccpi7ncgcnpnynu	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	3	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncxnpqn1fvmmz114	vw0i3t3tdffa2q1w	cbl6jx8pv9olf98	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	4	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nctdp9x2rbady3gg	vw0i3t3tdffa2q1w	cuubl86zu5f58fj	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	7	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nc3d96ad9uemi4bn	vw0i3t3tdffa2q1w	ct4fse4fn1g2b0p	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	8	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nc4598s23a3c0e2k	vw0i3t3tdffa2q1w	cdrxhq7sj28nxzq	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	9	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nct0m859tds8f9ht	vw0i3t3tdffa2q1w	cbl4sswrm0gq15b	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	12	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nca46lismk70jwoa	vw0i3t3tdffa2q1w	ccpzp2183phyy9q	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	13	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncdawsbglcocbjb5	vw0i3t3tdffa2q1w	cv7j5xabbktmkgy	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	11.375	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncs108qeznko0muq	vw0i3t3tdffa2q1w	cstfwpku5xjfmkv	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	20	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:42+00
ncfcez22yeoyas36	vw0i3t3tdffa2q1w	ccm5qxuzl332t23	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	19	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:42+00
nc0xwpwmg6ttzw2c	vw0i3t3tdffa2q1w	cbleodw1myj0pax	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	21	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:42+00
ncw97fwpqkwgfvqr	vw0i3t3tdffa2q1w	cn0vcb15ajvvyhw	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	10.625	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:42+00
ncolv21vhrsb2npx	vw0i3t3tdffa2q1w	caql0obpzuqbk2e	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	10.25	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
nc6fpf7dvs8oqa2s	vwsst0qiggvcgoln	cd9tr4kyk3z7egt	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
nc55ivnlb98ki6hg	vwsst0qiggvcgoln	cpjjcxt0ijinu23	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
ncl7cg1aeoakw1rz	vwsst0qiggvcgoln	c5kvk0hg3to1zhy	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	3	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
ncrl652a40qyivv2	vwz9jrab52mlvv7c	cw3yhgw61wgtv4s	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	10	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
nca07kwd4qhx8asg	vwsst0qiggvcgoln	cku5520yux9lekg	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	4	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
nczilo8jr1tibkvd	vw96f23ht4exlx3f	cp5fywmukyzpoh7	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	11	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
ncdl8hw0i3s9zh3c	vwufye2fhrdjomkk	c9q7yfk9cj3ojfc	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nc51mnsk2uaho9lv	vwnoeqanzgik7e7x	clnvr4viug5041q	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:42+00
ncuxpzlm1gf1e454	vwnoeqanzgik7e7x	cg3d80bkjn88fh0	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:42+00
nc77pxm2k75sui7k	vwnoeqanzgik7e7x	cko5yg3y74xu798	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	3	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:42+00
nc50x9f53bn7rl9j	vwnoeqanzgik7e7x	cn4ojnqxp5j4fny	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	4	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:42+00
ncccrajziuikf2m9	vwnoeqanzgik7e7x	c45avkl5z3x22it	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	7	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:42+00
nch9dyfp7u4xfx2m	vwnoeqanzgik7e7x	cgk36zdeuu6mlrc	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	10	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:42+00
ncy0s7dpq0hvvraj	vwnoeqanzgik7e7x	clctzdyrpo87u84	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	11	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:42+00
ncvx4tc3f9qfnwlb	vwnoeqanzgik7e7x	cjm9lz2ecsbf0ak	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	12	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:42+00
nctauu16obu20j2f	vwnoeqanzgik7e7x	c8v0qjz5r4ssjfs	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	13	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:42+00
ncsbphj2bre1hkaw	vwnoeqanzgik7e7x	cmqscgkv53zb1nr	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	14	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:42+00
ncp8qyjkqvehpfnp	vwnoeqanzgik7e7x	cnjy0cy495avtkr	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	16	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:42+00
nc1z7a321zy9rbi5	vwnoeqanzgik7e7x	crri08817y0hzxj	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	17	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:42+00
ncqv91ns9leqsmfm	vwnoeqanzgik7e7x	coijtx5oskcxw92	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	18	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:42+00
ncs49f1lmslq8zaz	vwnoeqanzgik7e7x	cg6d3lfdzrri7ff	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	19	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:42+00
ncdwdldbvqhup5bs	vwgb6rov5ol9xyb3	clmedcl82wbomk2	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
nco1xerjzjledzbk	vwgb6rov5ol9xyb3	cobsxoav39tkupt	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
ncypirqod94200bu	vwgb6rov5ol9xyb3	chkdw667n70hpj3	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	3	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
nc216h9j7a5xalhh	vwufye2fhrdjomkk	clnt0ubbrm5iu67	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	19	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
ncsebniq61jhyq8f	vwgb6rov5ol9xyb3	c8ep02qv4kehxmv	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	4	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
nc3da2w5srxhnyby	vw96f23ht4exlx3f	cpo3d6df3wmx7gj	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	13	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
nca3snf2epby1ngl	vwjllheb2kfyihqf	c9pe06neephs7nb	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
ncpvtialen5871j4	vwjllheb2kfyihqf	cigg9fsnzbtadn0	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
ncfraj4jdnd19wci	vwjllheb2kfyihqf	ckky9x1lnhrnrf1	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	3	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
nctcltqhbzc44n11	vwnoeqanzgik7e7x	cu1g4ukt1xot671	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	15	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
nc13l3atujqddoys	vwjllheb2kfyihqf	c9v7u7yugmbv3hd	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	4	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
ncbdoliezdzf6mzm	vw96f23ht4exlx3f	c9jrg9srm28mowl	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	15	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
nc4eltmkli6kywl6	vwjhoj4kwyi0qtbb	cfpahetg08r0ttj	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
nck7qp542tj870ys	vwjhoj4kwyi0qtbb	cd5za1mkxz2emxj	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
ncsjhby3rmdws6by	vwjhoj4kwyi0qtbb	c800f4bexya0eua	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	3	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
nc1032d4v7b4fc09	vwufye2fhrdjomkk	cf2k2yrggfnmuc8	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	21	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
nci3nrtjr3camcfd	vwjhoj4kwyi0qtbb	ch0obw9pmwvbrxh	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	4	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
ncks6tmcv2xklvs9	vwz9jrab52mlvv7c	c2jh7ruj62tad2t	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	12	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
ncbydna5mrk67pm2	vwdkmzhhyjunqaaz	c1gtvlmujcc1u6u	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
nc9t7vg4fry5kcu9	vwdkmzhhyjunqaaz	c65mmf5ls3ttmu5	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
nc5dbi5nqm6g7b07	vwdkmzhhyjunqaaz	crg7nfp9olntk34	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	3	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
nc90id0d7acerdlp	vw3sfhplkx11a9o9	cd5umle6gt12pk0	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	13	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
ncm1xd6k079c1wsg	vwdkmzhhyjunqaaz	ceamwkdlfa0h3pk	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	4	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
ncxoyctk9zvrx89f	vwe5wfvymv0fo67c	cp51ox8m3kcvkfj	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	15	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
ncr1ci5tireabzc0	vwoeg3vq8ea1su72	cspixnw7wg80jr8	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
ncbaadj9bu6894ld	vwoeg3vq8ea1su72	ctu4cm757xqa7ia	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
nco6mi95gigiqc2m	vwoeg3vq8ea1su72	cew6e8ajouj98ks	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	3	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
ncuxa16iozzayhji	vw0i3t3tdffa2q1w	cfeqvvbh4fun0qf	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	11	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
nce9nlqmm78030ww	vwoeg3vq8ea1su72	cexr97lomgc1b63	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	4	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
nc8gxq7gfm98ojle	vwe5wfvymv0fo67c	ct274vvmpthxt4f	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	17	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
nc6pw6s5c0oyvze5	vwzjci3gg5tku891	cczsixmoss6rgkc	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
ncgmnhe1riw2kvko	vwzjci3gg5tku891	cod9djkey7gmp9b	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
ncty758v0jtduemb	vwzjci3gg5tku891	cdanxa9nu86ig4q	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	3	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
ncxxqeycz8bgmej2	vw0i3t3tdffa2q1w	ca5m0kcy6pudper	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	13	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
nci9gaxybnb46b02	vwzjci3gg5tku891	czayma06hse2p3h	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	4	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
ncbeumyq36tjzi65	vw3sfhplkx11a9o9	cnu7t9pv5j02qgg	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	15	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
nc3ozr1uh2k9hsds	vwz9jrab52mlvv7c	cc2tzrc5ua5jca6	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	11.5	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:42+00
nchs95c40fizevnu	vwz9jrab52mlvv7c	cpodsuifpnpd2fh	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	15	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:42+00
nc9nlysa7f5dehab	vw3sfhplkx11a9o9	c4e0ek1a9kpk2sz	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	14.5	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:42+00
ncf1ysj22qijq6ix	vw3sfhplkx11a9o9	ccrzmz4rln7djs3	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	18	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:42+00
ncqcdz5k8rj5x7fh	vw0i3t3tdffa2q1w	cu1owbs99nlqler	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	10.5	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:42+00
nceh24ruf7dcuy04	vw0i3t3tdffa2q1w	c4wmq2hyfjp8vso	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	10.75	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:42+00
ncdphjcm81eimmae	vwufye2fhrdjomkk	ctw9ifw88oex0qo	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	8.5	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:42+00
ncr45rud8yma8sgm	vwufye2fhrdjomkk	csj1yf0mmbovzpf	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	10.5	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:42+00
nct2vdunqh7dnlnh	vwnoeqanzgik7e7x	cgvw6sc7ktb7tua	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	1.3125	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:42+00
nc1l772ccvww2ovq	vwd275umskla85dd	c68hy4xu4uknswl	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
nclpvn6y483uptvy	vwd275umskla85dd	c01ioaaedmao998	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
ncz3rnow5ja92tze	vwd275umskla85dd	cljyggnz6diej80	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	3	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
ncpwjdtgshfdkgfn	vwnoeqanzgik7e7x	ch4ldryiu5i50e0	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	17	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
ncvjomzsnpldyapo	vwd275umskla85dd	cu2h2moy3zh6qt1	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	4	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
ncbrq5wb6fb9ho7q	vw0i3t3tdffa2q1w	cq5zzm2h798z443	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	15	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
ncvwmeupr58a8k7h	vw96f23ht4exlx3f	cwm6g4nzu8jcjm8	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nce2k1r9ujsdtxku	vw96f23ht4exlx3f	cbz8mnuo2l8m3o1	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nczc19lp8bbo1kp4	vw96f23ht4exlx3f	cxwr5vfmfx540ez	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	3	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncmgo8j7oeobe05a	vwz9jrab52mlvv7c	cd5em2l75qq6th6	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nc5231zx1jq41jt7	vw96f23ht4exlx3f	c1jkprvgzsa61uk	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	4	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nch8h4whdzps58bd	vwz9jrab52mlvv7c	cms65bharp4uhnd	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncn13b6s7og7b26b	vw96f23ht4exlx3f	cwlqeh8c4lke7z9	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	7	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nc76t6b7c5753mgn	vw96f23ht4exlx3f	co3dbbavglak1af	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	8	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncvrh1mj65eplo1c	vwz9jrab52mlvv7c	csu8d2pcseoufcn	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	3	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nchcw0iuyk4al936	vw96f23ht4exlx3f	cod0tyvckt5vxi9	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	9	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncq90keuivt5aipb	vwz9jrab52mlvv7c	c9wbobtedeefox5	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	4	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nc2epmfybqjpm4g4	vw96f23ht4exlx3f	c99jlfguprb9qr7	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	11	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncffcsge0ruxzabc	vwz9jrab52mlvv7c	cwk2ro06qvqcz5e	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	7	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nc2b0mptzrc9kibj	vw96f23ht4exlx3f	ct9ghzra1zol12a	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	12	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncspgljv5dhihlxg	vw96f23ht4exlx3f	cr38v3sfkf7zv14	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	13	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncgs303n6xwk65fa	vwz9jrab52mlvv7c	cl6fnhx95d9hr6n	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	8	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncwlnkudxyl6m6p0	vw96f23ht4exlx3f	czyh7mb08nyb6d8	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	21	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:42+00
nci1few6tkl4bile	vwz9jrab52mlvv7c	cd67oyc9lz0a39t	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	9	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncx37rpqxyhr1awd	vw96f23ht4exlx3f	c08ktvsgypu9m9o	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	25	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:42+00
nczuldx5lf6glp3j	vwz9jrab52mlvv7c	cdptpo6qgxsztvx	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	10	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncboxyhstfbkrjru	vw96f23ht4exlx3f	c5bh9b3o6kc0c3l	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	27	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:42+00
ncs8towe99qfk1wh	vw96f23ht4exlx3f	c6pdb246lwxur0y	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	14	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
nc7uhenmr9c16yur	vwz9jrab52mlvv7c	cryq2fxuyh4byse	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	12	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncr4hod9217h6hu1	vwz9jrab52mlvv7c	c85it7rqagnzw9a	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	11.25	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
nceplnz0d6y4fgth	vwe5wfvymv0fo67c	ce1w2bne17h7b34	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	18	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncti1yazxgewhk2d	vwufye2fhrdjomkk	ck3avnsr92u5m29	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nc6c0i54zy48y5p1	vwufye2fhrdjomkk	ca6w3hhmo7q2vs5	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	3	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nchruarjlmp647tn	vw0i3t3tdffa2q1w	cwmwxtsga3qwy43	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	17	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:42+00
nclz0vd4ofsbx6gu	vw0i3t3tdffa2q1w	chwu65i1koltwil	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	22	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:42+00
ncldlrzg4qqu4nzs	vw0i3t3tdffa2q1w	cjwn9pp8ncgexwg	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	18	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:42+00
nchqi6b4rzbdigmb	vwnoeqanzgik7e7x	cd1mddqfxnugaq1	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	1.6875	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:42+00
nci3gjy5rllkph17	vwnoeqanzgik7e7x	c7g9fddmsk3b0ax	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	1.6484375	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:42+00
ncrafxhs3s0v0dj2	vwnoeqanzgik7e7x	cmbl579v4xzuilu	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	1.609375	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:42+00
nchkz78bjxv968ms	vwnoeqanzgik7e7x	cdcpnyz7n5c2kp4	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	1.53125	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:42+00
nc0lyuyfahx5tls5	vwnoeqanzgik7e7x	cujsf5t2ifqilrq	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	1.25	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:42+00
ncx7ay1hdiu7bkpj	vwufye2fhrdjomkk	chdi8n7f3l96z86	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	4	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncsawojwe6hld1wx	vwufye2fhrdjomkk	cv5xpqyqlf71qft	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	7	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncmwlb738dt3noy9	vwufye2fhrdjomkk	cf5tlbcrgv7yztd	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	11	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncojw2kgycss6rfd	vwufye2fhrdjomkk	ct9a7jjs9320394	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	12	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nc4ik18vq6qzasqa	vwufye2fhrdjomkk	c7z0n78mk97z2pd	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	13	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nc9m88qfhmd3qhqx	vwufye2fhrdjomkk	cvtpk19swemnm04	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	14	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nc9lh9c1z5vuc38m	vwufye2fhrdjomkk	c3avfncif6tv51z	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	15	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncxt7y6hc3niny12	vwufye2fhrdjomkk	cfu2sqs8lykbfma	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	16	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nc53w4cxuytt15lj	vwufye2fhrdjomkk	c9b52pesups302t	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	17	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncswrflmst9d69gb	vwufye2fhrdjomkk	c49y7u4b9xdunws	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	18	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncvk8oirwjkmv9vn	vwufye2fhrdjomkk	ceipulnhqpr610f	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	19	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncybtut94c1qebn9	vwufye2fhrdjomkk	cq6lnt43w69vfhp	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	20	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncy6azrdp2c7qr80	vwufye2fhrdjomkk	cru5revvvw9trzl	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	21	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nckpx5d15d9c35mq	vwufye2fhrdjomkk	cjy0qc5zdbior60	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	22	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
ncij7447sub6w8b3	vwufye2fhrdjomkk	c8beeabco27w2wb	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	23	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
nckypuwwsq8m1aw6	vwufye2fhrdjomkk	cfwjiomt1iioww0	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	10.25	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncs09mtb008x5e1b	vwufye2fhrdjomkk	ctrn5xolyinajkn	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	8.25	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
nciq7x21tk9hyvfz	vwc4675ak5vvvugu	cfeqvvbh4fun0qf	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	11	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncgona07197s2unw	vwc4675ak5vvvugu	ca5m0kcy6pudper	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	13	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncwwge7peao0fi2u	vwc4675ak5vvvugu	cq5zzm2h798z443	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	15	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
nc8s62bqfnc0mvbv	vwc4675ak5vvvugu	c1vwnz3lnox54kz	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
nc7g065l1asgb5dr	vwc4675ak5vvvugu	c79yuvg7344emms	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
nc41xxvgekxx1hap	vwc4675ak5vvvugu	ccpi7ncgcnpnynu	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	3	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncfyeaj7k97fi1q2	vwc4675ak5vvvugu	cbl6jx8pv9olf98	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	4	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncdx07smqnyq5tdp	vwc4675ak5vvvugu	cuubl86zu5f58fj	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	7	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncf7bacj6vniqfwu	vwc4675ak5vvvugu	ct4fse4fn1g2b0p	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	8	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncddl4tos9r53rt0	vwc4675ak5vvvugu	cdrxhq7sj28nxzq	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	9	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncfbvzzfxy2xq9qm	vwc4675ak5vvvugu	cbl4sswrm0gq15b	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	10	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
nc3dah9qb1jdx4i0	vwc4675ak5vvvugu	ccpzp2183phyy9q	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	11	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncs6v8pi8d4txpw4	vw3sfhplkx11a9o9	cz34w4837wu40p7	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	14.25	\N	\N	\N	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncgcvjwz2gq5wy4l	vwm2p25qoevx79zl	cfeqvvbh4fun0qf	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	11	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncqmahy4x6aogw1c	vwm2p25qoevx79zl	ca5m0kcy6pudper	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	13	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncd3i8ejf1iwbkrx	vwm2p25qoevx79zl	cq5zzm2h798z443	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	15	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncpq1w3a0rez2xkl	vwm2p25qoevx79zl	c1vwnz3lnox54kz	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	1	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
nc9moix8s5fj12z7	vwm2p25qoevx79zl	c79yuvg7344emms	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	2	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
nceyzxr7i1pjshud	vwm2p25qoevx79zl	ccpi7ncgcnpnynu	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	3	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncwfeloe63xyz4ww	vwm2p25qoevx79zl	cbl6jx8pv9olf98	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	4	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncn9ad8ouwk7bbfw	vwm2p25qoevx79zl	cuubl86zu5f58fj	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	7	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
nccaalk044rd26bt	vwm2p25qoevx79zl	ct4fse4fn1g2b0p	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	8	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
nck8654yblcw4fpz	vwm2p25qoevx79zl	cdrxhq7sj28nxzq	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	9	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncyyzzxeejqu7cdd	vwm2p25qoevx79zl	cbl4sswrm0gq15b	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	10	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncpgx2949rmmxacn	vwm2p25qoevx79zl	ccpzp2183phyy9q	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	11	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncdwqntgbrpwg0sh	vwm2p25qoevx79zl	cv7j5xabbktmkgy	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	20	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncvum38a8wyxtu9c	vwm2p25qoevx79zl	cu1owbs99nlqler	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	13	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncrzcf4p8rdu2f2p	vwm2p25qoevx79zl	c4wmq2hyfjp8vso	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	16	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
nc7q4hh9dt5p9c6d	vwm2p25qoevx79zl	cwmwxtsga3qwy43	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	19	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncnwbcxm4rfn5j2f	vwm2p25qoevx79zl	caql0obpzuqbk2e	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	14	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
nctxj7gf06cuw9jb	vwm2p25qoevx79zl	cn0vcb15ajvvyhw	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	17	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
nchjcbfsgd8eksqc	vwm2p25qoevx79zl	cjwn9pp8ncgexwg	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	21	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
nc6eadolxajabeum	vwm2p25qoevx79zl	ccm5qxuzl332t23	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	22	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncj9j3rezsmztbmp	vwm2p25qoevx79zl	cstfwpku5xjfmkv	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	23	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
nc2fjkr0ssa5am3n	vwm2p25qoevx79zl	cbleodw1myj0pax	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	24	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncfn71iejzbnsq7u	vwm2p25qoevx79zl	chwu65i1koltwil	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	25	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
nc7qubzzm25e241r	vwc4675ak5vvvugu	cv7j5xabbktmkgy	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	20	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
nczulfz32t4v3dug	vwc4675ak5vvvugu	cu1owbs99nlqler	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	13	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
nc90aen5tym0r58p	vwc4675ak5vvvugu	c4wmq2hyfjp8vso	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	16	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
nct9yq8il65dm3ch	vwc4675ak5vvvugu	cwmwxtsga3qwy43	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	19	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncsd8ncumoome75z	vwc4675ak5vvvugu	caql0obpzuqbk2e	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	14	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
nc4qqro8shoo468e	vwc4675ak5vvvugu	cn0vcb15ajvvyhw	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	17	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
nctg36gibfti0oho	vwc4675ak5vvvugu	cjwn9pp8ncgexwg	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	21	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncu6xfqudnp8egkf	vwc4675ak5vvvugu	ccm5qxuzl332t23	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	22	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
nc0agoazcjx3biol	vwc4675ak5vvvugu	cstfwpku5xjfmkv	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	23	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
ncb0g82toxudzz5d	vwc4675ak5vvvugu	cbleodw1myj0pax	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	24	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
nc4a09dkka6og7c5	vwc4675ak5vvvugu	chwu65i1koltwil	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	200px	t	25	\N	\N	\N	none	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
\.


--
-- Data for Name: nc_grid_view_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_grid_view_v2 (fk_view_id, source_id, base_id, uuid, meta, row_height, fk_workspace_id, created_at, updated_at) FROM stdin;
vwjee43x47p4x517	b5b4nwkmm6723gc	ptbstfo5b36htsq	\N	\N	\N	wqid8bq2	2026-02-04 13:41:42+00	2026-02-04 13:41:42+00
vwpiwjnlbkadm5qy	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	wqid8bq2	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00
vw16iqj48dsn1t0l	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	wqid8bq2	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00
vwng57dgeuwixxem	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	wqid8bq2	2026-02-04 13:56:02+00	2026-02-04 13:56:02+00
vwtg43x3weqf23yy	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	wqid8bq2	2026-02-04 14:00:52+00	2026-02-04 14:00:52+00
vwhwhzpkek3zzhv4	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	wqid8bq2	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00
vwdgbj96cj6updef	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	wqid8bq2	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00
vw86ojeksm77qo9v	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	wqid8bq2	2026-02-04 14:01:47+00	2026-02-04 14:01:47+00
vw9lfb4i0ub1zfnw	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	wqid8bq2	2026-02-09 17:46:33+00	2026-02-09 17:46:33+00
vwe43mvm6lqyz7zr	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	wqid8bq2	2026-02-09 17:58:12+00	2026-02-09 17:58:12+00
vw9d71t076ku4yr8	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	wqid8bq2	2026-02-09 18:05:18+00	2026-02-09 18:05:18+00
vwjvznhyf8z6iq12	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	wqid8bq2	2026-02-09 18:12:06+00	2026-02-09 18:12:06+00
vwxjh3d8edlx5yyt	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	wqid8bq2	2026-02-09 18:14:43+00	2026-02-09 18:14:43+00
vwog9d2ape9qti8s	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	wqid8bq2	2026-02-09 18:17:38+00	2026-02-09 18:17:38+00
vwxff097chyfimpg	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	wqid8bq2	2026-02-09 18:21:32+00	2026-02-09 18:21:32+00
vwo4viai74qstu40	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	wqid8bq2	2026-02-09 18:29:11+00	2026-02-09 18:29:11+00
vw46sghw4wkff1ls	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	wqid8bq2	2026-02-10 13:35:24+00	2026-02-10 13:35:24+00
vwk9ual73mgqq663	bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	\N	\N	wqid8bq2	2026-02-10 13:48:18+00	2026-02-10 13:48:18+00
vwsst0qiggvcgoln	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
vwgb6rov5ol9xyb3	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
vwjllheb2kfyihqf	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
vwjhoj4kwyi0qtbb	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
vwdkmzhhyjunqaaz	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
vwoeg3vq8ea1su72	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
vwzjci3gg5tku891	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	wqid8bq2	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
vwd275umskla85dd	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	wqid8bq2	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
vw96f23ht4exlx3f	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
vwe5wfvymv0fo67c	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
vwz9jrab52mlvv7c	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
vw3sfhplkx11a9o9	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
vwufye2fhrdjomkk	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
vw0i3t3tdffa2q1w	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	wqid8bq2	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
vwc4675ak5vvvugu	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
vwm2p25qoevx79zl	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
vwnoeqanzgik7e7x	bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	\N	\N	wqid8bq2	2026-02-16 15:41:39+00	2026-02-16 15:41:42+00
\.


--
-- Data for Name: nc_hook_logs_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_hook_logs_v2 (id, source_id, base_id, fk_hook_id, type, event, operation, test_call, payload, conditions, notification, error_code, error_message, error, execution_time, response, triggered_by, fk_workspace_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_hook_trigger_fields; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_hook_trigger_fields (fk_hook_id, fk_column_id, base_id, fk_workspace_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_hooks_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_hooks_v2 (id, source_id, base_id, fk_model_id, title, description, env, type, event, operation, async, payload, url, headers, condition, notification, retries, retry_interval, timeout, active, version, trigger_field, fk_workspace_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_installations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_installations (id, fk_subscription_id, licensed_to, license_key, installation_secret, installed_at, last_seen_at, expires_at, license_type, status, seat_count, config, meta, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_integrations_store_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_integrations_store_v2 (id, fk_integration_id, type, sub_type, fk_workspace_id, fk_user_id, created_at, updated_at, slot_0, slot_1, slot_2, slot_3, slot_4, slot_5, slot_6, slot_7, slot_8, slot_9) FROM stdin;
\.


--
-- Data for Name: nc_integrations_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_integrations_v2 (id, title, config, meta, type, sub_type, fk_workspace_id, is_private, deleted, created_by, "order", is_default, is_encrypted, is_global, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_jobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_jobs (id, job, status, result, fk_user_id, fk_workspace_id, base_id, created_at, updated_at) FROM stdin;
job2k834wacf7acx9	duplicate-column	completed	{"id":"ckawcbg7bi7lrdu"}	us96d0spja9v6cqe	wqid8bq2	pupuc6ugup9dm03	2026-02-04 14:03:48+00	2026-02-04 14:03:48+00
jobd7qavgvvdmszn5	duplicate-column	completed	{"id":"cqhmaes5oouqlvh"}	us96d0spja9v6cqe	wqid8bq2	pupuc6ugup9dm03	2026-02-09 18:26:08+00	2026-02-09 18:26:09+00
jobzou1qdklanrta5	duplicate-base	completed	{"id":"p3llodmezayxe7x"}	us96d0spja9v6cqe	wqid8bq2	pupuc6ugup9dm03	2026-02-16 15:41:37+00	2026-02-16 15:41:43+00
\.


--
-- Data for Name: nc_kanban_view_columns_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_kanban_view_columns_v2 (id, source_id, base_id, fk_view_id, fk_column_id, uuid, label, help, show, "order", fk_workspace_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_kanban_view_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_kanban_view_v2 (fk_view_id, source_id, base_id, show, "order", uuid, title, public, password, show_all_fields, fk_grp_col_id, fk_cover_image_col_id, meta, fk_workspace_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_map_view_columns_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_map_view_columns_v2 (id, base_id, project_id, fk_view_id, fk_column_id, uuid, label, help, show, "order", fk_workspace_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_map_view_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_map_view_v2 (fk_view_id, source_id, base_id, uuid, title, fk_geo_data_col_id, meta, fk_workspace_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_mcp_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_mcp_tokens (id, title, base_id, token, fk_workspace_id, "order", fk_user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_model_stats_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_model_stats_v2 (fk_workspace_id, fk_model_id, row_count, is_external, base_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_models_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_models_v2 (id, source_id, base_id, table_name, title, type, meta, schema, enabled, mm, tags, pinned, deleted, "order", description, synced, fk_workspace_id, created_by, owned_by, uuid, password, fk_custom_url_id, created_at, updated_at) FROM stdin;
mle5vnsx04y6xo2	b5b4nwkmm6723gc	ptbstfo5b36htsq	Features	Features	table	\N	\N	t	f	\N	\N	\N	1	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-04 13:41:42+00	2026-02-04 13:41:42+00
mleo2f440ply95o	bznmoxpma3xn3sb	pupuc6ugup9dm03	1_CLIENTS	1_CLIENTS	table	\N	\N	t	f	\N	\N	\N	1	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-04 13:56:02+00	2026-02-04 13:57:42+00
m9wa466xf8r4x94	bznmoxpma3xn3sb	pupuc6ugup9dm03	2_CONTACTS	2_CONTACTS	table	\N	\N	t	f	\N	\N	\N	2	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-04 13:56:02+00	2026-02-04 13:58:03+00
m0nr5nzv9kw4ap2	bznmoxpma3xn3sb	pupuc6ugup9dm03	3_VEHICLES	3_VEHICLES	table	\N	\N	t	f	\N	\N	\N	3	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-04 13:56:02+00	2026-02-04 13:58:22+00
milkom888hl5xrj	bznmoxpma3xn3sb	pupuc6ugup9dm03	4_DRIVERS	4_DRIVERS	table	\N	\N	t	f	\N	\N	\N	4	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-04 14:00:52+00	2026-02-04 14:00:52+00
mzwj8ptf78t4pi9	bznmoxpma3xn3sb	pupuc6ugup9dm03	5_INQUIRIES	5_INQUIRIES	table	\N	\N	t	f	\N	\N	\N	5	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00
mko9nvxci0pz4dd	bznmoxpma3xn3sb	pupuc6ugup9dm03	6_TRANSPORTS	6_TRANSPORTS	table	\N	\N	t	f	\N	\N	\N	6	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00
mizgezntumu0w42	bznmoxpma3xn3sb	pupuc6ugup9dm03	7_FREIGHTS	7_FREIGHTS	table	\N	\N	t	f	\N	\N	\N	7	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-04 14:01:47+00	2026-02-04 14:31:33+00
ma2bsaypbay1l2e	bznmoxpma3xn3sb	pupuc6ugup9dm03	_nc_m2m_2_CONTACTS_1_CLIENTS	_nc_m2m_2_CONTACTS_1_CLIENTS	table	\N	\N	t	t	\N	\N	\N	8	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-09 17:46:33+00	2026-02-09 17:46:33+00
mwqo4tyim3er84z	bznmoxpma3xn3sb	pupuc6ugup9dm03	_nc_m2m_4_DRIVERS_3_VEHICLES	_nc_m2m_4_DRIVERS_3_VEHICLES	table	\N	\N	t	t	\N	\N	\N	9	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-09 17:58:12+00	2026-02-09 17:58:12+00
mbrdjwqzi4k85pu	bznmoxpma3xn3sb	pupuc6ugup9dm03	_nc_m2m_5_INQUIRIES_1_CLIENTS	_nc_m2m_5_INQUIRIES_1_CLIENTS	table	\N	\N	t	t	\N	\N	\N	10	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-09 18:05:18+00	2026-02-09 18:05:18+00
mv9v9zjgzfy5elx	bznmoxpma3xn3sb	pupuc6ugup9dm03	_nc_m2m_5_INQUIRIES_2_CONTACTS	_nc_m2m_5_INQUIRIES_2_CONTACTS	table	\N	\N	t	t	\N	\N	\N	11	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-09 18:12:06+00	2026-02-09 18:12:06+00
muzy18i6jdjkcao	bznmoxpma3xn3sb	pupuc6ugup9dm03	_nc_m2m_6_TRANSPORTS_3_VEHICLES	_nc_m2m_6_TRANSPORTS_3_VEHICLES	table	\N	\N	t	t	\N	\N	\N	12	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-09 18:14:43+00	2026-02-09 18:14:43+00
m0tv1ftq4mjvyyl	bznmoxpma3xn3sb	pupuc6ugup9dm03	_nc_m2m_6_TRANSPORTS_4_DRIVERS	_nc_m2m_6_TRANSPORTS_4_DRIVERS	table	\N	\N	t	t	\N	\N	\N	13	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-09 18:17:38+00	2026-02-09 18:17:38+00
m6t6dzpzjsh3pou	bznmoxpma3xn3sb	pupuc6ugup9dm03	_nc_m2m_7_FREIGHTS_1_CLIENTS	_nc_m2m_7_FREIGHTS_1_CLIENTS	table	\N	\N	t	t	\N	\N	\N	14	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-09 18:21:32+00	2026-02-09 18:21:32+00
md4f4x5bej6pcfo	bznmoxpma3xn3sb	pupuc6ugup9dm03	_nc_m2m_7_FREIGHTS_6_TRANSPORTS	_nc_m2m_7_FREIGHTS_6_TRANSPORTS	table	\N	\N	t	t	\N	\N	\N	15	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-09 18:29:11+00	2026-02-09 18:29:11+00
mxkvccdz2e8k27r	bjtfj3ddt8m4k3e	p3llodmezayxe7x	1_CLIENTS	1_CLIENTS	table	\N	\N	t	f	\N	\N	\N	1	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
mg8glgpealdlzio	bjtfj3ddt8m4k3e	p3llodmezayxe7x	2_CONTACTS	2_CONTACTS	table	\N	\N	t	f	\N	\N	\N	2	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
mp95ctr4880xk7r	bjtfj3ddt8m4k3e	p3llodmezayxe7x	3_VEHICLES	3_VEHICLES	table	\N	\N	t	f	\N	\N	\N	3	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
m3g9kou5r88eiuh	bjtfj3ddt8m4k3e	p3llodmezayxe7x	4_DRIVERS	4_DRIVERS	table	\N	\N	t	f	\N	\N	\N	4	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
m2s591s1lnxfu6a	bjtfj3ddt8m4k3e	p3llodmezayxe7x	5_INQUIRIES	5_INQUIRIES	table	\N	\N	t	f	\N	\N	\N	5	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
muktwldhfn4x6gi	bjtfj3ddt8m4k3e	p3llodmezayxe7x	6_TRANSPORTS	6_TRANSPORTS	table	\N	\N	t	f	\N	\N	\N	6	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:38+00
m3w5kh70kk3c2l0	bjtfj3ddt8m4k3e	p3llodmezayxe7x	7_FREIGHTS	7_FREIGHTS	table	\N	\N	t	f	\N	\N	\N	7	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
mqy196heavkuj1e	bjtfj3ddt8m4k3e	p3llodmezayxe7x	_nc_m2m_1_CLIENTS_2_CONTACTS	_nc_m2m_1_CLIENTS_2_CONTACTS	table	\N	\N	t	t	\N	\N	\N	8	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
mujx6juym4kwxgi	bjtfj3ddt8m4k3e	p3llodmezayxe7x	_nc_m2m_1_CLIENTS_5_INQUIRIES	_nc_m2m_1_CLIENTS_5_INQUIRIES	table	\N	\N	t	t	\N	\N	\N	9	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
m5rlxcrg06scr7z	bjtfj3ddt8m4k3e	p3llodmezayxe7x	_nc_m2m_1_CLIENTS_7_FREIGHTS	_nc_m2m_1_CLIENTS_7_FREIGHTS	table	\N	\N	t	t	\N	\N	\N	10	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
mljwzfc2a38b60h	bjtfj3ddt8m4k3e	p3llodmezayxe7x	_nc_m2m_2_CONTACTS_5_INQUIRIES	_nc_m2m_2_CONTACTS_5_INQUIRIES	table	\N	\N	t	t	\N	\N	\N	11	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
mxa4kgd3chtt5j3	bjtfj3ddt8m4k3e	p3llodmezayxe7x	_nc_m2m_3_VEHICLES_4_DRIVERS	_nc_m2m_3_VEHICLES_4_DRIVERS	table	\N	\N	t	t	\N	\N	\N	12	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
m1yk0s3vo310v22	bjtfj3ddt8m4k3e	p3llodmezayxe7x	_nc_m2m_3_VEHICLES_6_TRANSPORTS	_nc_m2m_3_VEHICLES_6_TRANSPORTS	table	\N	\N	t	t	\N	\N	\N	13	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
mt90g3ieje9tawr	bjtfj3ddt8m4k3e	p3llodmezayxe7x	_nc_m2m_4_DRIVERS_6_TRANSPORTS	_nc_m2m_4_DRIVERS_6_TRANSPORTS	table	\N	\N	t	t	\N	\N	\N	14	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
m5vrl3zsxmrxcsy	bjtfj3ddt8m4k3e	p3llodmezayxe7x	_nc_m2m_6_TRANSPORTS_7_FREIGHTS	_nc_m2m_6_TRANSPORTS_7_FREIGHTS	table	\N	\N	t	t	\N	\N	\N	15	\N	f	wqid8bq2	\N	\N	\N	\N	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
\.


--
-- Data for Name: nc_oauth_authorization_codes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_oauth_authorization_codes (code, fk_client_id, fk_user_id, code_challenge, code_challenge_method, redirect_uri, scope, state, resource, granted_resources, expires_at, is_used, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_oauth_clients; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_oauth_clients (client_id, client_secret, client_type, client_name, client_description, client_uri, logo_uri, redirect_uris, allowed_grant_types, response_types, allowed_scopes, registration_access_token, registration_client_uri, client_id_issued_at, client_secret_expires_at, fk_user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_oauth_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_oauth_tokens (id, fk_client_id, fk_user_id, access_token, access_token_expires_at, refresh_token, refresh_token_expires_at, resource, audience, granted_resources, scope, is_revoked, created_at, updated_at, last_used_at) FROM stdin;
\.


--
-- Data for Name: nc_org; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_org (id, title, slug, fk_user_id, meta, image, is_share_enabled, deleted, "order", fk_db_instance_id, stripe_customer_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_org_domain; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_org_domain (id, fk_org_id, fk_user_id, domain, verified, txt_value, last_verified, deleted, fk_workspace_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_org_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_org_users (fk_org_id, fk_user_id, roles, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_permission_subjects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_permission_subjects (fk_permission_id, subject_type, subject_id, fk_workspace_id, base_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_permissions (id, fk_workspace_id, base_id, entity, entity_id, permission, created_by, enforce_for_form, enforce_for_automation, granted_type, granted_role, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_plans; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_plans (id, title, description, stripe_product_id, is_active, prices, meta, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_plugins_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_plugins_v2 (id, title, description, active, rating, version, docs, status, status_details, logo, icon, tags, category, input_schema, input, creator, creator_website, price, created_at, updated_at) FROM stdin;
slack	Slack	Slack brings team communication and collaboration into one place so you can get more work done, whether you belong to a large enterprise or a small business. 	f	\N	0.0.1	\N	install	\N	plugins/slack.webp	\N	Chat	Chat	{"title":"Configure Slack","array":true,"items":[{"key":"channel","label":"Channel Name","placeholder":"Channel Name","type":"SingleLineText","required":true},{"key":"webhook_url","label":"Webhook URL","placeholder":"Webhook URL","type":"Password","required":true}],"actions":[{"label":"Test","placeholder":"Test","key":"test","actionType":"TEST","type":"Button"},{"label":"Save","placeholder":"Save","key":"save","actionType":"SUBMIT","type":"Button"}],"msgOnInstall":"Successfully installed and Slack is enabled for notification.","msgOnUninstall":""}	\N	\N	\N	\N	2026-02-04 13:37:36+00	2026-02-04 13:37:36+00
ms-teams	Microsoft Teams	Microsoft Teams is for everyone · Instantly go from group chat to video call with the touch of a button.	f	\N	0.0.1	\N	install	\N	plugins/teams.ico	\N	Chat	Chat	{"title":"Configure Microsoft Teams","array":true,"items":[{"key":"channel","label":"Channel Name","placeholder":"Channel Name","type":"SingleLineText","required":true},{"key":"webhook_url","label":"Webhook URL","placeholder":"Webhook URL","type":"Password","required":true}],"actions":[{"label":"Test","placeholder":"Test","key":"test","actionType":"TEST","type":"Button"},{"label":"Save","placeholder":"Save","key":"save","actionType":"SUBMIT","type":"Button"}],"msgOnInstall":"Successfully installed and Microsoft Teams is enabled for notification.","msgOnUninstall":""}	\N	\N	\N	\N	2026-02-04 13:37:36+00	2026-02-04 13:37:36+00
discord	Discord	Discord is the easiest way to talk over voice, video, and text. Talk, chat, hang out, and stay close with your friends and communities.	f	\N	0.0.1	\N	install	\N	plugins/discord.png	\N	Chat	Chat	{"title":"Configure Discord","array":true,"items":[{"key":"channel","label":"Channel Name","placeholder":"Channel Name","type":"SingleLineText","required":true},{"key":"webhook_url","label":"Webhook URL","type":"Password","placeholder":"Webhook URL","required":true}],"actions":[{"label":"Test","placeholder":"Test","key":"test","actionType":"TEST","type":"Button"},{"label":"Save","placeholder":"Save","key":"save","actionType":"SUBMIT","type":"Button"}],"msgOnInstall":"Successfully installed and Discord is enabled for notification.","msgOnUninstall":""}	\N	\N	\N	\N	2026-02-04 13:37:36+00	2026-02-04 13:37:36+00
twilio-whatsapp	Whatsapp Twilio	With Twilio, unite communications and strengthen customer relationships across your business – from marketing and sales to customer service and operations.	f	\N	0.0.1	\N	install	\N	plugins/whatsapp.png	\N	Chat	Twilio	{"title":"Configure Twilio","items":[{"key":"sid","label":"Account SID","placeholder":"Account SID","type":"SingleLineText","required":true},{"key":"token","label":"Auth Token","placeholder":"Auth Token","type":"Password","required":true},{"key":"from","label":"From Phone Number","placeholder":"From Phone Number","type":"SingleLineText","required":true}],"actions":[{"label":"Test","placeholder":"Test","key":"test","actionType":"TEST","type":"Button"},{"label":"Save","placeholder":"Save","key":"save","actionType":"SUBMIT","type":"Button"}],"msgOnInstall":"Successfully installed and Whatsapp Twilio is enabled for notification.","msgOnUninstall":""}	\N	\N	\N	\N	2026-02-04 13:37:36+00	2026-02-04 13:37:36+00
twilio	Twilio	With Twilio, unite communications and strengthen customer relationships across your business – from marketing and sales to customer service and operations.	f	\N	0.0.1	\N	install	\N	plugins/twilio.png	\N	Chat	Twilio	{"title":"Configure Twilio","items":[{"key":"sid","label":"Account SID","placeholder":"Account SID","type":"SingleLineText","required":true},{"key":"token","label":"Auth Token","placeholder":"Auth Token","type":"Password","required":true},{"key":"from","label":"From Phone Number","placeholder":"From Phone Number","type":"SingleLineText","required":true}],"actions":[{"label":"Test","placeholder":"Test","key":"test","actionType":"TEST","type":"Button"},{"label":"Save","placeholder":"Save","key":"save","actionType":"SUBMIT","type":"Button"}],"msgOnInstall":"Successfully installed and Twilio is enabled for notification.","msgOnUninstall":""}	\N	\N	\N	\N	2026-02-04 13:37:36+00	2026-02-04 13:37:36+00
aws-s3	S3	Amazon Simple Storage Service (Amazon S3) is an object storage service that offers industry-leading scalability, data availability, security, and performance.	f	\N	0.0.6	\N	install	\N	plugins/s3.png	\N	Storage	Storage	{"title":"Configure Amazon S3","items":[{"key":"bucket","label":"Bucket Name","placeholder":"Bucket Name","type":"SingleLineText","required":true},{"key":"region","label":"Region","placeholder":"Region","type":"SingleLineText","required":true},{"key":"endpoint","label":"Endpoint","placeholder":"Endpoint","type":"SingleLineText","required":false},{"key":"access_key","label":"Access Key","placeholder":"Access Key","type":"SingleLineText","required":false},{"key":"access_secret","label":"Access Secret","placeholder":"Access Secret","type":"Password","required":false},{"key":"acl","label":"Access Control Lists (ACL)","placeholder":"","type":"SingleLineText","required":false},{"key":"force_path_style","label":"Force Path Style","placeholder":"Default set to false","type":"Checkbox","required":false}],"actions":[{"label":"Test","placeholder":"Test","key":"test","actionType":"TEST","type":"Button"},{"label":"Save","placeholder":"Save","key":"save","actionType":"SUBMIT","type":"Button"}],"msgOnInstall":"Successfully configured! Attachments will now be stored in AWS S3.","msgOnUninstall":""}	\N	\N	\N	\N	2026-02-04 13:37:36+00	2026-02-04 13:37:36+00
minio	Minio	MinIO is a High Performance Object Storage released under Apache License v2.0. It is API compatible with Amazon S3 cloud storage service.	f	\N	0.0.5	\N	install	\N	plugins/minio.png	\N	Storage	Storage	{"title":"Configure Minio","items":[{"key":"endPoint","label":"Minio Endpoint","placeholder":"Minio Endpoint","type":"SingleLineText","required":true,"help_text":"Hostnames can’t include underscores (_) due to DNS standard limitations. Update the hostname if you see an Invalid endpoint error."},{"key":"port","label":"Port","placeholder":"Port","type":"Number","required":true},{"key":"bucket","label":"Bucket Name","placeholder":"Bucket Name","type":"SingleLineText","required":true},{"key":"access_key","label":"Access Key","placeholder":"Access Key","type":"SingleLineText","required":true},{"key":"access_secret","label":"Access Secret","placeholder":"Access Secret","type":"Password","required":true},{"key":"ca","label":"Ca","placeholder":"Ca","type":"LongText"},{"key":"useSSL","label":"Use SSL","placeholder":"Use SSL","type":"Checkbox","required":false}],"actions":[{"label":"Test","placeholder":"Test","key":"test","actionType":"TEST","type":"Button"},{"label":"Save","placeholder":"Save","key":"save","actionType":"SUBMIT","type":"Button"}],"msgOnInstall":"Successfully configured! Attachments will now be stored in Minio.","msgOnUninstall":""}	\N	\N	\N	\N	2026-02-04 13:37:36+00	2026-02-04 13:37:36+00
gcs	GCS	Google Cloud Storage is a RESTful online file storage web service for storing and accessing data on Google Cloud Platform infrastructure.	f	\N	0.0.4	\N	install	\N	plugins/gcs.png	\N	Storage	Storage	{"title":"Configure Google Cloud Storage","items":[{"key":"bucket","label":"Bucket Name","placeholder":"Bucket Name","type":"SingleLineText","required":true},{"key":"client_email","label":"Client Email","placeholder":"Client Email","type":"SingleLineText","required":true},{"key":"private_key","label":"Private Key","placeholder":"Private Key","type":"Password","required":true},{"key":"project_id","label":"Project ID","placeholder":"Project ID","type":"SingleLineText","required":false},{"key":"uniform_bucket_level_access","label":"Uniform Bucket Level Access","type":"Checkbox","required":false}],"actions":[{"label":"Test","placeholder":"Test","key":"test","actionType":"TEST","type":"Button"},{"label":"Save","placeholder":"Save","key":"save","actionType":"SUBMIT","type":"Button"}],"msgOnInstall":"Successfully configured! Attachments will now be stored in Google Cloud Storage.","msgOnUninstall":""}	\N	\N	\N	\N	2026-02-04 13:37:36+00	2026-02-04 13:37:36+00
mattermost	Mattermost	Mattermost brings all your team communication into one place, making it searchable and accessible anywhere.	f	\N	0.0.1	\N	install	\N	plugins/mattermost.png	\N	Chat	Chat	{"title":"Configure Mattermost","array":true,"items":[{"key":"channel","label":"Channel Name","placeholder":"Channel Name","type":"SingleLineText","required":true},{"key":"webhook_url","label":"Webhook URL","placeholder":"Webhook URL","type":"Password","required":true}],"actions":[{"label":"Test","placeholder":"Test","key":"test","actionType":"TEST","type":"Button"},{"label":"Save","placeholder":"Save","key":"save","actionType":"SUBMIT","type":"Button"}],"msgOnInstall":"Successfully installed and Mattermost is enabled for notification.","msgOnUninstall":""}	\N	\N	\N	\N	2026-02-04 13:37:36+00	2026-02-04 13:37:36+00
spaces	Spaces	Store & deliver vast amounts of content with a simple architecture.	f	\N	0.0.3	\N	install	\N	plugins/spaces.svg	\N	Storage	Storage	{"title":"DigitalOcean Spaces","items":[{"key":"bucket","label":"Bucket Name","placeholder":"Bucket Name","type":"SingleLineText","required":true},{"key":"region","label":"Region","placeholder":"Region","type":"SingleLineText","required":true},{"key":"access_key","label":"Access Key","placeholder":"Access Key","type":"SingleLineText","required":true},{"key":"access_secret","label":"Access Secret","placeholder":"Access Secret","type":"Password","required":true},{"key":"acl","label":"Access Control Lists (ACL)","placeholder":"Default set to public-read","type":"SingleLineText","required":false}],"actions":[{"label":"Test","placeholder":"Test","key":"test","actionType":"TEST","type":"Button"},{"label":"Save","placeholder":"Save","key":"save","actionType":"SUBMIT","type":"Button"}],"msgOnInstall":"Successfully configured! Attachments will now be stored in DigitalOcean Spaces.","msgOnUninstall":""}	\N	\N	\N	\N	2026-02-04 13:37:36+00	2026-02-04 13:37:36+00
backblaze	Backblaze	Backblaze B2 is enterprise-grade, S3 compatible storage that companies around the world use to store and serve data while improving their cloud OpEx vs. Amazon S3 and others.	f	\N	0.0.6	\N	install	\N	plugins/backblaze.png	\N	Storage	Storage	{"title":"Configure Backblaze B2","items":[{"key":"bucket","label":"Bucket Name","placeholder":"Bucket Name","type":"SingleLineText","required":true},{"key":"region","label":"Region","placeholder":"e.g. us-west-001","type":"SingleLineText","required":true},{"key":"access_key","label":"Access Key","placeholder":"i.e. keyID in App Keys","type":"SingleLineText","required":true},{"key":"access_secret","label":"Access Secret","placeholder":"i.e. applicationKey in App Keys","type":"Password","required":true},{"key":"acl","label":"Access Control Lists (ACL)","placeholder":"Default set to public-read","type":"SingleLineText","required":false}],"actions":[{"label":"Test","placeholder":"Test","key":"test","actionType":"TEST","type":"Button"},{"label":"Save","placeholder":"Save","key":"save","actionType":"SUBMIT","type":"Button"}],"msgOnInstall":"Successfully configured! Attachments will now be stored in Backblaze B2.","msgOnUninstall":""}	\N	\N	\N	\N	2026-02-04 13:37:36+00	2026-02-04 13:37:36+00
vultr	Vultr	Using Vultr Object Storage can give flexibility and cloud storage that allows applications greater flexibility and access worldwide.	f	\N	0.0.4	\N	install	\N	plugins/vultr.png	\N	Storage	Storage	{"title":"Configure Vultr Object Storage","items":[{"key":"bucket","label":"Bucket Name","placeholder":"Bucket Name","type":"SingleLineText","required":true},{"key":"hostname","label":"Host Name","placeholder":"e.g.: ewr1.vultrobjects.com","type":"SingleLineText","required":true},{"key":"access_key","label":"Access Key","placeholder":"Access Key","type":"SingleLineText","required":true},{"key":"access_secret","label":"Access Secret","placeholder":"Access Secret","type":"Password","required":true},{"key":"acl","label":"Access Control Lists (ACL)","placeholder":"Default set to public-read","type":"SingleLineText","required":false}],"actions":[{"label":"Test","placeholder":"Test","key":"test","actionType":"TEST","type":"Button"},{"label":"Save","placeholder":"Save","key":"save","actionType":"SUBMIT","type":"Button"}],"msgOnInstall":"Successfully configured! Attachments will now be stored in Vultr Object Storage.","msgOnUninstall":""}	\N	\N	\N	\N	2026-02-04 13:37:36+00	2026-02-04 13:37:36+00
ovh	Ovh	Upload your files to a space that you can access via HTTPS using the OpenStack Swift API, or the S3 API. 	f	\N	0.0.4	\N	install	\N	plugins/ovhCloud.png	\N	Storage	Storage	{"title":"Configure OvhCloud Object Storage","items":[{"key":"bucket","label":"Bucket Name","placeholder":"Bucket Name","type":"SingleLineText","required":true},{"key":"region","label":"Region","placeholder":"Region","type":"SingleLineText","required":true},{"key":"access_key","label":"Access Key","placeholder":"Access Key","type":"SingleLineText","required":true},{"key":"access_secret","label":"Access Secret","placeholder":"Access Secret","type":"Password","required":true},{"key":"acl","label":"Access Control Lists (ACL)","placeholder":"Default set to public-read","type":"SingleLineText","required":false}],"actions":[{"label":"Test","placeholder":"Test","key":"test","actionType":"TEST","type":"Button"},{"label":"Save","placeholder":"Save","key":"save","actionType":"SUBMIT","type":"Button"}],"msgOnInstall":"Successfully configured! Attachments will now be stored in OvhCloud Object Storage.","msgOnUninstall":""}	\N	\N	\N	\N	2026-02-04 13:37:36+00	2026-02-04 13:37:36+00
linode	Linode	S3-compatible Linode Object Storage makes it easy and more affordable to manage unstructured data such as content assets, as well as sophisticated and data-intensive storage challenges around artificial intelligence and machine learning.	f	\N	0.0.4	\N	install	\N	plugins/linode.svg	\N	Storage	Storage	{"title":"Configure Linode Object Storage","items":[{"key":"bucket","label":"Bucket Name","placeholder":"Bucket Name","type":"SingleLineText","required":true},{"key":"region","label":"Region","placeholder":"Region","type":"SingleLineText","required":true},{"key":"access_key","label":"Access Key","placeholder":"Access Key","type":"SingleLineText","required":true},{"key":"access_secret","label":"Access Secret","placeholder":"Access Secret","type":"Password","required":true},{"key":"acl","label":"Access Control Lists (ACL)","placeholder":"Default set to public-read","type":"SingleLineText","required":false}],"actions":[{"label":"Test","placeholder":"Test","key":"test","actionType":"TEST","type":"Button"},{"label":"Save","placeholder":"Save","key":"save","actionType":"SUBMIT","type":"Button"}],"msgOnInstall":"Successfully configured! Attachments will now be stored in Linode Object Storage.","msgOnUninstall":""}	\N	\N	\N	\N	2026-02-04 13:37:36+00	2026-02-04 13:37:36+00
upcloud	UpCloud	The perfect home for your data. Thanks to the S3-compatible programmable interface,\nyou have a host of options for existing tools and code implementations.\n	f	\N	0.0.4	\N	install	\N	plugins/upcloud.png	\N	Storage	Storage	{"title":"Configure UpCloud Object Storage","items":[{"key":"bucket","label":"Bucket Name","placeholder":"Bucket Name","type":"SingleLineText","required":true},{"key":"endpoint","label":"Endpoint","placeholder":"Endpoint","type":"SingleLineText","required":true},{"key":"access_key","label":"Access Key","placeholder":"Access Key","type":"SingleLineText","required":true},{"key":"access_secret","label":"Access Secret","placeholder":"Access Secret","type":"Password","required":true},{"key":"acl","label":"Access Control Lists (ACL)","placeholder":"Default set to public-read","type":"SingleLineText","required":false}],"actions":[{"label":"Test","placeholder":"Test","key":"test","actionType":"TEST","type":"Button"},{"label":"Save","placeholder":"Save","key":"save","actionType":"SUBMIT","type":"Button"}],"msgOnInstall":"Successfully configured! Attachments will now be stored in UpCloud Object Storage.","msgOnUninstall":""}	\N	\N	\N	\N	2026-02-04 13:37:36+00	2026-02-04 13:37:36+00
smtp	SMTP	SMTP email client	f	\N	0.0.6	\N	install	\N	\N	ncMail	Email	Email	{"title":"Configure Email SMTP","items":[{"key":"from","label":"From address","placeholder":"admin@example.com","type":"SingleLineText","required":true,"help_text":"Enter the e-mail address to be used as the sender (appearing in the 'From' field of sent e-mails)."},{"key":"host","label":"SMTP server","placeholder":"smtp.example.com","help_text":"Enter the SMTP hostname. If you do not have this information available, contact your email service provider.","type":"SingleLineText","required":true},{"key":"name","label":"From domain","placeholder":"your-domain.com","type":"SingleLineText","required":true,"help_text":"Specify the domain name that will be used in the 'From' address (e.g., yourdomain.com). This should match the domain of the 'From' address."},{"key":"port","label":"SMTP port","placeholder":"Port","type":"SingleLineText","required":true,"help_text":"Enter the port number used by the SMTP server (e.g., 587 for TLS, 465 for SSL, or 25 for insecure connections)."},{"key":"username","label":"Username","placeholder":"Username","type":"SingleLineText","required":false,"help_text":"Enter the username to authenticate with the SMTP server. This is usually your email address."},{"key":"password","label":"Password","placeholder":"Password","type":"Password","required":false,"help_text":"Enter the password associated with the SMTP server username. Click the eye icon to view the password as you type"},{"key":"secure","label":"Use secure connection","placeholder":"Secure","type":"Checkbox","required":false,"help_text":"Enable this if your SMTP server requires a secure connection (SSL/TLS)."},{"key":"ignoreTLS","label":"Ignore TLS errors","placeholder":"Ignore TLS","type":"Checkbox","required":false,"help_text":"Enable this if you want to ignore any TLS errors that may occur during the connection. Enabling this disables STARTTLS even if SMTP servers support it, hence may compromise security."},{"key":"rejectUnauthorized","label":"Reject unauthorized","placeholder":"Reject unauthorized","type":"Checkbox","required":false,"help_text":"Disable this to allow connecting to an SMTP server that uses a self‑signed or otherwise invalid TLS certificate."}],"actions":[{"label":"Test","key":"test","actionType":"TEST","type":"Button"},{"label":"Save","key":"save","actionType":"SUBMIT","type":"Button"}],"msgOnInstall":"Successfully installed and email notification will use SMTP configuration","msgOnUninstall":"","docs":[]}	\N	\N	\N	\N	2026-02-04 13:37:36+00	2026-02-04 13:37:36+00
mailersend	MailerSend	MailerSend email client	f	\N	0.0.2	\N	install	\N	plugins/mailersend.svg	\N	Email	Email	{"title":"Configure MailerSend","items":[{"key":"api_key","label":"API key","placeholder":"eg: ***************","type":"Password","required":true},{"key":"from","label":"From","placeholder":"eg: admin@run.com","type":"SingleLineText","required":true},{"key":"from_name","label":"From name","placeholder":"eg: Adam","type":"SingleLineText","required":true}],"actions":[{"label":"Test","key":"test","actionType":"TEST","type":"Button"},{"label":"Save","key":"save","actionType":"SUBMIT","type":"Button"}],"msgOnInstall":"Successfully configured! Email notifications are now set up using MailerSend.","msgOnUninstall":""}	\N	\N	\N	\N	2026-02-04 13:37:36+00	2026-02-04 13:37:36+00
scaleway	Scaleway	Scaleway Object Storage is an S3-compatible object store from Scaleway Cloud Platform.	f	\N	0.0.4	\N	install	\N	plugins/scaleway.png	\N	Storage	Storage	{"title":"Setup Scaleway","items":[{"key":"bucket","label":"Bucket name","placeholder":"Bucket name","type":"SingleLineText","required":true},{"key":"region","label":"Region of bucket","placeholder":"Region of bucket","type":"SingleLineText","required":true},{"key":"access_key","label":"Access Key","placeholder":"Access Key","type":"SingleLineText","required":true},{"key":"access_secret","label":"Access Secret","placeholder":"Access Secret","type":"Password","required":true},{"key":"acl","label":"Access Control Lists (ACL)","placeholder":"Default set to public-read","type":"SingleLineText","required":false}],"actions":[{"label":"Test","placeholder":"Test","key":"test","actionType":"TEST","type":"Button"},{"label":"Save","placeholder":"Save","key":"save","actionType":"SUBMIT","type":"Button"}],"msgOnInstall":"Successfully configured! Attachments will now be stored in Scaleway Object Storage.","msgOnUninstall":""}	\N	\N	\N	\N	2026-02-04 13:37:36+00	2026-02-04 13:37:36+00
ses	SES	Amazon Simple Email Service (SES) is a cost-effective, flexible, and scalable email service that enables developers to send mail from within any application.	f	\N	0.0.4	\N	install	\N	plugins/aws.png	NcAmazonAws	Email	Email	{"title":"Configure Amazon Simple Email Service (SES)","items":[{"key":"from","label":"From","placeholder":"From","type":"SingleLineText","required":true},{"key":"region","label":"Region","placeholder":"Region","type":"SingleLineText","required":true},{"key":"access_key","label":"Access Key","placeholder":"Access Key","type":"SingleLineText","required":true},{"key":"access_secret","label":"Access Secret","placeholder":"Access Secret","type":"Password","required":true}],"actions":[{"label":"Test","placeholder":"Test","key":"test","actionType":"TEST","type":"Button"},{"label":"Save","placeholder":"Save","key":"save","actionType":"SUBMIT","type":"Button"}],"msgOnInstall":"Successfully configured! Email notifications are now set up using Amazon SES.","msgOnUninstall":""}	\N	\N	\N	\N	2026-02-04 13:37:36+00	2026-02-04 13:37:36+00
cloudflare-r2	Cloudflare R2	Cloudflare R2 is an S3-compatible, zero egress-fee, globally distributed object storage.	f	\N	0.0.3	\N	install	\N	plugins/r2.png	\N	Storage	Storage	{"title":"Configure Cloudflare R2 Storage","items":[{"key":"bucket","label":"Bucket Name","placeholder":"Bucket Name","type":"SingleLineText","required":true},{"key":"hostname","label":"Host Name","placeholder":"e.g.: *****.r2.cloudflarestorage.com","type":"SingleLineText","required":true},{"key":"access_key","label":"Access Key","placeholder":"Access Key","type":"SingleLineText","required":true},{"key":"access_secret","label":"Access Secret","placeholder":"Access Secret","type":"Password","required":true}],"actions":[{"label":"Test","placeholder":"Test","key":"test","actionType":"TEST","type":"Button"},{"label":"Save","placeholder":"Save","key":"save","actionType":"SUBMIT","type":"Button"}],"msgOnInstall":"Successfully configured! Attachments will now be stored in Cloudflare R2 Storage.","msgOnUninstall":""}	\N	\N	\N	\N	2026-02-04 13:37:36+00	2026-02-04 13:37:36+00
\.


--
-- Data for Name: nc_principal_assignments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_principal_assignments (resource_type, resource_id, principal_type, principal_ref_id, roles, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_row_color_conditions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_row_color_conditions (id, fk_view_id, fk_workspace_id, base_id, color, nc_order, is_set_as_background, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_sandbox_deployment_logs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_sandbox_deployment_logs (id, fk_workspace_id, base_id, fk_sandbox_id, from_version_id, to_version_id, status, deployment_type, error_message, deployment_log, meta, created_at, updated_at, started_at, completed_at) FROM stdin;
\.


--
-- Data for Name: nc_sandbox_versions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_sandbox_versions (id, fk_workspace_id, fk_sandbox_id, version, version_number, status, schema, release_notes, created_at, updated_at, published_at) FROM stdin;
\.


--
-- Data for Name: nc_sandboxes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_sandboxes (id, fk_workspace_id, base_id, title, description, created_by, visibility, category, install_count, meta, deleted, created_at, updated_at, published_at) FROM stdin;
\.


--
-- Data for Name: nc_scripts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_scripts (id, title, description, meta, "order", base_id, fk_workspace_id, script, config, created_by, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_snapshots; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_snapshots (id, title, base_id, snapshot_base_id, fk_workspace_id, created_by, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_sort_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_sort_v2 (id, source_id, base_id, fk_view_id, fk_column_id, direction, "order", fk_workspace_id, created_at, updated_at) FROM stdin;
so56fe4ctkk8tkrd	bznmoxpma3xn3sb	pupuc6ugup9dm03	vw46sghw4wkff1ls	ckfllneskfstzzf	asc	1	wqid8bq2	2026-02-10 13:50:55+00	2026-02-10 13:50:55+00
soprpzvrpbkufdpw	bznmoxpma3xn3sb	pupuc6ugup9dm03	vwk9ual73mgqq663	ckfllneskfstzzf	asc	1	wqid8bq2	2026-02-10 13:51:08+00	2026-02-10 13:51:08+00
so94mlirt8k5ph7j	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwc4675ak5vvvugu	c1vwnz3lnox54kz	asc	1	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
soebg6sjksdeoedx	bjtfj3ddt8m4k3e	p3llodmezayxe7x	vwm2p25qoevx79zl	c1vwnz3lnox54kz	asc	1	wqid8bq2	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
\.


--
-- Data for Name: nc_sources_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_sources_v2 (id, base_id, alias, config, meta, is_meta, type, inflection_column, inflection_table, enabled, "order", description, erd_uuid, deleted, is_schema_readonly, is_data_readonly, is_local, fk_sql_executor_id, fk_workspace_id, fk_integration_id, is_encrypted, created_at, updated_at) FROM stdin;
b5b4nwkmm6723gc	ptbstfo5b36htsq	\N	{"schema":"ptbstfo5b36htsq"}	\N	f	pg	camelize	camelize	t	1	\N	\N	f	f	f	t	\N	wqid8bq2	\N	f	2026-02-04 13:41:41+00	2026-02-04 13:41:41+00
bznmoxpma3xn3sb	pupuc6ugup9dm03	\N	{"schema":"pupuc6ugup9dm03"}	\N	f	pg	camelize	camelize	t	1	\N	\N	f	f	f	t	\N	wqid8bq2	\N	f	2026-02-04 13:51:53+00	2026-02-04 13:51:53+00
bjtfj3ddt8m4k3e	p3llodmezayxe7x	\N	{"schema":"p3llodmezayxe7x"}	\N	f	pg	camelize	camelize	t	1	\N	\N	f	f	f	t	\N	wqid8bq2	\N	f	2026-02-16 15:41:37+00	2026-02-16 15:41:37+00
\.


--
-- Data for Name: nc_sql_executor_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_sql_executor_v2 (id, domain, status, priority, capacity, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_sso_client; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_sso_client (id, type, title, enabled, config, fk_user_id, fk_org_id, deleted, "order", domain_name, domain_name_verified, fk_workspace_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_sso_client_domain; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_sso_client_domain (fk_sso_client_id, fk_org_domain_id, enabled, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_store; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_store (id, base_id, db_alias, key, value, type, env, tag, created_at, updated_at) FROM stdin;
1	\N	db	NC_MIGRATION_JOBS	{"version":"9","stall_check":1770212253223,"locked":false}	\N	\N	\N	2026-02-04 13:37:36+00	2026-02-04 13:37:36+00
2	\N	db	nc_server_id	ad9b43e6ba2db71e46696b83c1c600b5f821b2aa08a30e0f8235d8a2430aff41	\N	\N	\N	2026-02-04 13:37:36+00	2026-02-04 13:37:36+00
3	\N	db	NC_CONFIG_MAIN	{"version":"0258003"}	\N	\N	\N	2026-02-04 13:37:36+00	2026-02-04 13:37:36+00
4	\N	db	NC_DEFAULT_WORKSPACE_ID	wqid8bq2	\N	\N	\N	2026-02-04 13:41:41+00	2026-02-04 13:41:41+00
\.


--
-- Data for Name: nc_subscriptions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_subscriptions (id, fk_workspace_id, fk_org_id, fk_plan_id, fk_user_id, stripe_subscription_id, stripe_price_id, seat_count, status, billing_cycle_anchor, start_at, trial_end_at, canceled_at, period, upcoming_invoice_at, upcoming_invoice_due_at, upcoming_invoice_amount, upcoming_invoice_currency, stripe_schedule_id, schedule_phase_start, schedule_stripe_price_id, schedule_fk_plan_id, schedule_period, schedule_type, meta, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_sync_configs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_sync_configs (id, fk_workspace_id, base_id, fk_integration_id, fk_model_id, sync_type, sync_trigger, sync_trigger_cron, sync_trigger_secret, sync_job_id, last_sync_at, next_sync_at, title, sync_category, fk_parent_sync_config_id, on_delete_action, created_at, updated_at, created_by, updated_by, meta) FROM stdin;
\.


--
-- Data for Name: nc_sync_logs_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_sync_logs_v2 (id, base_id, fk_sync_source_id, time_taken, status, status_details, fk_workspace_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_sync_mappings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_sync_mappings (id, fk_workspace_id, base_id, fk_sync_config_id, target_table, fk_model_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_sync_source_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_sync_source_v2 (id, title, type, details, deleted, enabled, "order", base_id, fk_user_id, source_id, fk_workspace_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_teams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_teams (id, title, meta, fk_org_id, fk_workspace_id, created_by, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_usage_stats; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_usage_stats (fk_workspace_id, usage_type, period_start, count, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_user_comment_notifications_preference; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_user_comment_notifications_preference (id, row_id, user_id, fk_model_id, source_id, base_id, preferences, fk_workspace_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_user_refresh_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_user_refresh_tokens (fk_user_id, token, meta, expires_at, created_at, updated_at) FROM stdin;
us96d0spja9v6cqe	22fb4ca19aff691f2a3f983dcb96258d76002de25ffbb42b41eda8da4f1be335cb6f7ddaa4845644	\N	2026-03-18 15:29:28.89+00	2026-02-04 13:41:42+00	2026-02-16 15:29:28+00
\.


--
-- Data for Name: nc_users_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_users_v2 (id, email, password, salt, invite_token, invite_token_expires, reset_password_expires, reset_password_token, email_verification_token, email_verified, roles, token_version, blocked, blocked_reason, deleted_at, is_deleted, meta, display_name, user_name, bio, location, website, avatar, is_new_user, created_at, updated_at) FROM stdin;
us96d0spja9v6cqe	maciej.polak@asterisk-dev.pl	$2a$10$9Xwd0HNbH31dAUi0QrfEK.z5l7/Ej7cqYORFjD.jk16W5/I/kWSya	$2a$10$9Xwd0HNbH31dAUi0QrfEK.	\N	\N	\N	\N	af25fbca-9ac8-4386-b9e3-db10e4275157	\N	org-level-creator,super	f7440115ec0bebc4e54a0aa4760438ce8aaab08af2801433278748c26c9674aa2b8fc64355082a83	f	\N	\N	f	\N	\N	\N	\N	\N	\N	\N	f	2026-02-04 13:41:41+00	2026-02-04 13:42:37+00
\.


--
-- Data for Name: nc_views_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_views_v2 (id, source_id, base_id, fk_model_id, title, type, is_default, show_system_fields, lock_type, uuid, password, show, "order", meta, description, created_by, owned_by, fk_workspace_id, attachment_mode_column_id, expanded_record_mode, fk_custom_url_id, row_coloring_mode, created_at, updated_at) FROM stdin;
vwjee43x47p4x517	b5b4nwkmm6723gc	ptbstfo5b36htsq	mle5vnsx04y6xo2	Features	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	\N	\N	wqid8bq2	\N	\N	\N	\N	2026-02-04 13:41:42+00	2026-02-04 13:41:42+00
vw0817wfiqb2kvwb	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	Calendar	6	\N	\N	collaborative	\N	\N	t	4	{}		us96d0spja9v6cqe	us96d0spja9v6cqe	wqid8bq2	\N	\N	\N	\N	2026-02-10 13:46:54+00	2026-02-10 13:46:54+00
vw16iqj48dsn1t0l	bznmoxpma3xn3sb	pupuc6ugup9dm03	m9wa466xf8r4x94	2_CONTACTS	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	\N	\N	wqid8bq2	\N	\N	\N	\N	2026-02-04 13:56:02+00	2026-02-04 13:58:14+00
vwd275umskla85dd	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m5vrl3zsxmrxcsy	_nc_m2m_6_TRANSPORTS_7_FREIGHTS	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	us96d0spja9v6cqe	us96d0spja9v6cqe	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:41+00	2026-02-16 15:41:41+00
vwtg43x3weqf23yy	bznmoxpma3xn3sb	pupuc6ugup9dm03	milkom888hl5xrj	4_DRIVERS	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	\N	\N	wqid8bq2	\N	\N	\N	\N	2026-02-04 14:00:52+00	2026-02-04 14:00:52+00
vwhwhzpkek3zzhv4	bznmoxpma3xn3sb	pupuc6ugup9dm03	mzwj8ptf78t4pi9	5_INQUIRIES	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	\N	\N	wqid8bq2	\N	\N	\N	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00
vwdgbj96cj6updef	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	6_TRANSPORTS	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	\N	\N	wqid8bq2	\N	\N	\N	\N	2026-02-04 14:00:53+00	2026-02-04 14:00:53+00
vwk9ual73mgqq663	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	Transport_This_Week < 65%	3	\N	\N	collaborative	\N	\N	t	5	{}		us96d0spja9v6cqe	us96d0spja9v6cqe	wqid8bq2	\N	\N	\N	\N	2026-02-10 13:48:18+00	2026-02-10 13:48:18+00
vwpiwjnlbkadm5qy	bznmoxpma3xn3sb	pupuc6ugup9dm03	mleo2f440ply95o	1_CLIENTS	3	\N	f	collaborative	\N	\N	t	1	{}	\N	\N	\N	wqid8bq2	\N	\N	\N	\N	2026-02-04 13:56:02+00	2026-02-04 14:25:12+00
vw86ojeksm77qo9v	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	7_FREIGHTS	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	\N	\N	wqid8bq2	\N	\N	\N	\N	2026-02-04 14:01:47+00	2026-02-04 14:31:20+00
vw9lfb4i0ub1zfnw	bznmoxpma3xn3sb	pupuc6ugup9dm03	ma2bsaypbay1l2e	_nc_m2m_2_CONTACTS_1_CLIENTS	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	us96d0spja9v6cqe	us96d0spja9v6cqe	wqid8bq2	\N	\N	\N	\N	2026-02-09 17:46:33+00	2026-02-09 17:46:33+00
vwe43mvm6lqyz7zr	bznmoxpma3xn3sb	pupuc6ugup9dm03	mwqo4tyim3er84z	_nc_m2m_4_DRIVERS_3_VEHICLES	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	us96d0spja9v6cqe	us96d0spja9v6cqe	wqid8bq2	\N	\N	\N	\N	2026-02-09 17:58:12+00	2026-02-09 17:58:12+00
vw9d71t076ku4yr8	bznmoxpma3xn3sb	pupuc6ugup9dm03	mbrdjwqzi4k85pu	_nc_m2m_5_INQUIRIES_1_CLIENTS	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	us96d0spja9v6cqe	us96d0spja9v6cqe	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:05:18+00	2026-02-09 18:05:18+00
vwjvznhyf8z6iq12	bznmoxpma3xn3sb	pupuc6ugup9dm03	mv9v9zjgzfy5elx	_nc_m2m_5_INQUIRIES_2_CONTACTS	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	us96d0spja9v6cqe	us96d0spja9v6cqe	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:12:06+00	2026-02-09 18:12:06+00
vwxjh3d8edlx5yyt	bznmoxpma3xn3sb	pupuc6ugup9dm03	muzy18i6jdjkcao	_nc_m2m_6_TRANSPORTS_3_VEHICLES	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	us96d0spja9v6cqe	us96d0spja9v6cqe	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:14:43+00	2026-02-09 18:14:43+00
vwog9d2ape9qti8s	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0tv1ftq4mjvyyl	_nc_m2m_6_TRANSPORTS_4_DRIVERS	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	us96d0spja9v6cqe	us96d0spja9v6cqe	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:17:38+00	2026-02-09 18:17:38+00
vwxff097chyfimpg	bznmoxpma3xn3sb	pupuc6ugup9dm03	m6t6dzpzjsh3pou	_nc_m2m_7_FREIGHTS_1_CLIENTS	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	us96d0spja9v6cqe	us96d0spja9v6cqe	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:21:32+00	2026-02-09 18:21:32+00
vwo4viai74qstu40	bznmoxpma3xn3sb	pupuc6ugup9dm03	md4f4x5bej6pcfo	_nc_m2m_7_FREIGHTS_6_TRANSPORTS	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	us96d0spja9v6cqe	us96d0spja9v6cqe	wqid8bq2	\N	\N	\N	\N	2026-02-09 18:29:11+00	2026-02-09 18:29:11+00
vwvuylwyl9110rhb	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	Add_Transport	1	\N	\N	collaborative	\N	\N	t	2	{"hide_branding":false,"background_color":"#F9F9FA","hide_banner":false}		us96d0spja9v6cqe	us96d0spja9v6cqe	wqid8bq2	\N	\N	\N	\N	2026-02-10 13:12:38+00	2026-02-10 13:12:38+00
vw96f23ht4exlx3f	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mxkvccdz2e8k27r	1_CLIENTS	3	\N	f	collaborative	\N	\N	t	1	{}	\N	\N	\N	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
vw64ans3hxhs2kec	bznmoxpma3xn3sb	pupuc6ugup9dm03	mizgezntumu0w42	ADD_FREIGHT	1	\N	\N	collaborative	\N	\N	t	2	{"hide_branding":false,"background_color":"#F9F9FA","hide_banner":false}		us96d0spja9v6cqe	us96d0spja9v6cqe	wqid8bq2	\N	\N	\N	\N	2026-02-10 13:20:19+00	2026-02-10 13:20:19+00
vw46sghw4wkff1ls	bznmoxpma3xn3sb	pupuc6ugup9dm03	mko9nvxci0pz4dd	Transports This Week	3	\N	\N	collaborative	\N	\N	t	3	{}		us96d0spja9v6cqe	us96d0spja9v6cqe	wqid8bq2	\N	\N	\N	\N	2026-02-10 13:35:24+00	2026-02-10 13:35:24+00
vwng57dgeuwixxem	bznmoxpma3xn3sb	pupuc6ugup9dm03	m0nr5nzv9kw4ap2	3_VEHICLES	3	\N	f	collaborative	\N	\N	t	1	{}	\N	\N	\N	wqid8bq2	\N	\N	\N	\N	2026-02-04 13:56:02+00	2026-02-11 11:54:02+00
vwsst0qiggvcgoln	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mqy196heavkuj1e	_nc_m2m_1_CLIENTS_2_CONTACTS	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	us96d0spja9v6cqe	us96d0spja9v6cqe	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
vwgb6rov5ol9xyb3	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mujx6juym4kwxgi	_nc_m2m_1_CLIENTS_5_INQUIRIES	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	us96d0spja9v6cqe	us96d0spja9v6cqe	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
vwjllheb2kfyihqf	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m5rlxcrg06scr7z	_nc_m2m_1_CLIENTS_7_FREIGHTS	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	us96d0spja9v6cqe	us96d0spja9v6cqe	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:39+00
vwjhoj4kwyi0qtbb	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mljwzfc2a38b60h	_nc_m2m_2_CONTACTS_5_INQUIRIES	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	us96d0spja9v6cqe	us96d0spja9v6cqe	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
vwdkmzhhyjunqaaz	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mxa4kgd3chtt5j3	_nc_m2m_3_VEHICLES_4_DRIVERS	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	us96d0spja9v6cqe	us96d0spja9v6cqe	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
vwoeg3vq8ea1su72	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m1yk0s3vo310v22	_nc_m2m_3_VEHICLES_6_TRANSPORTS	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	us96d0spja9v6cqe	us96d0spja9v6cqe	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
vwzjci3gg5tku891	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mt90g3ieje9tawr	_nc_m2m_4_DRIVERS_6_TRANSPORTS	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	us96d0spja9v6cqe	us96d0spja9v6cqe	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:40+00	2026-02-16 15:41:40+00
vwe5wfvymv0fo67c	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mp95ctr4880xk7r	3_VEHICLES	3	\N	f	collaborative	\N	\N	t	1	{}	\N	\N	\N	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
vwz9jrab52mlvv7c	bjtfj3ddt8m4k3e	p3llodmezayxe7x	mg8glgpealdlzio	2_CONTACTS	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	\N	\N	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
vw3sfhplkx11a9o9	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3g9kou5r88eiuh	4_DRIVERS	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	\N	\N	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
vwufye2fhrdjomkk	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m2s591s1lnxfu6a	5_INQUIRIES	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	\N	\N	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
vw0i3t3tdffa2q1w	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	6_TRANSPORTS	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	\N	\N	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:38+00	2026-02-16 15:41:42+00
vwjtp0nqbpcmfk57	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	Add_Transport	1	\N	\N	collaborative	\N	\N	t	2	{"hide_branding":false,"background_color":"#F9F9FA","hide_banner":false}		us96d0spja9v6cqe	us96d0spja9v6cqe	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
vwc4675ak5vvvugu	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	Transports This Week	3	\N	\N	collaborative	\N	\N	t	3	{}		us96d0spja9v6cqe	us96d0spja9v6cqe	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
vwy52gj1ums3z93s	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	Calendar	6	\N	\N	collaborative	\N	\N	t	4	{}		us96d0spja9v6cqe	us96d0spja9v6cqe	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
vwnoeqanzgik7e7x	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3w5kh70kk3c2l0	7_FREIGHTS	3	\N	\N	collaborative	\N	\N	t	1	{}	\N	\N	\N	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:39+00	2026-02-16 15:41:42+00
vwm2p25qoevx79zl	bjtfj3ddt8m4k3e	p3llodmezayxe7x	muktwldhfn4x6gi	Transport_This_Week < 65%	3	\N	\N	collaborative	\N	\N	t	5	{}		us96d0spja9v6cqe	us96d0spja9v6cqe	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
vw3byhppcky2j4uw	bjtfj3ddt8m4k3e	p3llodmezayxe7x	m3w5kh70kk3c2l0	ADD_FREIGHT	1	\N	\N	collaborative	\N	\N	t	2	{"hide_branding":false,"background_color":"#F9F9FA","hide_banner":false}		us96d0spja9v6cqe	us96d0spja9v6cqe	wqid8bq2	\N	\N	\N	\N	2026-02-16 15:41:42+00	2026-02-16 15:41:42+00
\.


--
-- Data for Name: nc_widgets_v2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_widgets_v2 (id, fk_workspace_id, base_id, fk_dashboard_id, fk_model_id, fk_view_id, title, description, type, config, meta, "order", "position", error, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nc_workflows; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nc_workflows (id, title, description, fk_workspace_id, base_id, enabled, nodes, edges, meta, "order", created_by, updated_by, created_at, updated_at, draft) FROM stdin;
\.


--
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.notification (id, type, body, is_read, is_deleted, fk_user_id, created_at, updated_at) FROM stdin;
ncocbge4lfdl02fz	app.welcome	{}	f	f	us96d0spja9v6cqe	2026-02-04 13:41:42+00	2026-02-04 13:41:42+00
\.


--
-- Data for Name: workspace; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.workspace (id, title, description, meta, fk_user_id, deleted, deleted_at, "order", status, message, plan, infra_meta, fk_org_id, stripe_customer_id, grace_period_start_at, api_grace_period_start_at, automation_grace_period_start_at, loyal, loyalty_discount_used, db_job_id, fk_db_instance_id, segment_code, created_at, updated_at) FROM stdin;
wqid8bq2	Default Workspace	\N	\N	us96d0spja9v6cqe	f	\N	\N	1	\N	free	\N	\N	\N	\N	\N	\N	f	f	\N	\N	\N	2026-02-04 13:41:41+00	2026-02-04 13:41:41+00
\.


--
-- Data for Name: workspace_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.workspace_user (fk_workspace_id, fk_user_id, roles, invite_token, invite_accepted, deleted, deleted_at, "order", invited_by, created_at, updated_at) FROM stdin;
wqid8bq2	us96d0spja9v6cqe	workspace-level-owner	\N	f	f	\N	\N	\N	2026-02-04 13:41:41+00	2026-02-04 13:41:41+00
\.


--
-- Data for Name: xc_knex_migrationsv0; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.xc_knex_migrationsv0 (id, name, batch, migration_time) FROM stdin;
1	nc_001_init	1	2026-02-04 13:37:35.749+00
2	nc_002_teams	1	2026-02-04 13:37:35.796+00
3	nc_003_alter_row_color_condition_nc_order_col	1	2026-02-04 13:37:35.814+00
4	nc_004_workflows	1	2026-02-04 13:37:35.867+00
5	nc_005_add_user_specific_and_meta_column_in_sync_configs	1	2026-02-04 13:37:35.869+00
6	nc_006_dependency_slots	1	2026-02-04 13:37:35.884+00
7	nc_007_workflow_draft	1	2026-02-04 13:37:35.886+00
8	nc_008_license_server	1	2026-02-04 13:37:35.899+00
9	nc_009_dependency_tracker_timestamp	1	2026-02-04 13:37:35.908+00
10	nc_010_add_constraints_col_in_column_table	1	2026-02-04 13:37:35.909+00
11	nc_011_merge_workflows_scripts	1	2026-02-04 13:37:35.946+00
12	nc_012_workflow_delay	1	2026-02-04 13:37:35.953+00
13	nc_013_composite_pk_missing_tables	1	2026-02-04 13:37:35.99+00
14	nc_014_sandboxes	1	2026-02-04 13:37:36.131+00
\.


--
-- Data for Name: xc_knex_migrationsv0_lock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.xc_knex_migrationsv0_lock (index, is_locked) FROM stdin;
1	0
\.


--
-- Data for Name: 1_CLIENTS; Type: TABLE DATA; Schema: pupuc6ugup9dm03; Owner: -
--

COPY pupuc6ugup9dm03."1_CLIENTS" (id, created_at, updated_at, created_by, updated_by, nc_order, "Company_Name", "VAT_ID", "Address", "Email", "Phone", "Notes") FROM stdin;
17	2026-02-04 14:40:43	2026-02-09 18:21:41	us96d0spja9v6cqe	us96d0spja9v6cqe	2	Schneider Spedition GmbH & Co. KG	DE223344556	Industriestr. 8, 80331 München	kontakt@schneider-spedition.de	+49 89 234 5678	Komplettladungen DE-PL
19	2026-02-04 14:40:43	2026-02-09 18:21:45	us96d0spja9v6cqe	us96d0spja9v6cqe	4	Koch Kühllogistik GmbH	DE445566778	Kühlhausring 15, 50667 Köln	disposition@koch-kuehl.de	+49 221 456 7890	Kühllogistik - Tiefkühl- und Frischware
20	2026-02-04 14:40:43	2026-02-09 18:21:50	us96d0spja9v6cqe	us96d0spja9v6cqe	5	Braun Chemie Transport AG	DE556677889	Rheinuferstr. 40, 40213 Düsseldorf	logistik@braun-chemie.de	+49 211 567 8901	ADR - Chemikalientransport Kl. 3 und 8
18	2026-02-04 14:40:43	2026-02-09 18:21:57	us96d0spja9v6cqe	us96d0spja9v6cqe	3	Weber Transporte GmbH	DE334455667	Am Containerhafen 3, 28195 Bremen	info@weber-transporte.de	+49 421 345 6789	Spezialisierung: See- und Containertransport
16	2026-02-04 14:40:43	2026-02-09 18:22:03	us96d0spja9v6cqe	us96d0spja9v6cqe	1	Müller Logistik GmbH	DE112233445	Hafenstr. 22, 20095 Hamburg	info@mueller-logistik.de	+49 40 123 4567	Stammkunde - internationaler Transport
22	2026-02-10 13:42:42	2026-02-10 13:42:42	us96d0spja9v6cqe	us96d0spja9v6cqe	7	Example_Company	DE123456789	beispielStrasse	beispiel@gmail.com	49 123456789	\N
21	2026-02-04 14:40:43	2026-02-10 13:43:36	us96d0spja9v6cqe	us96d0spja9v6cqe	6	Fischer Automotive Logistics GmbH	DE667788990	Werksallee 7, 70173 Stuttgart	spedition@fischer-auto.de	+49 711 678 9012	Automobilteile - JIT-Belieferung
\.


--
-- Data for Name: 2_CONTACTS; Type: TABLE DATA; Schema: pupuc6ugup9dm03; Owner: -
--

COPY pupuc6ugup9dm03."2_CONTACTS" (id, created_at, updated_at, created_by, updated_by, nc_order, "Full_Name", "Position", "Email", "Phone", "Primary_Contact") FROM stdin;
9	2026-02-04 14:33:00	2026-02-09 18:13:05	us96d0spja9v6cqe	us96d0spja9v6cqe	5	Klaus Weber	Logistikleiter	k.weber@weber-transporte.de	+49 421 345 6780	t
13	2026-02-10 13:42:12	2026-02-10 13:42:42	us96d0spja9v6cqe	us96d0spja9v6cqe	9	beispiel name	none	beispiel@gmail.com	49123456789	f
6	2026-02-04 14:33:00	2026-02-09 17:46:49	us96d0spja9v6cqe	us96d0spja9v6cqe	2	Petra Hoffmann	Disponentin	p.hoffmann@mueller-logistik.de	+49 40 123 4561	f
8	2026-02-04 14:33:00	2026-02-09 17:46:57	us96d0spja9v6cqe	us96d0spja9v6cqe	4	Sabine Lang	Sachbearbeiterin	s.lang@schneider-spedition.de	+49 89 234 5671	f
5	2026-02-04 14:33:00	2026-02-09 18:12:34	us96d0spja9v6cqe	us96d0spja9v6cqe	1	Hans Müller	Geschäftsführer	h.mueller@mueller-logistik.de	+49 40 123 4560	t
7	2026-02-04 14:33:00	2026-02-09 18:12:42	us96d0spja9v6cqe	us96d0spja9v6cqe	3	Thomas Schneider	Leiter Spedition	t.schneider@schneider-spedition.de	+49 89 234 5670	t
10	2026-02-04 14:33:00	2026-02-09 18:12:46	us96d0spja9v6cqe	us96d0spja9v6cqe	6	Monika Koch	Disposition Kühllogistik	m.koch@koch-kuehl.de	+49 221 456 7891	t
11	2026-02-04 14:33:00	2026-02-09 18:12:54	us96d0spja9v6cqe	us96d0spja9v6cqe	7	Stefan Braun	Gefahrgutbeauftragter	s.braun@braun-chemie.de	+49 211 567 8902	t
12	2026-02-04 14:33:00	2026-02-09 18:13:01	us96d0spja9v6cqe	us96d0spja9v6cqe	8	Katrin Fischer	Supply Chain Managerin	k.fischer@fischer-auto.de	+49 711 678 9013	t
\.


--
-- Data for Name: 3_VEHICLES; Type: TABLE DATA; Schema: pupuc6ugup9dm03; Owner: -
--

COPY pupuc6ugup9dm03."3_VEHICLES" (id, created_at, updated_at, created_by, updated_by, nc_order, "Registration_Number", "Body_Type", "Capacity_kg", "Capacity_m3", "Pallet_Spaces", "ADR", "ADR_Classes", "Inspection_Date", "Insurance_Expiry", "Notes") FROM stdin;
5	2026-02-04 14:40:20	2026-02-09 18:14:49	us96d0spja9v6cqe	us96d0spja9v6cqe	1	HH-ML 1012	Plane/Tautliner	24000	86	33	t	3,4.2,5.1	2026-06-15	2026-12-31	MAN TGX 18.510
6	2026-02-04 14:40:20	2026-02-09 18:14:52	us96d0spja9v6cqe	us96d0spja9v6cqe	2	M-SS 2034	Plane/Tautliner	24000	86	33	f	\N	2026-03-20	2026-09-30	Volvo FH 500
8	2026-02-04 14:40:20	2026-02-09 18:14:55	us96d0spja9v6cqe	us96d0spja9v6cqe	4	K-KK 4078	Kühlkoffer	22000	76	33	f	\N	2026-05-01	2026-11-30	Thermo King SLXi 300 - Tiefkühlung
7	2026-02-04 14:40:20	2026-02-09 18:15:06	us96d0spja9v6cqe	us96d0spja9v6cqe	3	HB-WT 3056	Containerchassis	26000	0	0	t	4.3,5.1	2026-08-10	2027-01-15	Für 20ft und 40ft Container
9	2026-02-04 14:40:20	2026-02-10 13:34:25	us96d0spja9v6cqe	us96d0spja9v6cqe	5	D-BC 5090	Tankfahrzeug	25000	0	0	t	3,8	2026-09-20	2027-03-15	ADR Tankzulassung Kl. 3 und 8
10	2026-02-04 14:40:20	2026-02-10 13:38:25	us96d0spja9v6cqe	us96d0spja9v6cqe	6	S-FA 6012	Kastenwagen	3500	22	8	f	\N	2026-04-10	2026-10-31	Mercedes Sprinter - JIT Zustellungen
\.


--
-- Data for Name: 4_DRIVERS; Type: TABLE DATA; Schema: pupuc6ugup9dm03; Owner: -
--

COPY pupuc6ugup9dm03."4_DRIVERS" (id, created_at, updated_at, created_by, updated_by, nc_order, "Full_Name", "Phone", "License_Categories", "ADR", "ADR_Classes", "ADR_Expiry_Date", "Medical_Exam_Expiry", "Notes") FROM stdin;
5	2026-02-04 14:37:02	2026-02-09 18:17:44	us96d0spja9v6cqe	us96d0spja9v6cqe	1	Jürgen Hartmann	+49 170 111 2233	B,C,C+E	f	\N	\N	2026-09-30	Fernverkehr - Erfahrung Skandinavien
8	2026-02-04 14:37:02	2026-02-09 18:17:56	us96d0spja9v6cqe	us96d0spja9v6cqe	4	Frank Zimmermann	+49 173 777 8899	B,C,C+E	f	\N	\N	2026-08-10	Kühllogistik - Temperaturüberwachung
9	2026-02-04 14:37:02	2026-02-09 18:18:38	us96d0spja9v6cqe	us96d0spja9v6cqe	5	Oliver Wagner	+49 174 999 0011	B,C,C+E	t	3,8	2027-05-30	2027-03-15	ADR-Schein Klasse 3 und 8 - Gefahrgut
10	2026-02-04 14:37:02	2026-02-09 18:18:45	us96d0spja9v6cqe	us96d0spja9v6cqe	6	Lukas Schäfer	+49 175 222 3344	B,C	f	\N	\N	2026-11-20	Nahverkehr - JIT Zustellungen Stuttgart
7	2026-02-04 14:37:02	2026-02-09 18:19:00	us96d0spja9v6cqe	us96d0spja9v6cqe	3	Andreas Richter	+49 172 555 6677	B,C,C+E	f	\N	\N	2027-06-20	Containerverkehr Hafen Bremen
6	2026-02-04 14:37:02	2026-02-10 13:38:30	us96d0spja9v6cqe	us96d0spja9v6cqe	2	Michael Becker	+49 171 333 4455	B,C,C+E	f	\N	\N	2026-12-15	Fernverkehr DE-PL Strecke
\.


--
-- Data for Name: 5_INQUIRIES; Type: TABLE DATA; Schema: pupuc6ugup9dm03; Owner: -
--

COPY pupuc6ugup9dm03."5_INQUIRIES" (id, created_at, updated_at, created_by, updated_by, nc_order, "Inquiry_Date", "Origin_City_Postal", "Destination_City_Postal", "Loading_Date", "Delivery_Date", "Cargo_Type", "ADR", "ADR_Class_UN", "Dimensions", "Weight_kg", "Status", "Source", "UTM_Source", "Notes") FROM stdin;
4	2026-02-04 14:37:38	2026-02-09 18:12:34	us96d0spja9v6cqe	us96d0spja9v6cqe	1	2026-02-01 11:30:00	Hamburg 20095	Warschau 00-001	2026-02-10	2026-02-11	Paletten	f	\N	120x80x180 x 20 Stk.	12000	New	Phone	\N	20 Europaletten - Stückgut
5	2026-02-04 14:37:38	2026-02-09 18:12:42	us96d0spja9v6cqe	us96d0spja9v6cqe	2	2026-02-02 13:30:00	München 80331	Poznań 60-001	2026-02-12	2026-02-13	Komplettladung	f	\N	Komplettladung LKW	23000	Quoted	Email	\N	FTL Plane - Maschinenteile
6	2026-02-04 14:37:38	2026-02-09 18:12:46	us96d0spja9v6cqe	us96d0spja9v6cqe	3	2026-02-03 22:00:00	Köln 50667	Berlin 10115	2026-02-14	2026-02-14	Kühlware	f	\N	33 Paletten	18000	Accepted	Phone	\N	Frischware -2°C bis +4°C
7	2026-02-04 14:37:38	2026-02-09 18:12:54	us96d0spja9v6cqe	us96d0spja9v6cqe	4	2026-02-04 11:30:00	Düsseldorf 40213	Frankfurt 60311	2026-02-15	2026-02-15	Gefahrgut	t	3,4.3	Tankfahrzeug	20000	New	Web Form	google_ads	Benzin - ADR Klasse 3
8	2026-02-04 14:37:38	2026-02-09 18:13:01	us96d0spja9v6cqe	us96d0spja9v6cqe	5	2026-02-04 06:00:00	Stuttgart 70173	München 80331	2026-02-11	2026-02-11	Automobilteile	f	\N	8 Gitterboxen	2800	New	Email	\N	JIT-Lieferung an Produktionslinie
9	2026-02-04 14:37:38	2026-02-09 18:13:05	us96d0spja9v6cqe	us96d0spja9v6cqe	6	2026-02-04 08:30:00	Bremen 28195	Hamburg 20095	2026-02-16	2026-02-16	Container	f	\N	1x 40ft Container	22000	Quoted	Phone	\N	Seecontainer - Umschlag Hafen
\.


--
-- Data for Name: 6_TRANSPORTS; Type: TABLE DATA; Schema: pupuc6ugup9dm03; Owner: -
--

COPY pupuc6ugup9dm03."6_TRANSPORTS" (id, created_at, updated_at, created_by, updated_by, nc_order, "Departure_Date", "Origin", "Destination", "Status", "Notes", "Transport_Capacity__") FROM stdin;
3	2026-02-04 14:37:51	2026-02-10 13:45:15	us96d0spja9v6cqe	us96d0spja9v6cqe	1	2026-02-19	Hamburg	Warschau	Planned	20 Europaletten Stückgut für Müller Logistik	50
7	2026-02-04 14:37:51	2026-02-10 13:50:13	us96d0spja9v6cqe	us96d0spja9v6cqe	5	2026-02-11	Stuttgart	München	Planned	JIT Automobilteile - Gitterboxen	60
4	2026-02-04 14:37:51	2026-02-10 13:09:15	us96d0spja9v6cqe	us96d0spja9v6cqe	2	2026-02-12	München	Berlin	Planned	FTL Komplettladung Maschinenteile	40
5	2026-02-04 14:37:51	2026-02-10 13:09:17	us96d0spja9v6cqe	us96d0spja9v6cqe	3	2026-02-14	Köln	Berlin	Planned	Kühlware Frischware -2°C bis +4°C	75
6	2026-02-04 14:37:51	2026-02-10 13:09:22	us96d0spja9v6cqe	us96d0spja9v6cqe	4	2026-02-15	Düsseldorf	Frankfurt	Planned	ADR Kl. 3 - Benzintransport	80
8	2026-02-04 14:37:51	2026-02-10 13:09:24	us96d0spja9v6cqe	us96d0spja9v6cqe	6	2026-02-16	Bremen	Hamburg	Planned	40ft Seecontainer Umschlag	100
10	2026-02-10 13:34:25	2026-02-10 13:34:25	us96d0spja9v6cqe	us96d0spja9v6cqe	7	2026-02-24	Munchen	Hamburg	Planned	\N	55
11	2026-02-10 13:38:05	2026-02-10 13:44:12	us96d0spja9v6cqe	us96d0spja9v6cqe	8	2026-02-09	ABC	CBA	Planned	\N	30
\.


--
-- Data for Name: 7_FREIGHTS; Type: TABLE DATA; Schema: pupuc6ugup9dm03; Owner: -
--

COPY pupuc6ugup9dm03."7_FREIGHTS" (id, created_at, updated_at, created_by, updated_by, nc_order, "Client", "Unit_Type", "Quantity", "Cargo_Description", "Pickup_Address", "Delivery_Address", "Freight_Price_EUR", "Invoiced", "Invoice_Number", "Notes") FROM stdin;
3	2026-02-04 14:38:14	2026-02-09 18:29:20	us96d0spja9v6cqe	us96d0spja9v6cqe	1	Müller Logistik GmbH	Pallet	20	Europaletten Stückgut - Elektronikteile	Hafenstr. 22, 20095 Hamburg	ul. Przemyslowa 15, 00-001 Warschau	1850.00	f	\N	Teilladung - Restkapazität 13 Paletten frei
4	2026-02-04 14:38:14	2026-02-09 18:29:28	us96d0spja9v6cqe	us96d0spja9v6cqe	2	Schneider Spedition GmbH & Co. KG	Pallet	33	Maschinenteile - Komplettladung	Industriestr. 8, 80331 München	Großmarktstr. 5, 10115 Berlin	2100.00	f	\N	FTL - Komplettladung
5	2026-02-04 14:38:14	2026-02-09 18:29:33	us96d0spja9v6cqe	us96d0spja9v6cqe	3	Koch Kühllogistik GmbH	Pallet	33	Frischware - Molkereiprodukte	Kühlhausring 15, 50667 Köln	Großmarktstr. 5, 10115 Berlin	1400.00	f	\N	Temperaturgeführt -2°C bis +4°C
6	2026-02-04 14:38:14	2026-02-09 18:29:36	us96d0spja9v6cqe	us96d0spja9v6cqe	4	Braun Chemie Transport AG	ADR	1	Benzin UN1203 Klasse 3 - Tanktransport	Rheinuferstr. 40, 40213 Düsseldorf	Industriepark Höchst, 60311 Frankfurt	1600.00	f	\N	ADR Tankbeförderung - Gefahrgutdokumente erforderlich
7	2026-02-04 14:38:14	2026-02-10 13:11:27	us96d0spja9v6cqe	us96d0spja9v6cqe	5	Fischer Automotive Logistics GmbH	Box	8	Gitterboxen mit Automobilteilen - JIT	Werksallee 7, 70173 Stuttgart	BMW Werk, 80331 München	650.00	f	\N	JIT-Lieferung bis 06:00 Uhr
8	2026-02-04 14:38:14	2026-02-10 13:11:28	us96d0spja9v6cqe	us96d0spja9v6cqe	6	Weber Transporte GmbH	Other	1	40ft Seecontainer - Importware aus Asien	Am Containerhafen 3, 28195 Bremen	Terminaltstr. 12, 20095 Hamburg	480.00	f	\N	Containerumschlag Hafen-Hafen
10	2026-02-10 13:29:54	2026-02-10 13:44:12	us96d0spja9v6cqe	us96d0spja9v6cqe	7	Example_XYZ	ADR	55	Example_XYZ	Maschinenteile - Komplettladung	Am Containerhafen 3, 28195 Bremen	980	f	\N	\N
\.


--
-- Data for Name: _nc_m2m_2_CONTACTS_1_CLIENTS; Type: TABLE DATA; Schema: pupuc6ugup9dm03; Owner: -
--

COPY pupuc6ugup9dm03."_nc_m2m_2_CONTACTS_1_CLIENTS" ("1_CLIENTS_id", "2_CONTACTS_id") FROM stdin;
16	5
16	6
17	7
17	8
18	9
19	10
20	11
21	12
22	13
\.


--
-- Data for Name: _nc_m2m_4_DRIVERS_3_VEHICLES; Type: TABLE DATA; Schema: pupuc6ugup9dm03; Owner: -
--

COPY pupuc6ugup9dm03."_nc_m2m_4_DRIVERS_3_VEHICLES" ("3_VEHICLES_id", "4_DRIVERS_id") FROM stdin;
5	5
6	6
7	7
8	8
9	9
10	10
\.


--
-- Data for Name: _nc_m2m_5_INQUIRIES_1_CLIENTS; Type: TABLE DATA; Schema: pupuc6ugup9dm03; Owner: -
--

COPY pupuc6ugup9dm03."_nc_m2m_5_INQUIRIES_1_CLIENTS" ("1_CLIENTS_id", "5_INQUIRIES_id") FROM stdin;
16	4
17	5
19	6
20	7
21	8
18	9
\.


--
-- Data for Name: _nc_m2m_5_INQUIRIES_2_CONTACTS; Type: TABLE DATA; Schema: pupuc6ugup9dm03; Owner: -
--

COPY pupuc6ugup9dm03."_nc_m2m_5_INQUIRIES_2_CONTACTS" ("2_CONTACTS_id", "5_INQUIRIES_id") FROM stdin;
5	4
7	5
10	6
11	7
12	8
9	9
\.


--
-- Data for Name: _nc_m2m_6_TRANSPORTS_3_VEHICLES; Type: TABLE DATA; Schema: pupuc6ugup9dm03; Owner: -
--

COPY pupuc6ugup9dm03."_nc_m2m_6_TRANSPORTS_3_VEHICLES" ("3_VEHICLES_id", "6_TRANSPORTS_id") FROM stdin;
5	3
6	4
8	5
9	6
10	7
7	8
9	10
10	11
\.


--
-- Data for Name: _nc_m2m_6_TRANSPORTS_4_DRIVERS; Type: TABLE DATA; Schema: pupuc6ugup9dm03; Owner: -
--

COPY pupuc6ugup9dm03."_nc_m2m_6_TRANSPORTS_4_DRIVERS" ("4_DRIVERS_id", "6_TRANSPORTS_id") FROM stdin;
5	3
6	4
8	5
9	6
10	7
7	8
6	10
6	11
\.


--
-- Data for Name: _nc_m2m_7_FREIGHTS_1_CLIENTS; Type: TABLE DATA; Schema: pupuc6ugup9dm03; Owner: -
--

COPY pupuc6ugup9dm03."_nc_m2m_7_FREIGHTS_1_CLIENTS" ("1_CLIENTS_id", "7_FREIGHTS_id") FROM stdin;
16	3
17	4
19	5
20	6
21	7
18	8
22	10
\.


--
-- Data for Name: _nc_m2m_7_FREIGHTS_6_TRANSPORTS; Type: TABLE DATA; Schema: pupuc6ugup9dm03; Owner: -
--

COPY pupuc6ugup9dm03."_nc_m2m_7_FREIGHTS_6_TRANSPORTS" ("6_TRANSPORTS_id", "7_FREIGHTS_id") FROM stdin;
3	3
4	4
5	5
6	6
7	7
8	8
10	10
11	10
\.


--
-- Name: 1_CLIENTS_id_seq; Type: SEQUENCE SET; Schema: p3llodmezayxe7x; Owner: -
--

SELECT pg_catalog.setval('p3llodmezayxe7x."1_CLIENTS_id_seq"', 22, true);


--
-- Name: 2_CONTACTS_id_seq; Type: SEQUENCE SET; Schema: p3llodmezayxe7x; Owner: -
--

SELECT pg_catalog.setval('p3llodmezayxe7x."2_CONTACTS_id_seq"', 13, true);


--
-- Name: 3_VEHICLES_id_seq; Type: SEQUENCE SET; Schema: p3llodmezayxe7x; Owner: -
--

SELECT pg_catalog.setval('p3llodmezayxe7x."3_VEHICLES_id_seq"', 10, true);


--
-- Name: 4_DRIVERS_id_seq; Type: SEQUENCE SET; Schema: p3llodmezayxe7x; Owner: -
--

SELECT pg_catalog.setval('p3llodmezayxe7x."4_DRIVERS_id_seq"', 10, true);


--
-- Name: 5_INQUIRIES_id_seq; Type: SEQUENCE SET; Schema: p3llodmezayxe7x; Owner: -
--

SELECT pg_catalog.setval('p3llodmezayxe7x."5_INQUIRIES_id_seq"', 9, true);


--
-- Name: 6_TRANSPORTS_id_seq; Type: SEQUENCE SET; Schema: p3llodmezayxe7x; Owner: -
--

SELECT pg_catalog.setval('p3llodmezayxe7x."6_TRANSPORTS_id_seq"', 13, true);


--
-- Name: 7_FREIGHTS_id_seq; Type: SEQUENCE SET; Schema: p3llodmezayxe7x; Owner: -
--

SELECT pg_catalog.setval('p3llodmezayxe7x."7_FREIGHTS_id_seq"', 13, true);


--
-- Name: Features_id_seq; Type: SEQUENCE SET; Schema: ptbstfo5b36htsq; Owner: -
--

SELECT pg_catalog.setval('ptbstfo5b36htsq."Features_id_seq"', 1, false);


--
-- Name: nc_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.nc_api_tokens_id_seq', 1, true);


--
-- Name: nc_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.nc_store_id_seq', 4, true);


--
-- Name: xc_knex_migrationsv0_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.xc_knex_migrationsv0_id_seq', 14, true);


--
-- Name: xc_knex_migrationsv0_lock_index_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.xc_knex_migrationsv0_lock_index_seq', 1, true);


--
-- Name: 1_CLIENTS_csv_id_seq; Type: SEQUENCE SET; Schema: pupuc6ugup9dm03; Owner: -
--

SELECT pg_catalog.setval('pupuc6ugup9dm03."1_CLIENTS_csv_id_seq"', 22, true);


--
-- Name: 2_CONTACTS_csv_id_seq; Type: SEQUENCE SET; Schema: pupuc6ugup9dm03; Owner: -
--

SELECT pg_catalog.setval('pupuc6ugup9dm03."2_CONTACTS_csv_id_seq"', 13, true);


--
-- Name: 3_VEHICLES_csv_id_seq; Type: SEQUENCE SET; Schema: pupuc6ugup9dm03; Owner: -
--

SELECT pg_catalog.setval('pupuc6ugup9dm03."3_VEHICLES_csv_id_seq"', 10, true);


--
-- Name: 4_DRIVERS_id_seq; Type: SEQUENCE SET; Schema: pupuc6ugup9dm03; Owner: -
--

SELECT pg_catalog.setval('pupuc6ugup9dm03."4_DRIVERS_id_seq"', 10, true);


--
-- Name: 5_INQUIRIES_id_seq; Type: SEQUENCE SET; Schema: pupuc6ugup9dm03; Owner: -
--

SELECT pg_catalog.setval('pupuc6ugup9dm03."5_INQUIRIES_id_seq"', 9, true);


--
-- Name: 6_TRANSPORTS_id_seq; Type: SEQUENCE SET; Schema: pupuc6ugup9dm03; Owner: -
--

SELECT pg_catalog.setval('pupuc6ugup9dm03."6_TRANSPORTS_id_seq"', 13, true);


--
-- Name: 7_FREIGHTS_csv_id_seq; Type: SEQUENCE SET; Schema: pupuc6ugup9dm03; Owner: -
--

SELECT pg_catalog.setval('pupuc6ugup9dm03."7_FREIGHTS_csv_id_seq"', 13, true);


--
-- Name: 1_CLIENTS 1_CLIENTS_pkey; Type: CONSTRAINT; Schema: p3llodmezayxe7x; Owner: -
--

ALTER TABLE ONLY p3llodmezayxe7x."1_CLIENTS"
    ADD CONSTRAINT "1_CLIENTS_pkey" PRIMARY KEY (id);


--
-- Name: 2_CONTACTS 2_CONTACTS_pkey; Type: CONSTRAINT; Schema: p3llodmezayxe7x; Owner: -
--

ALTER TABLE ONLY p3llodmezayxe7x."2_CONTACTS"
    ADD CONSTRAINT "2_CONTACTS_pkey" PRIMARY KEY (id);


--
-- Name: 3_VEHICLES 3_VEHICLES_pkey; Type: CONSTRAINT; Schema: p3llodmezayxe7x; Owner: -
--

ALTER TABLE ONLY p3llodmezayxe7x."3_VEHICLES"
    ADD CONSTRAINT "3_VEHICLES_pkey" PRIMARY KEY (id);


--
-- Name: 4_DRIVERS 4_DRIVERS_pkey; Type: CONSTRAINT; Schema: p3llodmezayxe7x; Owner: -
--

ALTER TABLE ONLY p3llodmezayxe7x."4_DRIVERS"
    ADD CONSTRAINT "4_DRIVERS_pkey" PRIMARY KEY (id);


--
-- Name: 5_INQUIRIES 5_INQUIRIES_pkey; Type: CONSTRAINT; Schema: p3llodmezayxe7x; Owner: -
--

ALTER TABLE ONLY p3llodmezayxe7x."5_INQUIRIES"
    ADD CONSTRAINT "5_INQUIRIES_pkey" PRIMARY KEY (id);


--
-- Name: 6_TRANSPORTS 6_TRANSPORTS_pkey; Type: CONSTRAINT; Schema: p3llodmezayxe7x; Owner: -
--

ALTER TABLE ONLY p3llodmezayxe7x."6_TRANSPORTS"
    ADD CONSTRAINT "6_TRANSPORTS_pkey" PRIMARY KEY (id);


--
-- Name: 7_FREIGHTS 7_FREIGHTS_pkey; Type: CONSTRAINT; Schema: p3llodmezayxe7x; Owner: -
--

ALTER TABLE ONLY p3llodmezayxe7x."7_FREIGHTS"
    ADD CONSTRAINT "7_FREIGHTS_pkey" PRIMARY KEY (id);


--
-- Name: _nc_m2m_1_CLIENTS_2_CONTACTS _nc_m2m_1_CLIENTS_2_CONTACTS_pkey; Type: CONSTRAINT; Schema: p3llodmezayxe7x; Owner: -
--

ALTER TABLE ONLY p3llodmezayxe7x."_nc_m2m_1_CLIENTS_2_CONTACTS"
    ADD CONSTRAINT "_nc_m2m_1_CLIENTS_2_CONTACTS_pkey" PRIMARY KEY ("2_CONTACTS_id", "1_CLIENTS_id");


--
-- Name: _nc_m2m_1_CLIENTS_5_INQUIRIES _nc_m2m_1_CLIENTS_5_INQUIRIES_pkey; Type: CONSTRAINT; Schema: p3llodmezayxe7x; Owner: -
--

ALTER TABLE ONLY p3llodmezayxe7x."_nc_m2m_1_CLIENTS_5_INQUIRIES"
    ADD CONSTRAINT "_nc_m2m_1_CLIENTS_5_INQUIRIES_pkey" PRIMARY KEY ("5_INQUIRIES_id", "1_CLIENTS_id");


--
-- Name: _nc_m2m_1_CLIENTS_7_FREIGHTS _nc_m2m_1_CLIENTS_7_FREIGHTS_pkey; Type: CONSTRAINT; Schema: p3llodmezayxe7x; Owner: -
--

ALTER TABLE ONLY p3llodmezayxe7x."_nc_m2m_1_CLIENTS_7_FREIGHTS"
    ADD CONSTRAINT "_nc_m2m_1_CLIENTS_7_FREIGHTS_pkey" PRIMARY KEY ("7_FREIGHTS_id", "1_CLIENTS_id");


--
-- Name: _nc_m2m_2_CONTACTS_5_INQUIRIES _nc_m2m_2_CONTACTS_5_INQUIRIES_pkey; Type: CONSTRAINT; Schema: p3llodmezayxe7x; Owner: -
--

ALTER TABLE ONLY p3llodmezayxe7x."_nc_m2m_2_CONTACTS_5_INQUIRIES"
    ADD CONSTRAINT "_nc_m2m_2_CONTACTS_5_INQUIRIES_pkey" PRIMARY KEY ("5_INQUIRIES_id", "2_CONTACTS_id");


--
-- Name: _nc_m2m_3_VEHICLES_4_DRIVERS _nc_m2m_3_VEHICLES_4_DRIVERS_pkey; Type: CONSTRAINT; Schema: p3llodmezayxe7x; Owner: -
--

ALTER TABLE ONLY p3llodmezayxe7x."_nc_m2m_3_VEHICLES_4_DRIVERS"
    ADD CONSTRAINT "_nc_m2m_3_VEHICLES_4_DRIVERS_pkey" PRIMARY KEY ("4_DRIVERS_id", "3_VEHICLES_id");


--
-- Name: _nc_m2m_3_VEHICLES_6_TRANSPORTS _nc_m2m_3_VEHICLES_6_TRANSPORTS_pkey; Type: CONSTRAINT; Schema: p3llodmezayxe7x; Owner: -
--

ALTER TABLE ONLY p3llodmezayxe7x."_nc_m2m_3_VEHICLES_6_TRANSPORTS"
    ADD CONSTRAINT "_nc_m2m_3_VEHICLES_6_TRANSPORTS_pkey" PRIMARY KEY ("6_TRANSPORTS_id", "3_VEHICLES_id");


--
-- Name: _nc_m2m_4_DRIVERS_6_TRANSPORTS _nc_m2m_4_DRIVERS_6_TRANSPORTS_pkey; Type: CONSTRAINT; Schema: p3llodmezayxe7x; Owner: -
--

ALTER TABLE ONLY p3llodmezayxe7x."_nc_m2m_4_DRIVERS_6_TRANSPORTS"
    ADD CONSTRAINT "_nc_m2m_4_DRIVERS_6_TRANSPORTS_pkey" PRIMARY KEY ("6_TRANSPORTS_id", "4_DRIVERS_id");


--
-- Name: _nc_m2m_6_TRANSPORTS_7_FREIGHTS _nc_m2m_6_TRANSPORTS_7_FREIGHTS_pkey; Type: CONSTRAINT; Schema: p3llodmezayxe7x; Owner: -
--

ALTER TABLE ONLY p3llodmezayxe7x."_nc_m2m_6_TRANSPORTS_7_FREIGHTS"
    ADD CONSTRAINT "_nc_m2m_6_TRANSPORTS_7_FREIGHTS_pkey" PRIMARY KEY ("7_FREIGHTS_id", "6_TRANSPORTS_id");


--
-- Name: Features Features_pkey; Type: CONSTRAINT; Schema: ptbstfo5b36htsq; Owner: -
--

ALTER TABLE ONLY ptbstfo5b36htsq."Features"
    ADD CONSTRAINT "Features_pkey" PRIMARY KEY (id);


--
-- Name: nc_api_tokens nc_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_api_tokens
    ADD CONSTRAINT nc_api_tokens_pkey PRIMARY KEY (id);


--
-- Name: nc_audit_v2 nc_audit_v2_pkx; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_audit_v2
    ADD CONSTRAINT nc_audit_v2_pkx PRIMARY KEY (id);


--
-- Name: nc_automation_executions nc_automation_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_automation_executions
    ADD CONSTRAINT nc_automation_executions_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_automations nc_automations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_automations
    ADD CONSTRAINT nc_automations_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_base_users_v2 nc_base_users_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_base_users_v2
    ADD CONSTRAINT nc_base_users_v2_pkey PRIMARY KEY (base_id, fk_user_id);


--
-- Name: nc_sources_v2 nc_bases_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_sources_v2
    ADD CONSTRAINT nc_bases_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_calendar_view_columns_v2 nc_calendar_view_columns_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_calendar_view_columns_v2
    ADD CONSTRAINT nc_calendar_view_columns_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_calendar_view_range_v2 nc_calendar_view_range_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_calendar_view_range_v2
    ADD CONSTRAINT nc_calendar_view_range_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_calendar_view_v2 nc_calendar_view_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_calendar_view_v2
    ADD CONSTRAINT nc_calendar_view_v2_pkey PRIMARY KEY (base_id, fk_view_id);


--
-- Name: nc_col_barcode_v2 nc_col_barcode_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_col_barcode_v2
    ADD CONSTRAINT nc_col_barcode_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_col_button_v2 nc_col_button_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_col_button_v2
    ADD CONSTRAINT nc_col_button_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_col_formula_v2 nc_col_formula_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_col_formula_v2
    ADD CONSTRAINT nc_col_formula_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_col_long_text_v2 nc_col_long_text_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_col_long_text_v2
    ADD CONSTRAINT nc_col_long_text_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_col_lookup_v2 nc_col_lookup_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_col_lookup_v2
    ADD CONSTRAINT nc_col_lookup_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_col_qrcode_v2 nc_col_qrcode_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_col_qrcode_v2
    ADD CONSTRAINT nc_col_qrcode_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_col_relations_v2 nc_col_relations_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_col_relations_v2
    ADD CONSTRAINT nc_col_relations_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_col_rollup_v2 nc_col_rollup_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_col_rollup_v2
    ADD CONSTRAINT nc_col_rollup_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_col_select_options_v2 nc_col_select_options_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_col_select_options_v2
    ADD CONSTRAINT nc_col_select_options_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_columns_v2 nc_columns_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_columns_v2
    ADD CONSTRAINT nc_columns_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_comment_reactions nc_comment_reactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_comment_reactions
    ADD CONSTRAINT nc_comment_reactions_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_comments nc_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_comments
    ADD CONSTRAINT nc_comments_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_custom_urls_v2 nc_custom_urls_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_custom_urls_v2
    ADD CONSTRAINT nc_custom_urls_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_dashboards_v2 nc_dashboards_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_dashboards_v2
    ADD CONSTRAINT nc_dashboards_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_data_reflection nc_data_reflection_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_data_reflection
    ADD CONSTRAINT nc_data_reflection_pkey PRIMARY KEY (id);


--
-- Name: nc_db_servers nc_db_servers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_db_servers
    ADD CONSTRAINT nc_db_servers_pkey PRIMARY KEY (id);


--
-- Name: nc_dependency_tracker nc_dependency_tracker_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_dependency_tracker
    ADD CONSTRAINT nc_dependency_tracker_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_disabled_models_for_role_v2 nc_disabled_models_for_role_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_disabled_models_for_role_v2
    ADD CONSTRAINT nc_disabled_models_for_role_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_extensions nc_extensions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_extensions
    ADD CONSTRAINT nc_extensions_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_file_references nc_file_references_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_file_references
    ADD CONSTRAINT nc_file_references_pkey PRIMARY KEY (id);


--
-- Name: nc_filter_exp_v2 nc_filter_exp_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_filter_exp_v2
    ADD CONSTRAINT nc_filter_exp_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_follower nc_follower_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_follower
    ADD CONSTRAINT nc_follower_pkey PRIMARY KEY (fk_user_id, fk_follower_id);


--
-- Name: nc_form_view_columns_v2 nc_form_view_columns_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_form_view_columns_v2
    ADD CONSTRAINT nc_form_view_columns_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_form_view_v2 nc_form_view_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_form_view_v2
    ADD CONSTRAINT nc_form_view_v2_pkey PRIMARY KEY (base_id, fk_view_id);


--
-- Name: nc_gallery_view_columns_v2 nc_gallery_view_columns_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_gallery_view_columns_v2
    ADD CONSTRAINT nc_gallery_view_columns_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_gallery_view_v2 nc_gallery_view_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_gallery_view_v2
    ADD CONSTRAINT nc_gallery_view_v2_pkey PRIMARY KEY (base_id, fk_view_id);


--
-- Name: nc_grid_view_columns_v2 nc_grid_view_columns_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_grid_view_columns_v2
    ADD CONSTRAINT nc_grid_view_columns_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_grid_view_v2 nc_grid_view_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_grid_view_v2
    ADD CONSTRAINT nc_grid_view_v2_pkey PRIMARY KEY (base_id, fk_view_id);


--
-- Name: nc_hook_logs_v2 nc_hook_logs_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_hook_logs_v2
    ADD CONSTRAINT nc_hook_logs_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_hook_trigger_fields nc_hook_trigger_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_hook_trigger_fields
    ADD CONSTRAINT nc_hook_trigger_fields_pkey PRIMARY KEY (fk_workspace_id, base_id, fk_hook_id, fk_column_id);


--
-- Name: nc_hooks_v2 nc_hooks_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_hooks_v2
    ADD CONSTRAINT nc_hooks_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_installations nc_installations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_installations
    ADD CONSTRAINT nc_installations_pkey PRIMARY KEY (id);


--
-- Name: nc_integrations_store_v2 nc_integrations_store_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_integrations_store_v2
    ADD CONSTRAINT nc_integrations_store_v2_pkey PRIMARY KEY (id);


--
-- Name: nc_integrations_v2 nc_integrations_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_integrations_v2
    ADD CONSTRAINT nc_integrations_v2_pkey PRIMARY KEY (id);


--
-- Name: nc_jobs nc_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_jobs
    ADD CONSTRAINT nc_jobs_pkey PRIMARY KEY (id);


--
-- Name: nc_kanban_view_columns_v2 nc_kanban_view_columns_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_kanban_view_columns_v2
    ADD CONSTRAINT nc_kanban_view_columns_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_kanban_view_v2 nc_kanban_view_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_kanban_view_v2
    ADD CONSTRAINT nc_kanban_view_v2_pkey PRIMARY KEY (base_id, fk_view_id);


--
-- Name: nc_map_view_columns_v2 nc_map_view_columns_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_map_view_columns_v2
    ADD CONSTRAINT nc_map_view_columns_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_map_view_v2 nc_map_view_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_map_view_v2
    ADD CONSTRAINT nc_map_view_v2_pkey PRIMARY KEY (base_id, fk_view_id);


--
-- Name: nc_mcp_tokens nc_mcp_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_mcp_tokens
    ADD CONSTRAINT nc_mcp_tokens_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_model_stats_v2 nc_model_stats_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_model_stats_v2
    ADD CONSTRAINT nc_model_stats_v2_pkey PRIMARY KEY (fk_workspace_id, base_id, fk_model_id);


--
-- Name: nc_models_v2 nc_models_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_models_v2
    ADD CONSTRAINT nc_models_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_oauth_authorization_codes nc_oauth_authorization_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_oauth_authorization_codes
    ADD CONSTRAINT nc_oauth_authorization_codes_pkey PRIMARY KEY (code);


--
-- Name: nc_oauth_clients nc_oauth_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_oauth_clients
    ADD CONSTRAINT nc_oauth_clients_pkey PRIMARY KEY (client_id);


--
-- Name: nc_oauth_tokens nc_oauth_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_oauth_tokens
    ADD CONSTRAINT nc_oauth_tokens_pkey PRIMARY KEY (id);


--
-- Name: nc_org_domain nc_org_domain_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_org_domain
    ADD CONSTRAINT nc_org_domain_pkey PRIMARY KEY (id);


--
-- Name: nc_org nc_org_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_org
    ADD CONSTRAINT nc_org_pkey PRIMARY KEY (id);


--
-- Name: nc_org_users nc_org_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_org_users
    ADD CONSTRAINT nc_org_users_pkey PRIMARY KEY (fk_org_id);


--
-- Name: nc_permission_subjects nc_permission_subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_permission_subjects
    ADD CONSTRAINT nc_permission_subjects_pkey PRIMARY KEY (base_id, fk_permission_id, subject_type, subject_id);


--
-- Name: nc_permissions nc_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_permissions
    ADD CONSTRAINT nc_permissions_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_plans nc_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_plans
    ADD CONSTRAINT nc_plans_pkey PRIMARY KEY (id);


--
-- Name: nc_plugins_v2 nc_plugins_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_plugins_v2
    ADD CONSTRAINT nc_plugins_v2_pkey PRIMARY KEY (id);


--
-- Name: nc_principal_assignments nc_principal_assignments_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_principal_assignments
    ADD CONSTRAINT nc_principal_assignments_pk PRIMARY KEY (resource_type, resource_id, principal_type, principal_ref_id);


--
-- Name: nc_bases_v2 nc_projects_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_bases_v2
    ADD CONSTRAINT nc_projects_v2_pkey PRIMARY KEY (id);


--
-- Name: nc_row_color_conditions nc_row_color_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_row_color_conditions
    ADD CONSTRAINT nc_row_color_conditions_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_sandbox_deployment_logs nc_sandbox_deployment_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_sandbox_deployment_logs
    ADD CONSTRAINT nc_sandbox_deployment_logs_pkey PRIMARY KEY (id);


--
-- Name: nc_sandbox_versions nc_sandbox_versions_number_unique_idx; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_sandbox_versions
    ADD CONSTRAINT nc_sandbox_versions_number_unique_idx UNIQUE (fk_sandbox_id, version_number);


--
-- Name: nc_sandbox_versions nc_sandbox_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_sandbox_versions
    ADD CONSTRAINT nc_sandbox_versions_pkey PRIMARY KEY (id);


--
-- Name: nc_sandbox_versions nc_sandbox_versions_unique_idx; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_sandbox_versions
    ADD CONSTRAINT nc_sandbox_versions_unique_idx UNIQUE (fk_sandbox_id, version);


--
-- Name: nc_sandboxes nc_sandboxes_base_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_sandboxes
    ADD CONSTRAINT nc_sandboxes_base_id_unique UNIQUE (base_id);


--
-- Name: nc_sandboxes nc_sandboxes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_sandboxes
    ADD CONSTRAINT nc_sandboxes_pkey PRIMARY KEY (id);


--
-- Name: nc_scripts nc_scripts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_scripts
    ADD CONSTRAINT nc_scripts_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_snapshots nc_snapshots_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_snapshots
    ADD CONSTRAINT nc_snapshots_pkey PRIMARY KEY (id);


--
-- Name: nc_sort_v2 nc_sort_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_sort_v2
    ADD CONSTRAINT nc_sort_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_sql_executor_v2 nc_sql_executor_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_sql_executor_v2
    ADD CONSTRAINT nc_sql_executor_v2_pkey PRIMARY KEY (id);


--
-- Name: nc_sso_client_domain nc_sso_client_domain_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_sso_client_domain
    ADD CONSTRAINT nc_sso_client_domain_pkey PRIMARY KEY (fk_sso_client_id);


--
-- Name: nc_sso_client nc_sso_client_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_sso_client
    ADD CONSTRAINT nc_sso_client_pkey PRIMARY KEY (id);


--
-- Name: nc_store nc_store_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_store
    ADD CONSTRAINT nc_store_pkey PRIMARY KEY (id);


--
-- Name: nc_subscriptions nc_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_subscriptions
    ADD CONSTRAINT nc_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: nc_sync_configs nc_sync_configs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_sync_configs
    ADD CONSTRAINT nc_sync_configs_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_sync_logs_v2 nc_sync_logs_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_sync_logs_v2
    ADD CONSTRAINT nc_sync_logs_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_sync_mappings nc_sync_mappings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_sync_mappings
    ADD CONSTRAINT nc_sync_mappings_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_sync_source_v2 nc_sync_source_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_sync_source_v2
    ADD CONSTRAINT nc_sync_source_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_teams nc_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_teams
    ADD CONSTRAINT nc_teams_pkey PRIMARY KEY (id);


--
-- Name: nc_usage_stats nc_usage_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_usage_stats
    ADD CONSTRAINT nc_usage_stats_pkey PRIMARY KEY (fk_workspace_id, usage_type, period_start);


--
-- Name: nc_user_comment_notifications_preference nc_user_comment_notifications_preference_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_user_comment_notifications_preference
    ADD CONSTRAINT nc_user_comment_notifications_preference_pkey PRIMARY KEY (id);


--
-- Name: nc_users_v2 nc_users_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_users_v2
    ADD CONSTRAINT nc_users_v2_pkey PRIMARY KEY (id);


--
-- Name: nc_views_v2 nc_views_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_views_v2
    ADD CONSTRAINT nc_views_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_widgets_v2 nc_widgets_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_widgets_v2
    ADD CONSTRAINT nc_widgets_v2_pkey PRIMARY KEY (base_id, id);


--
-- Name: nc_workflows nc_workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nc_workflows
    ADD CONSTRAINT nc_workflows_pkey PRIMARY KEY (id);


--
-- Name: notification notification_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (id);


--
-- Name: workspace workspace_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workspace
    ADD CONSTRAINT workspace_pkey PRIMARY KEY (id);


--
-- Name: workspace_user workspace_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workspace_user
    ADD CONSTRAINT workspace_user_pkey PRIMARY KEY (fk_workspace_id, fk_user_id);


--
-- Name: xc_knex_migrationsv0_lock xc_knex_migrationsv0_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xc_knex_migrationsv0_lock
    ADD CONSTRAINT xc_knex_migrationsv0_lock_pkey PRIMARY KEY (index);


--
-- Name: xc_knex_migrationsv0 xc_knex_migrationsv0_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xc_knex_migrationsv0
    ADD CONSTRAINT xc_knex_migrationsv0_pkey PRIMARY KEY (id);


--
-- Name: 1_CLIENTS 1_CLIENTS_csv_pkey; Type: CONSTRAINT; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER TABLE ONLY pupuc6ugup9dm03."1_CLIENTS"
    ADD CONSTRAINT "1_CLIENTS_csv_pkey" PRIMARY KEY (id);


--
-- Name: 2_CONTACTS 2_CONTACTS_csv_pkey; Type: CONSTRAINT; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER TABLE ONLY pupuc6ugup9dm03."2_CONTACTS"
    ADD CONSTRAINT "2_CONTACTS_csv_pkey" PRIMARY KEY (id);


--
-- Name: 3_VEHICLES 3_VEHICLES_csv_pkey; Type: CONSTRAINT; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER TABLE ONLY pupuc6ugup9dm03."3_VEHICLES"
    ADD CONSTRAINT "3_VEHICLES_csv_pkey" PRIMARY KEY (id);


--
-- Name: 4_DRIVERS 4_DRIVERS_pkey; Type: CONSTRAINT; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER TABLE ONLY pupuc6ugup9dm03."4_DRIVERS"
    ADD CONSTRAINT "4_DRIVERS_pkey" PRIMARY KEY (id);


--
-- Name: 5_INQUIRIES 5_INQUIRIES_pkey; Type: CONSTRAINT; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER TABLE ONLY pupuc6ugup9dm03."5_INQUIRIES"
    ADD CONSTRAINT "5_INQUIRIES_pkey" PRIMARY KEY (id);


--
-- Name: 6_TRANSPORTS 6_TRANSPORTS_pkey; Type: CONSTRAINT; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER TABLE ONLY pupuc6ugup9dm03."6_TRANSPORTS"
    ADD CONSTRAINT "6_TRANSPORTS_pkey" PRIMARY KEY (id);


--
-- Name: 7_FREIGHTS 7_FREIGHTS_csv_pkey; Type: CONSTRAINT; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER TABLE ONLY pupuc6ugup9dm03."7_FREIGHTS"
    ADD CONSTRAINT "7_FREIGHTS_csv_pkey" PRIMARY KEY (id);


--
-- Name: _nc_m2m_2_CONTACTS_1_CLIENTS _nc_m2m_2_CONTACTS_1_CLIENTS_pkey; Type: CONSTRAINT; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER TABLE ONLY pupuc6ugup9dm03."_nc_m2m_2_CONTACTS_1_CLIENTS"
    ADD CONSTRAINT "_nc_m2m_2_CONTACTS_1_CLIENTS_pkey" PRIMARY KEY ("1_CLIENTS_id", "2_CONTACTS_id");


--
-- Name: _nc_m2m_4_DRIVERS_3_VEHICLES _nc_m2m_4_DRIVERS_3_VEHICLES_pkey; Type: CONSTRAINT; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER TABLE ONLY pupuc6ugup9dm03."_nc_m2m_4_DRIVERS_3_VEHICLES"
    ADD CONSTRAINT "_nc_m2m_4_DRIVERS_3_VEHICLES_pkey" PRIMARY KEY ("3_VEHICLES_id", "4_DRIVERS_id");


--
-- Name: _nc_m2m_5_INQUIRIES_1_CLIENTS _nc_m2m_5_INQUIRIES_1_CLIENTS_pkey; Type: CONSTRAINT; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER TABLE ONLY pupuc6ugup9dm03."_nc_m2m_5_INQUIRIES_1_CLIENTS"
    ADD CONSTRAINT "_nc_m2m_5_INQUIRIES_1_CLIENTS_pkey" PRIMARY KEY ("1_CLIENTS_id", "5_INQUIRIES_id");


--
-- Name: _nc_m2m_5_INQUIRIES_2_CONTACTS _nc_m2m_5_INQUIRIES_2_CONTACTS_pkey; Type: CONSTRAINT; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER TABLE ONLY pupuc6ugup9dm03."_nc_m2m_5_INQUIRIES_2_CONTACTS"
    ADD CONSTRAINT "_nc_m2m_5_INQUIRIES_2_CONTACTS_pkey" PRIMARY KEY ("2_CONTACTS_id", "5_INQUIRIES_id");


--
-- Name: _nc_m2m_6_TRANSPORTS_3_VEHICLES _nc_m2m_6_TRANSPORTS_3_VEHICLES_pkey; Type: CONSTRAINT; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER TABLE ONLY pupuc6ugup9dm03."_nc_m2m_6_TRANSPORTS_3_VEHICLES"
    ADD CONSTRAINT "_nc_m2m_6_TRANSPORTS_3_VEHICLES_pkey" PRIMARY KEY ("3_VEHICLES_id", "6_TRANSPORTS_id");


--
-- Name: _nc_m2m_6_TRANSPORTS_4_DRIVERS _nc_m2m_6_TRANSPORTS_4_DRIVERS_pkey; Type: CONSTRAINT; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER TABLE ONLY pupuc6ugup9dm03."_nc_m2m_6_TRANSPORTS_4_DRIVERS"
    ADD CONSTRAINT "_nc_m2m_6_TRANSPORTS_4_DRIVERS_pkey" PRIMARY KEY ("4_DRIVERS_id", "6_TRANSPORTS_id");


--
-- Name: _nc_m2m_7_FREIGHTS_1_CLIENTS _nc_m2m_7_FREIGHTS_1_CLIENTS_pkey; Type: CONSTRAINT; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER TABLE ONLY pupuc6ugup9dm03."_nc_m2m_7_FREIGHTS_1_CLIENTS"
    ADD CONSTRAINT "_nc_m2m_7_FREIGHTS_1_CLIENTS_pkey" PRIMARY KEY ("1_CLIENTS_id", "7_FREIGHTS_id");


--
-- Name: _nc_m2m_7_FREIGHTS_6_TRANSPORTS _nc_m2m_7_FREIGHTS_6_TRANSPORTS_pkey; Type: CONSTRAINT; Schema: pupuc6ugup9dm03; Owner: -
--

ALTER TABLE ONLY pupuc6ugup9dm03."_nc_m2m_7_FREIGHTS_6_TRANSPORTS"
    ADD CONSTRAINT "_nc_m2m_7_FREIGHTS_6_TRANSPORTS_pkey" PRIMARY KEY ("6_TRANSPORTS_id", "7_FREIGHTS_id");


--
-- Name: 1_CLIENTS_order_idx; Type: INDEX; Schema: p3llodmezayxe7x; Owner: -
--

CREATE INDEX "1_CLIENTS_order_idx" ON p3llodmezayxe7x."1_CLIENTS" USING btree (nc_order);


--
-- Name: 2_CONTACTS_order_idx; Type: INDEX; Schema: p3llodmezayxe7x; Owner: -
--

CREATE INDEX "2_CONTACTS_order_idx" ON p3llodmezayxe7x."2_CONTACTS" USING btree (nc_order);


--
-- Name: 3_VEHICLES_order_idx; Type: INDEX; Schema: p3llodmezayxe7x; Owner: -
--

CREATE INDEX "3_VEHICLES_order_idx" ON p3llodmezayxe7x."3_VEHICLES" USING btree (nc_order);


--
-- Name: 4_DRIVERS_order_idx; Type: INDEX; Schema: p3llodmezayxe7x; Owner: -
--

CREATE INDEX "4_DRIVERS_order_idx" ON p3llodmezayxe7x."4_DRIVERS" USING btree (nc_order);


--
-- Name: 5_INQUIRIES_order_idx; Type: INDEX; Schema: p3llodmezayxe7x; Owner: -
--

CREATE INDEX "5_INQUIRIES_order_idx" ON p3llodmezayxe7x."5_INQUIRIES" USING btree (nc_order);


--
-- Name: 6_TRANSPORTS_order_idx; Type: INDEX; Schema: p3llodmezayxe7x; Owner: -
--

CREATE INDEX "6_TRANSPORTS_order_idx" ON p3llodmezayxe7x."6_TRANSPORTS" USING btree (nc_order);


--
-- Name: 7_FREIGHTS_order_idx; Type: INDEX; Schema: p3llodmezayxe7x; Owner: -
--

CREATE INDEX "7_FREIGHTS_order_idx" ON p3llodmezayxe7x."7_FREIGHTS" USING btree (nc_order);


--
-- Name: fk_1_CLIENTS_2_CONTACTS_1easb2j_qd; Type: INDEX; Schema: p3llodmezayxe7x; Owner: -
--

CREATE INDEX "fk_1_CLIENTS_2_CONTACTS_1easb2j_qd" ON p3llodmezayxe7x."_nc_m2m_1_CLIENTS_2_CONTACTS" USING btree ("1_CLIENTS_id");


--
-- Name: fk_1_CLIENTS_2_CONTACTS_t3632fe002; Type: INDEX; Schema: p3llodmezayxe7x; Owner: -
--

CREATE INDEX "fk_1_CLIENTS_2_CONTACTS_t3632fe002" ON p3llodmezayxe7x."_nc_m2m_1_CLIENTS_2_CONTACTS" USING btree ("2_CONTACTS_id");


--
-- Name: fk_1_CLIENTS_5_INQUIRIE_p72f2200a1; Type: INDEX; Schema: p3llodmezayxe7x; Owner: -
--

CREATE INDEX "fk_1_CLIENTS_5_INQUIRIE_p72f2200a1" ON p3llodmezayxe7x."_nc_m2m_1_CLIENTS_5_INQUIRIES" USING btree ("1_CLIENTS_id");


--
-- Name: fk_1_CLIENTS_5_INQUIRIE_r875rqfduu; Type: INDEX; Schema: p3llodmezayxe7x; Owner: -
--

CREATE INDEX "fk_1_CLIENTS_5_INQUIRIE_r875rqfduu" ON p3llodmezayxe7x."_nc_m2m_1_CLIENTS_5_INQUIRIES" USING btree ("5_INQUIRIES_id");


--
-- Name: fk_1_CLIENTS_7_FREIGHTS_adkl4c07pw; Type: INDEX; Schema: p3llodmezayxe7x; Owner: -
--

CREATE INDEX "fk_1_CLIENTS_7_FREIGHTS_adkl4c07pw" ON p3llodmezayxe7x."_nc_m2m_1_CLIENTS_7_FREIGHTS" USING btree ("7_FREIGHTS_id");


--
-- Name: fk_1_CLIENTS_7_FREIGHTS_h1thehe7xw; Type: INDEX; Schema: p3llodmezayxe7x; Owner: -
--

CREATE INDEX "fk_1_CLIENTS_7_FREIGHTS_h1thehe7xw" ON p3llodmezayxe7x."_nc_m2m_1_CLIENTS_7_FREIGHTS" USING btree ("1_CLIENTS_id");


--
-- Name: fk_2_CONTACTS_5_INQUIRIE_k1ig14lc1t; Type: INDEX; Schema: p3llodmezayxe7x; Owner: -
--

CREATE INDEX "fk_2_CONTACTS_5_INQUIRIE_k1ig14lc1t" ON p3llodmezayxe7x."_nc_m2m_2_CONTACTS_5_INQUIRIES" USING btree ("5_INQUIRIES_id");


--
-- Name: fk_2_CONTACTS_5_INQUIRIE_nbf4lfez46; Type: INDEX; Schema: p3llodmezayxe7x; Owner: -
--

CREATE INDEX "fk_2_CONTACTS_5_INQUIRIE_nbf4lfez46" ON p3llodmezayxe7x."_nc_m2m_2_CONTACTS_5_INQUIRIES" USING btree ("2_CONTACTS_id");


--
-- Name: fk_3_VEHICLES_4_DRIVERS_7bkqt81k81; Type: INDEX; Schema: p3llodmezayxe7x; Owner: -
--

CREATE INDEX "fk_3_VEHICLES_4_DRIVERS_7bkqt81k81" ON p3llodmezayxe7x."_nc_m2m_3_VEHICLES_4_DRIVERS" USING btree ("3_VEHICLES_id");


--
-- Name: fk_3_VEHICLES_4_DRIVERS_7ret_5e1cf; Type: INDEX; Schema: p3llodmezayxe7x; Owner: -
--

CREATE INDEX "fk_3_VEHICLES_4_DRIVERS_7ret_5e1cf" ON p3llodmezayxe7x."_nc_m2m_3_VEHICLES_4_DRIVERS" USING btree ("4_DRIVERS_id");


--
-- Name: fk_3_VEHICLES_6_TRANSPOR_48xju7mxgv; Type: INDEX; Schema: p3llodmezayxe7x; Owner: -
--

CREATE INDEX "fk_3_VEHICLES_6_TRANSPOR_48xju7mxgv" ON p3llodmezayxe7x."_nc_m2m_3_VEHICLES_6_TRANSPORTS" USING btree ("6_TRANSPORTS_id");


--
-- Name: fk_3_VEHICLES_6_TRANSPOR__qpwprvvtw; Type: INDEX; Schema: p3llodmezayxe7x; Owner: -
--

CREATE INDEX "fk_3_VEHICLES_6_TRANSPOR__qpwprvvtw" ON p3llodmezayxe7x."_nc_m2m_3_VEHICLES_6_TRANSPORTS" USING btree ("3_VEHICLES_id");


--
-- Name: fk_4_DRIVERS_6_TRANSPOR_e_4a_534a6; Type: INDEX; Schema: p3llodmezayxe7x; Owner: -
--

CREATE INDEX "fk_4_DRIVERS_6_TRANSPOR_e_4a_534a6" ON p3llodmezayxe7x."_nc_m2m_4_DRIVERS_6_TRANSPORTS" USING btree ("4_DRIVERS_id");


--
-- Name: fk_4_DRIVERS_6_TRANSPOR_msraiejtb3; Type: INDEX; Schema: p3llodmezayxe7x; Owner: -
--

CREATE INDEX "fk_4_DRIVERS_6_TRANSPOR_msraiejtb3" ON p3llodmezayxe7x."_nc_m2m_4_DRIVERS_6_TRANSPORTS" USING btree ("6_TRANSPORTS_id");


--
-- Name: fk_6_TRANSPOR_7_FREIGHTS_mu4wnnmy7m; Type: INDEX; Schema: p3llodmezayxe7x; Owner: -
--

CREATE INDEX "fk_6_TRANSPOR_7_FREIGHTS_mu4wnnmy7m" ON p3llodmezayxe7x."_nc_m2m_6_TRANSPORTS_7_FREIGHTS" USING btree ("6_TRANSPORTS_id");


--
-- Name: fk_6_TRANSPOR_7_FREIGHTS_xldaocdb5z; Type: INDEX; Schema: p3llodmezayxe7x; Owner: -
--

CREATE INDEX "fk_6_TRANSPOR_7_FREIGHTS_xldaocdb5z" ON p3llodmezayxe7x."_nc_m2m_6_TRANSPORTS_7_FREIGHTS" USING btree ("7_FREIGHTS_id");


--
-- Name: Features_order_idx; Type: INDEX; Schema: ptbstfo5b36htsq; Owner: -
--

CREATE INDEX "Features_order_idx" ON ptbstfo5b36htsq."Features" USING btree (nc_order);


--
-- Name: nc_api_tokens_fk_sso_client_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_api_tokens_fk_sso_client_id_index ON public.nc_api_tokens USING btree (fk_sso_client_id);


--
-- Name: nc_api_tokens_fk_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_api_tokens_fk_user_id_index ON public.nc_api_tokens USING btree (fk_user_id);


--
-- Name: nc_audit_v2_fk_workspace_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_audit_v2_fk_workspace_idx ON public.nc_audit_v2 USING btree (fk_workspace_id);


--
-- Name: nc_audit_v2_old_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_audit_v2_old_id_index ON public.nc_audit_v2 USING btree (old_id);


--
-- Name: nc_audit_v2_tenant_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_audit_v2_tenant_idx ON public.nc_audit_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_automation_executions_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_automation_executions_oldpk_idx ON public.nc_automation_executions USING btree (id);


--
-- Name: nc_automation_executions_resume_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_automation_executions_resume_idx ON public.nc_automation_executions USING btree (fk_workspace_id, base_id, resume_at);


--
-- Name: nc_automations_context_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_automations_context_idx ON public.nc_automations USING btree (base_id, fk_workspace_id);


--
-- Name: nc_automations_enabled_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_automations_enabled_idx ON public.nc_automations USING btree (enabled);


--
-- Name: nc_automations_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_automations_oldpk_idx ON public.nc_automations USING btree (id);


--
-- Name: nc_automations_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_automations_order_idx ON public.nc_automations USING btree (base_id, "order");


--
-- Name: nc_automations_type_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_automations_type_idx ON public.nc_automations USING btree (type);


--
-- Name: nc_base_users_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_base_users_v2_base_id_fk_workspace_id_index ON public.nc_base_users_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_base_users_v2_invited_by_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_base_users_v2_invited_by_index ON public.nc_base_users_v2 USING btree (invited_by);


--
-- Name: nc_bases_sandbox_auto_update_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_bases_sandbox_auto_update_idx ON public.nc_bases_v2 USING btree (sandbox_id, auto_update);


--
-- Name: nc_bases_sandbox_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_bases_sandbox_id_idx ON public.nc_bases_v2 USING btree (sandbox_id);


--
-- Name: nc_bases_sandbox_master_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_bases_sandbox_master_idx ON public.nc_bases_v2 USING btree (sandbox_master);


--
-- Name: nc_bases_sandbox_version_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_bases_sandbox_version_id_idx ON public.nc_bases_v2 USING btree (sandbox_version_id);


--
-- Name: nc_bases_v2_fk_custom_url_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_bases_v2_fk_custom_url_id_index ON public.nc_bases_v2 USING btree (fk_custom_url_id);


--
-- Name: nc_bases_v2_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_bases_v2_fk_workspace_id_index ON public.nc_bases_v2 USING btree (fk_workspace_id);


--
-- Name: nc_calendar_view_columns_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_calendar_view_columns_v2_base_id_fk_workspace_id_index ON public.nc_calendar_view_columns_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_calendar_view_columns_v2_fk_view_id_fk_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_calendar_view_columns_v2_fk_view_id_fk_column_id_index ON public.nc_calendar_view_columns_v2 USING btree (fk_view_id, fk_column_id);


--
-- Name: nc_calendar_view_columns_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_calendar_view_columns_v2_oldpk_idx ON public.nc_calendar_view_columns_v2 USING btree (id);


--
-- Name: nc_calendar_view_range_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_calendar_view_range_v2_base_id_fk_workspace_id_index ON public.nc_calendar_view_range_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_calendar_view_range_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_calendar_view_range_v2_oldpk_idx ON public.nc_calendar_view_range_v2 USING btree (id);


--
-- Name: nc_calendar_view_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_calendar_view_v2_base_id_fk_workspace_id_index ON public.nc_calendar_view_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_calendar_view_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_calendar_view_v2_oldpk_idx ON public.nc_calendar_view_v2 USING btree (fk_view_id);


--
-- Name: nc_col_barcode_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_barcode_v2_base_id_fk_workspace_id_index ON public.nc_col_barcode_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_col_barcode_v2_fk_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_barcode_v2_fk_column_id_index ON public.nc_col_barcode_v2 USING btree (fk_column_id);


--
-- Name: nc_col_barcode_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_barcode_v2_oldpk_idx ON public.nc_col_barcode_v2 USING btree (id);


--
-- Name: nc_col_button_context; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_button_context ON public.nc_col_button_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_col_button_v2_fk_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_button_v2_fk_column_id_index ON public.nc_col_button_v2 USING btree (fk_column_id);


--
-- Name: nc_col_button_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_button_v2_oldpk_idx ON public.nc_col_button_v2 USING btree (id);


--
-- Name: nc_col_formula_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_formula_v2_base_id_fk_workspace_id_index ON public.nc_col_formula_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_col_formula_v2_fk_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_formula_v2_fk_column_id_index ON public.nc_col_formula_v2 USING btree (fk_column_id);


--
-- Name: nc_col_formula_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_formula_v2_oldpk_idx ON public.nc_col_formula_v2 USING btree (id);


--
-- Name: nc_col_long_text_context; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_long_text_context ON public.nc_col_long_text_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_col_long_text_v2_fk_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_long_text_v2_fk_column_id_index ON public.nc_col_long_text_v2 USING btree (fk_column_id);


--
-- Name: nc_col_long_text_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_long_text_v2_oldpk_idx ON public.nc_col_long_text_v2 USING btree (id);


--
-- Name: nc_col_lookup_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_lookup_v2_base_id_fk_workspace_id_index ON public.nc_col_lookup_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_col_lookup_v2_fk_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_lookup_v2_fk_column_id_index ON public.nc_col_lookup_v2 USING btree (fk_column_id);


--
-- Name: nc_col_lookup_v2_fk_lookup_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_lookup_v2_fk_lookup_column_id_index ON public.nc_col_lookup_v2 USING btree (fk_lookup_column_id);


--
-- Name: nc_col_lookup_v2_fk_relation_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_lookup_v2_fk_relation_column_id_index ON public.nc_col_lookup_v2 USING btree (fk_relation_column_id);


--
-- Name: nc_col_lookup_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_lookup_v2_oldpk_idx ON public.nc_col_lookup_v2 USING btree (id);


--
-- Name: nc_col_qrcode_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_qrcode_v2_base_id_fk_workspace_id_index ON public.nc_col_qrcode_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_col_qrcode_v2_fk_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_qrcode_v2_fk_column_id_index ON public.nc_col_qrcode_v2 USING btree (fk_column_id);


--
-- Name: nc_col_qrcode_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_qrcode_v2_oldpk_idx ON public.nc_col_qrcode_v2 USING btree (id);


--
-- Name: nc_col_relations_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_relations_v2_base_id_fk_workspace_id_index ON public.nc_col_relations_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_col_relations_v2_fk_child_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_relations_v2_fk_child_column_id_index ON public.nc_col_relations_v2 USING btree (fk_child_column_id);


--
-- Name: nc_col_relations_v2_fk_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_relations_v2_fk_column_id_index ON public.nc_col_relations_v2 USING btree (fk_column_id);


--
-- Name: nc_col_relations_v2_fk_mm_child_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_relations_v2_fk_mm_child_column_id_index ON public.nc_col_relations_v2 USING btree (fk_mm_child_column_id);


--
-- Name: nc_col_relations_v2_fk_mm_model_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_relations_v2_fk_mm_model_id_index ON public.nc_col_relations_v2 USING btree (fk_mm_model_id);


--
-- Name: nc_col_relations_v2_fk_mm_parent_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_relations_v2_fk_mm_parent_column_id_index ON public.nc_col_relations_v2 USING btree (fk_mm_parent_column_id);


--
-- Name: nc_col_relations_v2_fk_parent_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_relations_v2_fk_parent_column_id_index ON public.nc_col_relations_v2 USING btree (fk_parent_column_id);


--
-- Name: nc_col_relations_v2_fk_related_model_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_relations_v2_fk_related_model_id_index ON public.nc_col_relations_v2 USING btree (fk_related_model_id);


--
-- Name: nc_col_relations_v2_fk_target_view_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_relations_v2_fk_target_view_id_index ON public.nc_col_relations_v2 USING btree (fk_target_view_id);


--
-- Name: nc_col_relations_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_relations_v2_oldpk_idx ON public.nc_col_relations_v2 USING btree (id);


--
-- Name: nc_col_rollup_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_rollup_v2_base_id_fk_workspace_id_index ON public.nc_col_rollup_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_col_rollup_v2_fk_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_rollup_v2_fk_column_id_index ON public.nc_col_rollup_v2 USING btree (fk_column_id);


--
-- Name: nc_col_rollup_v2_fk_relation_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_rollup_v2_fk_relation_column_id_index ON public.nc_col_rollup_v2 USING btree (fk_relation_column_id);


--
-- Name: nc_col_rollup_v2_fk_rollup_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_rollup_v2_fk_rollup_column_id_index ON public.nc_col_rollup_v2 USING btree (fk_rollup_column_id);


--
-- Name: nc_col_rollup_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_rollup_v2_oldpk_idx ON public.nc_col_rollup_v2 USING btree (id);


--
-- Name: nc_col_select_options_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_select_options_v2_base_id_fk_workspace_id_index ON public.nc_col_select_options_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_col_select_options_v2_fk_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_select_options_v2_fk_column_id_index ON public.nc_col_select_options_v2 USING btree (fk_column_id);


--
-- Name: nc_col_select_options_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_col_select_options_v2_oldpk_idx ON public.nc_col_select_options_v2 USING btree (id);


--
-- Name: nc_columns_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_columns_v2_base_id_fk_workspace_id_index ON public.nc_columns_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_columns_v2_fk_model_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_columns_v2_fk_model_id_index ON public.nc_columns_v2 USING btree (fk_model_id);


--
-- Name: nc_columns_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_columns_v2_oldpk_idx ON public.nc_columns_v2 USING btree (id);


--
-- Name: nc_comment_reactions_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_comment_reactions_base_id_fk_workspace_id_index ON public.nc_comment_reactions USING btree (base_id, fk_workspace_id);


--
-- Name: nc_comment_reactions_comment_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_comment_reactions_comment_id_index ON public.nc_comment_reactions USING btree (comment_id);


--
-- Name: nc_comment_reactions_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_comment_reactions_oldpk_idx ON public.nc_comment_reactions USING btree (id);


--
-- Name: nc_comment_reactions_row_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_comment_reactions_row_id_index ON public.nc_comment_reactions USING btree (row_id);


--
-- Name: nc_comments_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_comments_base_id_fk_workspace_id_index ON public.nc_comments USING btree (base_id, fk_workspace_id);


--
-- Name: nc_comments_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_comments_oldpk_idx ON public.nc_comments USING btree (id);


--
-- Name: nc_comments_row_id_fk_model_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_comments_row_id_fk_model_id_index ON public.nc_comments USING btree (row_id, fk_model_id);


--
-- Name: nc_custom_urls_context; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_custom_urls_context ON public.nc_custom_urls_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_custom_urls_v2_custom_path_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_custom_urls_v2_custom_path_index ON public.nc_custom_urls_v2 USING btree (custom_path);


--
-- Name: nc_custom_urls_v2_fk_dashboard_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_custom_urls_v2_fk_dashboard_id_index ON public.nc_custom_urls_v2 USING btree (fk_dashboard_id);


--
-- Name: nc_custom_urls_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_custom_urls_v2_oldpk_idx ON public.nc_custom_urls_v2 USING btree (id);


--
-- Name: nc_dashboards_context; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_dashboards_context ON public.nc_dashboards_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_dashboards_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_dashboards_v2_oldpk_idx ON public.nc_dashboards_v2 USING btree (id);


--
-- Name: nc_data_reflection_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_data_reflection_fk_workspace_id_index ON public.nc_data_reflection USING btree (fk_workspace_id);


--
-- Name: nc_dependency_tracker_context_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_dependency_tracker_context_idx ON public.nc_dependency_tracker USING btree (base_id, fk_workspace_id);


--
-- Name: nc_dependency_tracker_dependent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_dependency_tracker_dependent_idx ON public.nc_dependency_tracker USING btree (dependent_type, dependent_id);


--
-- Name: nc_dependency_tracker_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_dependency_tracker_oldpk_idx ON public.nc_dependency_tracker USING btree (id);


--
-- Name: nc_dependency_tracker_queryable_field_0_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_dependency_tracker_queryable_field_0_idx ON public.nc_dependency_tracker USING btree (queryable_field_0);


--
-- Name: nc_dependency_tracker_queryable_field_1_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_dependency_tracker_queryable_field_1_idx ON public.nc_dependency_tracker USING btree (queryable_field_1);


--
-- Name: nc_dependency_tracker_queryable_field_2_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_dependency_tracker_queryable_field_2_idx ON public.nc_dependency_tracker USING btree (queryable_field_2);


--
-- Name: nc_dependency_tracker_source_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_dependency_tracker_source_idx ON public.nc_dependency_tracker USING btree (source_type, source_id);


--
-- Name: nc_disabled_models_for_role_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_disabled_models_for_role_v2_base_id_fk_workspace_id_index ON public.nc_disabled_models_for_role_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_disabled_models_for_role_v2_fk_view_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_disabled_models_for_role_v2_fk_view_id_index ON public.nc_disabled_models_for_role_v2 USING btree (fk_view_id);


--
-- Name: nc_disabled_models_for_role_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_disabled_models_for_role_v2_oldpk_idx ON public.nc_disabled_models_for_role_v2 USING btree (id);


--
-- Name: nc_extensions_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_extensions_base_id_fk_workspace_id_index ON public.nc_extensions USING btree (base_id, fk_workspace_id);


--
-- Name: nc_extensions_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_extensions_oldpk_idx ON public.nc_extensions USING btree (id);


--
-- Name: nc_filter_exp_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_filter_exp_v2_base_id_fk_workspace_id_index ON public.nc_filter_exp_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_filter_exp_v2_fk_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_filter_exp_v2_fk_column_id_index ON public.nc_filter_exp_v2 USING btree (fk_column_id);


--
-- Name: nc_filter_exp_v2_fk_hook_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_filter_exp_v2_fk_hook_id_index ON public.nc_filter_exp_v2 USING btree (fk_hook_id);


--
-- Name: nc_filter_exp_v2_fk_link_col_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_filter_exp_v2_fk_link_col_id_index ON public.nc_filter_exp_v2 USING btree (fk_link_col_id);


--
-- Name: nc_filter_exp_v2_fk_parent_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_filter_exp_v2_fk_parent_column_id_index ON public.nc_filter_exp_v2 USING btree (fk_parent_column_id);


--
-- Name: nc_filter_exp_v2_fk_parent_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_filter_exp_v2_fk_parent_id_index ON public.nc_filter_exp_v2 USING btree (fk_parent_id);


--
-- Name: nc_filter_exp_v2_fk_value_col_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_filter_exp_v2_fk_value_col_id_index ON public.nc_filter_exp_v2 USING btree (fk_value_col_id);


--
-- Name: nc_filter_exp_v2_fk_view_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_filter_exp_v2_fk_view_id_index ON public.nc_filter_exp_v2 USING btree (fk_view_id);


--
-- Name: nc_filter_exp_v2_fk_widget_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_filter_exp_v2_fk_widget_id_index ON public.nc_filter_exp_v2 USING btree (fk_widget_id);


--
-- Name: nc_filter_exp_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_filter_exp_v2_oldpk_idx ON public.nc_filter_exp_v2 USING btree (id);


--
-- Name: nc_follower_fk_follower_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_follower_fk_follower_id_index ON public.nc_follower USING btree (fk_follower_id);


--
-- Name: nc_follower_fk_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_follower_fk_user_id_index ON public.nc_follower USING btree (fk_user_id);


--
-- Name: nc_form_view_columns_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_form_view_columns_v2_base_id_fk_workspace_id_index ON public.nc_form_view_columns_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_form_view_columns_v2_fk_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_form_view_columns_v2_fk_column_id_index ON public.nc_form_view_columns_v2 USING btree (fk_column_id);


--
-- Name: nc_form_view_columns_v2_fk_view_id_fk_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_form_view_columns_v2_fk_view_id_fk_column_id_index ON public.nc_form_view_columns_v2 USING btree (fk_view_id, fk_column_id);


--
-- Name: nc_form_view_columns_v2_fk_view_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_form_view_columns_v2_fk_view_id_index ON public.nc_form_view_columns_v2 USING btree (fk_view_id);


--
-- Name: nc_form_view_columns_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_form_view_columns_v2_oldpk_idx ON public.nc_form_view_columns_v2 USING btree (id);


--
-- Name: nc_form_view_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_form_view_v2_base_id_fk_workspace_id_index ON public.nc_form_view_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_form_view_v2_fk_view_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_form_view_v2_fk_view_id_index ON public.nc_form_view_v2 USING btree (fk_view_id);


--
-- Name: nc_form_view_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_form_view_v2_oldpk_idx ON public.nc_form_view_v2 USING btree (fk_view_id);


--
-- Name: nc_fr_context; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_fr_context ON public.nc_file_references USING btree (base_id, fk_workspace_id);


--
-- Name: nc_gallery_view_columns_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_gallery_view_columns_v2_base_id_fk_workspace_id_index ON public.nc_gallery_view_columns_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_gallery_view_columns_v2_fk_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_gallery_view_columns_v2_fk_column_id_index ON public.nc_gallery_view_columns_v2 USING btree (fk_column_id);


--
-- Name: nc_gallery_view_columns_v2_fk_view_id_fk_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_gallery_view_columns_v2_fk_view_id_fk_column_id_index ON public.nc_gallery_view_columns_v2 USING btree (fk_view_id, fk_column_id);


--
-- Name: nc_gallery_view_columns_v2_fk_view_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_gallery_view_columns_v2_fk_view_id_index ON public.nc_gallery_view_columns_v2 USING btree (fk_view_id);


--
-- Name: nc_gallery_view_columns_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_gallery_view_columns_v2_oldpk_idx ON public.nc_gallery_view_columns_v2 USING btree (id);


--
-- Name: nc_gallery_view_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_gallery_view_v2_base_id_fk_workspace_id_index ON public.nc_gallery_view_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_gallery_view_v2_fk_view_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_gallery_view_v2_fk_view_id_index ON public.nc_gallery_view_v2 USING btree (fk_view_id);


--
-- Name: nc_gallery_view_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_gallery_view_v2_oldpk_idx ON public.nc_gallery_view_v2 USING btree (fk_view_id);


--
-- Name: nc_grid_view_columns_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_grid_view_columns_v2_base_id_fk_workspace_id_index ON public.nc_grid_view_columns_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_grid_view_columns_v2_fk_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_grid_view_columns_v2_fk_column_id_index ON public.nc_grid_view_columns_v2 USING btree (fk_column_id);


--
-- Name: nc_grid_view_columns_v2_fk_view_id_fk_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_grid_view_columns_v2_fk_view_id_fk_column_id_index ON public.nc_grid_view_columns_v2 USING btree (fk_view_id, fk_column_id);


--
-- Name: nc_grid_view_columns_v2_fk_view_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_grid_view_columns_v2_fk_view_id_index ON public.nc_grid_view_columns_v2 USING btree (fk_view_id);


--
-- Name: nc_grid_view_columns_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_grid_view_columns_v2_oldpk_idx ON public.nc_grid_view_columns_v2 USING btree (id);


--
-- Name: nc_grid_view_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_grid_view_v2_base_id_fk_workspace_id_index ON public.nc_grid_view_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_grid_view_v2_fk_view_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_grid_view_v2_fk_view_id_index ON public.nc_grid_view_v2 USING btree (fk_view_id);


--
-- Name: nc_grid_view_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_grid_view_v2_oldpk_idx ON public.nc_grid_view_v2 USING btree (fk_view_id);


--
-- Name: nc_hook_logs_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_hook_logs_v2_base_id_fk_workspace_id_index ON public.nc_hook_logs_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_hook_logs_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_hook_logs_v2_oldpk_idx ON public.nc_hook_logs_v2 USING btree (id);


--
-- Name: nc_hooks_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_hooks_v2_base_id_fk_workspace_id_index ON public.nc_hooks_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_hooks_v2_fk_model_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_hooks_v2_fk_model_id_index ON public.nc_hooks_v2 USING btree (fk_model_id);


--
-- Name: nc_hooks_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_hooks_v2_oldpk_idx ON public.nc_hooks_v2 USING btree (id);


--
-- Name: nc_installations_license_key_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_installations_license_key_idx ON public.nc_installations USING btree (license_key);


--
-- Name: nc_integrations_store_v2_fk_integration_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_integrations_store_v2_fk_integration_id_index ON public.nc_integrations_store_v2 USING btree (fk_integration_id);


--
-- Name: nc_integrations_v2_created_by_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_integrations_v2_created_by_index ON public.nc_integrations_v2 USING btree (created_by);


--
-- Name: nc_integrations_v2_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_integrations_v2_fk_workspace_id_index ON public.nc_integrations_v2 USING btree (fk_workspace_id);


--
-- Name: nc_integrations_v2_type_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_integrations_v2_type_index ON public.nc_integrations_v2 USING btree (type);


--
-- Name: nc_jobs_context; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_jobs_context ON public.nc_jobs USING btree (base_id, fk_workspace_id);


--
-- Name: nc_kanban_view_columns_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_kanban_view_columns_v2_base_id_fk_workspace_id_index ON public.nc_kanban_view_columns_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_kanban_view_columns_v2_fk_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_kanban_view_columns_v2_fk_column_id_index ON public.nc_kanban_view_columns_v2 USING btree (fk_column_id);


--
-- Name: nc_kanban_view_columns_v2_fk_view_id_fk_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_kanban_view_columns_v2_fk_view_id_fk_column_id_index ON public.nc_kanban_view_columns_v2 USING btree (fk_view_id, fk_column_id);


--
-- Name: nc_kanban_view_columns_v2_fk_view_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_kanban_view_columns_v2_fk_view_id_index ON public.nc_kanban_view_columns_v2 USING btree (fk_view_id);


--
-- Name: nc_kanban_view_columns_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_kanban_view_columns_v2_oldpk_idx ON public.nc_kanban_view_columns_v2 USING btree (id);


--
-- Name: nc_kanban_view_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_kanban_view_v2_base_id_fk_workspace_id_index ON public.nc_kanban_view_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_kanban_view_v2_fk_grp_col_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_kanban_view_v2_fk_grp_col_id_index ON public.nc_kanban_view_v2 USING btree (fk_grp_col_id);


--
-- Name: nc_kanban_view_v2_fk_view_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_kanban_view_v2_fk_view_id_index ON public.nc_kanban_view_v2 USING btree (fk_view_id);


--
-- Name: nc_kanban_view_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_kanban_view_v2_oldpk_idx ON public.nc_kanban_view_v2 USING btree (fk_view_id);


--
-- Name: nc_map_view_columns_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_map_view_columns_v2_base_id_fk_workspace_id_index ON public.nc_map_view_columns_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_map_view_columns_v2_fk_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_map_view_columns_v2_fk_column_id_index ON public.nc_map_view_columns_v2 USING btree (fk_column_id);


--
-- Name: nc_map_view_columns_v2_fk_view_id_fk_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_map_view_columns_v2_fk_view_id_fk_column_id_index ON public.nc_map_view_columns_v2 USING btree (fk_view_id, fk_column_id);


--
-- Name: nc_map_view_columns_v2_fk_view_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_map_view_columns_v2_fk_view_id_index ON public.nc_map_view_columns_v2 USING btree (fk_view_id);


--
-- Name: nc_map_view_columns_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_map_view_columns_v2_oldpk_idx ON public.nc_map_view_columns_v2 USING btree (id);


--
-- Name: nc_map_view_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_map_view_v2_base_id_fk_workspace_id_index ON public.nc_map_view_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_map_view_v2_fk_geo_data_col_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_map_view_v2_fk_geo_data_col_id_index ON public.nc_map_view_v2 USING btree (fk_geo_data_col_id);


--
-- Name: nc_map_view_v2_fk_view_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_map_view_v2_fk_view_id_index ON public.nc_map_view_v2 USING btree (fk_view_id);


--
-- Name: nc_map_view_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_map_view_v2_oldpk_idx ON public.nc_map_view_v2 USING btree (fk_view_id);


--
-- Name: nc_mc_tokens_context; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_mc_tokens_context ON public.nc_mcp_tokens USING btree (base_id, fk_workspace_id);


--
-- Name: nc_mcp_tokens_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_mcp_tokens_oldpk_idx ON public.nc_mcp_tokens USING btree (id);


--
-- Name: nc_model_stats_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_model_stats_v2_base_id_fk_workspace_id_index ON public.nc_model_stats_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_model_stats_v2_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_model_stats_v2_fk_workspace_id_index ON public.nc_model_stats_v2 USING btree (fk_workspace_id);


--
-- Name: nc_model_stats_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_model_stats_v2_oldpk_idx ON public.nc_model_stats_v2 USING btree (fk_workspace_id, fk_model_id);


--
-- Name: nc_models_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_models_v2_base_id_fk_workspace_id_index ON public.nc_models_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_models_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_models_v2_oldpk_idx ON public.nc_models_v2 USING btree (id);


--
-- Name: nc_models_v2_source_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_models_v2_source_id_index ON public.nc_models_v2 USING btree (source_id);


--
-- Name: nc_models_v2_type_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_models_v2_type_index ON public.nc_models_v2 USING btree (type);


--
-- Name: nc_models_v2_uuid_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_models_v2_uuid_index ON public.nc_models_v2 USING btree (uuid);


--
-- Name: nc_oauth_authorization_codes_code_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_oauth_authorization_codes_code_index ON public.nc_oauth_authorization_codes USING btree (code);


--
-- Name: nc_oauth_authorization_codes_expires_at_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_oauth_authorization_codes_expires_at_index ON public.nc_oauth_authorization_codes USING btree (expires_at);


--
-- Name: nc_oauth_authorization_codes_fk_client_id_fk_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_oauth_authorization_codes_fk_client_id_fk_user_id_index ON public.nc_oauth_authorization_codes USING btree (fk_client_id, fk_user_id);


--
-- Name: nc_oauth_authorization_codes_fk_client_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_oauth_authorization_codes_fk_client_id_index ON public.nc_oauth_authorization_codes USING btree (fk_client_id);


--
-- Name: nc_oauth_authorization_codes_fk_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_oauth_authorization_codes_fk_user_id_index ON public.nc_oauth_authorization_codes USING btree (fk_user_id);


--
-- Name: nc_oauth_authorization_codes_is_used_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_oauth_authorization_codes_is_used_index ON public.nc_oauth_authorization_codes USING btree (is_used);


--
-- Name: nc_oauth_clients_fk_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_oauth_clients_fk_user_id_index ON public.nc_oauth_clients USING btree (fk_user_id);


--
-- Name: nc_oauth_tokens_access_token_expires_at_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_oauth_tokens_access_token_expires_at_index ON public.nc_oauth_tokens USING btree (access_token_expires_at);


--
-- Name: nc_oauth_tokens_access_token_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_oauth_tokens_access_token_index ON public.nc_oauth_tokens USING btree (access_token);


--
-- Name: nc_oauth_tokens_fk_client_id_fk_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_oauth_tokens_fk_client_id_fk_user_id_index ON public.nc_oauth_tokens USING btree (fk_client_id, fk_user_id);


--
-- Name: nc_oauth_tokens_fk_client_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_oauth_tokens_fk_client_id_index ON public.nc_oauth_tokens USING btree (fk_client_id);


--
-- Name: nc_oauth_tokens_fk_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_oauth_tokens_fk_user_id_index ON public.nc_oauth_tokens USING btree (fk_user_id);


--
-- Name: nc_oauth_tokens_is_revoked_access_token_expires_at_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_oauth_tokens_is_revoked_access_token_expires_at_index ON public.nc_oauth_tokens USING btree (is_revoked, access_token_expires_at);


--
-- Name: nc_oauth_tokens_is_revoked_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_oauth_tokens_is_revoked_index ON public.nc_oauth_tokens USING btree (is_revoked);


--
-- Name: nc_oauth_tokens_last_used_at_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_oauth_tokens_last_used_at_index ON public.nc_oauth_tokens USING btree (last_used_at);


--
-- Name: nc_oauth_tokens_refresh_token_expires_at_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_oauth_tokens_refresh_token_expires_at_index ON public.nc_oauth_tokens USING btree (refresh_token_expires_at);


--
-- Name: nc_oauth_tokens_refresh_token_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_oauth_tokens_refresh_token_index ON public.nc_oauth_tokens USING btree (refresh_token);


--
-- Name: nc_org_domain_domain_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_org_domain_domain_index ON public.nc_org_domain USING btree (domain);


--
-- Name: nc_org_domain_fk_org_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_org_domain_fk_org_id_index ON public.nc_org_domain USING btree (fk_org_id);


--
-- Name: nc_org_domain_fk_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_org_domain_fk_user_id_index ON public.nc_org_domain USING btree (fk_user_id);


--
-- Name: nc_org_fk_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_org_fk_user_id_index ON public.nc_org USING btree (fk_user_id);


--
-- Name: nc_org_slug_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_org_slug_index ON public.nc_org USING btree (slug);


--
-- Name: nc_permission_subjects_context; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_permission_subjects_context ON public.nc_permission_subjects USING btree (fk_workspace_id, base_id);


--
-- Name: nc_permission_subjects_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_permission_subjects_oldpk_idx ON public.nc_permission_subjects USING btree (fk_permission_id, subject_type, subject_id);


--
-- Name: nc_permissions_context; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_permissions_context ON public.nc_permissions USING btree (base_id, fk_workspace_id);


--
-- Name: nc_permissions_entity; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_permissions_entity ON public.nc_permissions USING btree (entity, entity_id, permission);


--
-- Name: nc_permissions_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_permissions_oldpk_idx ON public.nc_permissions USING btree (id);


--
-- Name: nc_plans_stripe_product_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_plans_stripe_product_idx ON public.nc_plans USING btree (stripe_product_id);


--
-- Name: nc_principal_assignments_principal_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_principal_assignments_principal_idx ON public.nc_principal_assignments USING btree (principal_type, principal_ref_id);


--
-- Name: nc_principal_assignments_principal_resource_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_principal_assignments_principal_resource_idx ON public.nc_principal_assignments USING btree (principal_type, principal_ref_id, resource_type);


--
-- Name: nc_principal_assignments_resource_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_principal_assignments_resource_idx ON public.nc_principal_assignments USING btree (resource_type, resource_id);


--
-- Name: nc_principal_assignments_resource_principal_type_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_principal_assignments_resource_principal_type_idx ON public.nc_principal_assignments USING btree (resource_type, resource_id, principal_type);


--
-- Name: nc_project_users_v2_fk_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_project_users_v2_fk_user_id_index ON public.nc_base_users_v2 USING btree (fk_user_id);


--
-- Name: nc_record_audit_v2_tenant_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_record_audit_v2_tenant_idx ON public.nc_audit_v2 USING btree (base_id, fk_model_id, row_id, fk_workspace_id);


--
-- Name: nc_row_color_conditions_fk_view_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_row_color_conditions_fk_view_id_index ON public.nc_row_color_conditions USING btree (fk_view_id);


--
-- Name: nc_row_color_conditions_fk_workspace_id_base_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_row_color_conditions_fk_workspace_id_base_id_index ON public.nc_row_color_conditions USING btree (fk_workspace_id, base_id);


--
-- Name: nc_row_color_conditions_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_row_color_conditions_oldpk_idx ON public.nc_row_color_conditions USING btree (id);


--
-- Name: nc_sandbox_deployment_logs_base_created_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sandbox_deployment_logs_base_created_idx ON public.nc_sandbox_deployment_logs USING btree (base_id, created_at);


--
-- Name: nc_sandbox_deployment_logs_base_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sandbox_deployment_logs_base_id_idx ON public.nc_sandbox_deployment_logs USING btree (base_id);


--
-- Name: nc_sandbox_deployment_logs_from_version_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sandbox_deployment_logs_from_version_idx ON public.nc_sandbox_deployment_logs USING btree (from_version_id);


--
-- Name: nc_sandbox_deployment_logs_sandbox_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sandbox_deployment_logs_sandbox_id_idx ON public.nc_sandbox_deployment_logs USING btree (fk_sandbox_id);


--
-- Name: nc_sandbox_deployment_logs_status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sandbox_deployment_logs_status_idx ON public.nc_sandbox_deployment_logs USING btree (status);


--
-- Name: nc_sandbox_deployment_logs_to_version_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sandbox_deployment_logs_to_version_idx ON public.nc_sandbox_deployment_logs USING btree (to_version_id);


--
-- Name: nc_sandbox_deployment_logs_workspace_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sandbox_deployment_logs_workspace_id_idx ON public.nc_sandbox_deployment_logs USING btree (fk_workspace_id);


--
-- Name: nc_sandbox_versions_ordering_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sandbox_versions_ordering_idx ON public.nc_sandbox_versions USING btree (fk_sandbox_id, version_number);


--
-- Name: nc_sandbox_versions_sandbox_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sandbox_versions_sandbox_id_idx ON public.nc_sandbox_versions USING btree (fk_sandbox_id);


--
-- Name: nc_sandbox_versions_status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sandbox_versions_status_idx ON public.nc_sandbox_versions USING btree (fk_sandbox_id, status);


--
-- Name: nc_sandbox_versions_workspace_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sandbox_versions_workspace_id_idx ON public.nc_sandbox_versions USING btree (fk_workspace_id);


--
-- Name: nc_sandboxes_base_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sandboxes_base_id_idx ON public.nc_sandboxes USING btree (base_id);


--
-- Name: nc_sandboxes_category_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sandboxes_category_idx ON public.nc_sandboxes USING btree (category);


--
-- Name: nc_sandboxes_created_by_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sandboxes_created_by_idx ON public.nc_sandboxes USING btree (created_by);


--
-- Name: nc_sandboxes_deleted_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sandboxes_deleted_idx ON public.nc_sandboxes USING btree (deleted);


--
-- Name: nc_sandboxes_visibility_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sandboxes_visibility_idx ON public.nc_sandboxes USING btree (visibility);


--
-- Name: nc_sandboxes_workspace_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sandboxes_workspace_id_idx ON public.nc_sandboxes USING btree (fk_workspace_id);


--
-- Name: nc_scripts_context; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_scripts_context ON public.nc_scripts USING btree (base_id, fk_workspace_id);


--
-- Name: nc_scripts_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_scripts_oldpk_idx ON public.nc_scripts USING btree (id);


--
-- Name: nc_snapshot_context; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_snapshot_context ON public.nc_snapshots USING btree (base_id, fk_workspace_id);


--
-- Name: nc_sort_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sort_v2_base_id_fk_workspace_id_index ON public.nc_sort_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_sort_v2_fk_column_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sort_v2_fk_column_id_index ON public.nc_sort_v2 USING btree (fk_column_id);


--
-- Name: nc_sort_v2_fk_view_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sort_v2_fk_view_id_index ON public.nc_sort_v2 USING btree (fk_view_id);


--
-- Name: nc_sort_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sort_v2_oldpk_idx ON public.nc_sort_v2 USING btree (id);


--
-- Name: nc_source_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_source_v2_base_id_fk_workspace_id_index ON public.nc_sources_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_source_v2_fk_integration_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_source_v2_fk_integration_id_index ON public.nc_sources_v2 USING btree (fk_integration_id);


--
-- Name: nc_source_v2_fk_sql_executor_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_source_v2_fk_sql_executor_id_index ON public.nc_sources_v2 USING btree (fk_sql_executor_id);


--
-- Name: nc_sources_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sources_v2_oldpk_idx ON public.nc_sources_v2 USING btree (id);


--
-- Name: nc_sso_client_domain_name_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sso_client_domain_name_index ON public.nc_sso_client USING btree (domain_name);


--
-- Name: nc_sso_client_fk_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sso_client_fk_user_id_index ON public.nc_sso_client USING btree (fk_user_id);


--
-- Name: nc_sso_client_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sso_client_fk_workspace_id_index ON public.nc_sso_client USING btree (fk_org_id);


--
-- Name: nc_store_key_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_store_key_index ON public.nc_store USING btree (key);


--
-- Name: nc_subscriptions_org_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_subscriptions_org_idx ON public.nc_subscriptions USING btree (fk_org_id);


--
-- Name: nc_subscriptions_stripe_subscription_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_subscriptions_stripe_subscription_idx ON public.nc_subscriptions USING btree (stripe_subscription_id);


--
-- Name: nc_subscriptions_ws_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_subscriptions_ws_idx ON public.nc_subscriptions USING btree (fk_workspace_id);


--
-- Name: nc_sync_configs_context; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sync_configs_context ON public.nc_sync_configs USING btree (base_id, fk_workspace_id);


--
-- Name: nc_sync_configs_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sync_configs_oldpk_idx ON public.nc_sync_configs USING btree (id);


--
-- Name: nc_sync_configs_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sync_configs_parent_idx ON public.nc_sync_configs USING btree (fk_parent_sync_config_id);


--
-- Name: nc_sync_logs_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sync_logs_v2_base_id_fk_workspace_id_index ON public.nc_sync_logs_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_sync_logs_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sync_logs_v2_oldpk_idx ON public.nc_sync_logs_v2 USING btree (id);


--
-- Name: nc_sync_mappings_context; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sync_mappings_context ON public.nc_sync_mappings USING btree (base_id, fk_workspace_id);


--
-- Name: nc_sync_mappings_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sync_mappings_oldpk_idx ON public.nc_sync_mappings USING btree (id);


--
-- Name: nc_sync_mappings_sync_config_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sync_mappings_sync_config_idx ON public.nc_sync_mappings USING btree (fk_sync_config_id);


--
-- Name: nc_sync_source_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sync_source_v2_base_id_fk_workspace_id_index ON public.nc_sync_source_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_sync_source_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sync_source_v2_oldpk_idx ON public.nc_sync_source_v2 USING btree (id);


--
-- Name: nc_sync_source_v2_source_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_sync_source_v2_source_id_index ON public.nc_sync_source_v2 USING btree (source_id);


--
-- Name: nc_teams_created_by_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_teams_created_by_idx ON public.nc_teams USING btree (created_by);


--
-- Name: nc_teams_org_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_teams_org_idx ON public.nc_teams USING btree (fk_org_id);


--
-- Name: nc_teams_workspace_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_teams_workspace_idx ON public.nc_teams USING btree (fk_workspace_id);


--
-- Name: nc_usage_stats_ws_period_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_usage_stats_ws_period_idx ON public.nc_usage_stats USING btree (fk_workspace_id, period_start);


--
-- Name: nc_user_comment_notifications_preference_base_id_fk_workspace_i; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_user_comment_notifications_preference_base_id_fk_workspace_i ON public.nc_user_comment_notifications_preference USING btree (base_id, fk_workspace_id);


--
-- Name: nc_user_refresh_tokens_expires_at_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_user_refresh_tokens_expires_at_index ON public.nc_user_refresh_tokens USING btree (expires_at);


--
-- Name: nc_user_refresh_tokens_fk_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_user_refresh_tokens_fk_user_id_index ON public.nc_user_refresh_tokens USING btree (fk_user_id);


--
-- Name: nc_user_refresh_tokens_token_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_user_refresh_tokens_token_index ON public.nc_user_refresh_tokens USING btree (token);


--
-- Name: nc_users_v2_email_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_users_v2_email_index ON public.nc_users_v2 USING btree (email);


--
-- Name: nc_views_v2_base_id_fk_workspace_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_views_v2_base_id_fk_workspace_id_index ON public.nc_views_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_views_v2_created_by_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_views_v2_created_by_index ON public.nc_views_v2 USING btree (created_by);


--
-- Name: nc_views_v2_fk_custom_url_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_views_v2_fk_custom_url_id_index ON public.nc_views_v2 USING btree (fk_custom_url_id);


--
-- Name: nc_views_v2_fk_model_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_views_v2_fk_model_id_index ON public.nc_views_v2 USING btree (fk_model_id);


--
-- Name: nc_views_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_views_v2_oldpk_idx ON public.nc_views_v2 USING btree (id);


--
-- Name: nc_views_v2_owned_by_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_views_v2_owned_by_index ON public.nc_views_v2 USING btree (owned_by);


--
-- Name: nc_widgets_context; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_widgets_context ON public.nc_widgets_v2 USING btree (base_id, fk_workspace_id);


--
-- Name: nc_widgets_dashboard_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_widgets_dashboard_idx ON public.nc_widgets_v2 USING btree (fk_dashboard_id);


--
-- Name: nc_widgets_v2_oldpk_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_widgets_v2_oldpk_idx ON public.nc_widgets_v2 USING btree (id);


--
-- Name: nc_workflow_executions_context_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_workflow_executions_context_idx ON public.nc_automation_executions USING btree (base_id, fk_workspace_id);


--
-- Name: nc_workflow_executions_workflow_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_workflow_executions_workflow_idx ON public.nc_automation_executions USING btree (fk_workflow_id);


--
-- Name: nc_workflows_context_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nc_workflows_context_idx ON public.nc_workflows USING btree (base_id, fk_workspace_id);


--
-- Name: notification_created_at_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX notification_created_at_index ON public.notification USING btree (created_at);


--
-- Name: notification_fk_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX notification_fk_user_id_index ON public.notification USING btree (fk_user_id);


--
-- Name: org_domain_fk_workspace_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX org_domain_fk_workspace_id_idx ON public.nc_org_domain USING btree (fk_workspace_id);


--
-- Name: share_uuid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX share_uuid_idx ON public.nc_dashboards_v2 USING btree (uuid);


--
-- Name: sso_client_fk_workspace_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sso_client_fk_workspace_id_idx ON public.nc_sso_client USING btree (fk_workspace_id);


--
-- Name: sync_configs_integration_model; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sync_configs_integration_model ON public.nc_sync_configs USING btree (fk_model_id, fk_integration_id);


--
-- Name: user_comments_preference_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX user_comments_preference_index ON public.nc_user_comment_notifications_preference USING btree (user_id, row_id, fk_model_id);


--
-- Name: workspace_fk_org_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX workspace_fk_org_id_index ON public.workspace USING btree (fk_org_id);


--
-- Name: workspace_user_invited_by_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX workspace_user_invited_by_index ON public.workspace_user USING btree (invited_by);


--
-- Name: 1_CLIENTS_csv_order_idx; Type: INDEX; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE INDEX "1_CLIENTS_csv_order_idx" ON pupuc6ugup9dm03."1_CLIENTS" USING btree (nc_order);


--
-- Name: 2_CONTACTS_csv_order_idx; Type: INDEX; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE INDEX "2_CONTACTS_csv_order_idx" ON pupuc6ugup9dm03."2_CONTACTS" USING btree (nc_order);


--
-- Name: 3_VEHICLES_csv_order_idx; Type: INDEX; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE INDEX "3_VEHICLES_csv_order_idx" ON pupuc6ugup9dm03."3_VEHICLES" USING btree (nc_order);


--
-- Name: 4_DRIVERS_order_idx; Type: INDEX; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE INDEX "4_DRIVERS_order_idx" ON pupuc6ugup9dm03."4_DRIVERS" USING btree (nc_order);


--
-- Name: 5_INQUIRIES_order_idx; Type: INDEX; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE INDEX "5_INQUIRIES_order_idx" ON pupuc6ugup9dm03."5_INQUIRIES" USING btree (nc_order);


--
-- Name: 6_TRANSPORTS_order_idx; Type: INDEX; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE INDEX "6_TRANSPORTS_order_idx" ON pupuc6ugup9dm03."6_TRANSPORTS" USING btree (nc_order);


--
-- Name: 7_FREIGHTS_csv_order_idx; Type: INDEX; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE INDEX "7_FREIGHTS_csv_order_idx" ON pupuc6ugup9dm03."7_FREIGHTS" USING btree (nc_order);


--
-- Name: fk_2_CONTACTS_1_CLIENTS_amib5feure; Type: INDEX; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE INDEX "fk_2_CONTACTS_1_CLIENTS_amib5feure" ON pupuc6ugup9dm03."_nc_m2m_2_CONTACTS_1_CLIENTS" USING btree ("1_CLIENTS_id");


--
-- Name: fk_2_CONTACTS_1_CLIENTS_zxbftpi37g; Type: INDEX; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE INDEX "fk_2_CONTACTS_1_CLIENTS_zxbftpi37g" ON pupuc6ugup9dm03."_nc_m2m_2_CONTACTS_1_CLIENTS" USING btree ("2_CONTACTS_id");


--
-- Name: fk_4_DRIVERS_3_VEHICLES_osw9gynptq; Type: INDEX; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE INDEX "fk_4_DRIVERS_3_VEHICLES_osw9gynptq" ON pupuc6ugup9dm03."_nc_m2m_4_DRIVERS_3_VEHICLES" USING btree ("3_VEHICLES_id");


--
-- Name: fk_4_DRIVERS_3_VEHICLES_t6fn2gwp32; Type: INDEX; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE INDEX "fk_4_DRIVERS_3_VEHICLES_t6fn2gwp32" ON pupuc6ugup9dm03."_nc_m2m_4_DRIVERS_3_VEHICLES" USING btree ("4_DRIVERS_id");


--
-- Name: fk_5_INQUIRIE_1_CLIENTS_lzuzaih04c; Type: INDEX; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE INDEX "fk_5_INQUIRIE_1_CLIENTS_lzuzaih04c" ON pupuc6ugup9dm03."_nc_m2m_5_INQUIRIES_1_CLIENTS" USING btree ("1_CLIENTS_id");


--
-- Name: fk_5_INQUIRIE_1_CLIENTS_we_3xhm60f; Type: INDEX; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE INDEX "fk_5_INQUIRIE_1_CLIENTS_we_3xhm60f" ON pupuc6ugup9dm03."_nc_m2m_5_INQUIRIES_1_CLIENTS" USING btree ("5_INQUIRIES_id");


--
-- Name: fk_5_INQUIRIE_2_CONTACTS_m9yz01vu7p; Type: INDEX; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE INDEX "fk_5_INQUIRIE_2_CONTACTS_m9yz01vu7p" ON pupuc6ugup9dm03."_nc_m2m_5_INQUIRIES_2_CONTACTS" USING btree ("2_CONTACTS_id");


--
-- Name: fk_5_INQUIRIE_2_CONTACTS_oc6d2m53w9; Type: INDEX; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE INDEX "fk_5_INQUIRIE_2_CONTACTS_oc6d2m53w9" ON pupuc6ugup9dm03."_nc_m2m_5_INQUIRIES_2_CONTACTS" USING btree ("5_INQUIRIES_id");


--
-- Name: fk_6_TRANSPOR_3_VEHICLES_dxfuqykxar; Type: INDEX; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE INDEX "fk_6_TRANSPOR_3_VEHICLES_dxfuqykxar" ON pupuc6ugup9dm03."_nc_m2m_6_TRANSPORTS_3_VEHICLES" USING btree ("3_VEHICLES_id");


--
-- Name: fk_6_TRANSPOR_3_VEHICLES_tmo676os4r; Type: INDEX; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE INDEX "fk_6_TRANSPOR_3_VEHICLES_tmo676os4r" ON pupuc6ugup9dm03."_nc_m2m_6_TRANSPORTS_3_VEHICLES" USING btree ("6_TRANSPORTS_id");


--
-- Name: fk_6_TRANSPOR_4_DRIVERS_9uu9a70h2o; Type: INDEX; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE INDEX "fk_6_TRANSPOR_4_DRIVERS_9uu9a70h2o" ON pupuc6ugup9dm03."_nc_m2m_6_TRANSPORTS_4_DRIVERS" USING btree ("6_TRANSPORTS_id");


--
-- Name: fk_6_TRANSPOR_4_DRIVERS_b8380mxfyc; Type: INDEX; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE INDEX "fk_6_TRANSPOR_4_DRIVERS_b8380mxfyc" ON pupuc6ugup9dm03."_nc_m2m_6_TRANSPORTS_4_DRIVERS" USING btree ("4_DRIVERS_id");


--
-- Name: fk_7_FREIGHTS_1_CLIENTS_85xm1d96k0; Type: INDEX; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE INDEX "fk_7_FREIGHTS_1_CLIENTS_85xm1d96k0" ON pupuc6ugup9dm03."_nc_m2m_7_FREIGHTS_1_CLIENTS" USING btree ("1_CLIENTS_id");


--
-- Name: fk_7_FREIGHTS_1_CLIENTS_nv0gcz01tz; Type: INDEX; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE INDEX "fk_7_FREIGHTS_1_CLIENTS_nv0gcz01tz" ON pupuc6ugup9dm03."_nc_m2m_7_FREIGHTS_1_CLIENTS" USING btree ("7_FREIGHTS_id");


--
-- Name: fk_7_FREIGHTS_6_TRANSPOR_4ep8a2zibn; Type: INDEX; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE INDEX "fk_7_FREIGHTS_6_TRANSPOR_4ep8a2zibn" ON pupuc6ugup9dm03."_nc_m2m_7_FREIGHTS_6_TRANSPORTS" USING btree ("7_FREIGHTS_id");


--
-- Name: fk_7_FREIGHTS_6_TRANSPOR_rqwhdwi_pp; Type: INDEX; Schema: pupuc6ugup9dm03; Owner: -
--

CREATE INDEX "fk_7_FREIGHTS_6_TRANSPOR_rqwhdwi_pp" ON pupuc6ugup9dm03."_nc_m2m_7_FREIGHTS_6_TRANSPORTS" USING btree ("6_TRANSPORTS_id");


--
-- PostgreSQL database dump complete
--

\unrestrict pg88XZdzbHo9ff9il6vb9MYuX4KnccJ2AQSfMbMoEESQvv2k8c712o0QFFTqhr0

