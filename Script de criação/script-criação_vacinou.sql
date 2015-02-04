



CREATE TABLE vacinas_vacina
(
  id serial NOT NULL,
  nome character varying(100) NOT NULL,
  dose character varying(200) NOT NULL,
  dose_qtd character varying(50),
  via_administracao character varying(25),
  descricao text NOT NULL,
  slug character varying(50) NOT NULL,
  image character varying(100),
  CONSTRAINT vacinas_vacina_pkey PRIMARY KEY (id)
)

WITH (
  OIDS=FALSE
);
ALTER TABLE vacinas_vacina
  OWNER TO postgres;

-- Index: vacinas_vacina_2dbcba41

-- DROP INDEX vacinas_vacina_2dbcba41;

CREATE INDEX vacinas_vacina_2dbcba41
  ON vacinas_vacina
  USING btree
  (slug COLLATE pg_catalog."default");

--------------------------------------------------------------------------------------------------------	
	-- Table: vacinas_idade_id_vacina

-- DROP TABLE vacinas_idade_id_vacina;

CREATE TABLE vacinas_idade_id_vacina
(
  id serial NOT NULL,
  idade_id integer NOT NULL,
  vacina_id integer NOT NULL,
  CONSTRAINT vacinas_idade_id_vacina_pkey PRIMARY KEY (id),
  CONSTRAINT vacinas_idade_i_vacina_id_6a90dea344f12483_fk_vacinas_vacina_id FOREIGN KEY (vacina_id)
      REFERENCES vacinas_vacina (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT vacinas_idade_id_v_idade_id_48edab4f8343a42_fk_vacinas_idade_id FOREIGN KEY (idade_id)
      REFERENCES vacinas_idade (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT vacinas_idade_id_vacina_idade_id_vacina_id_key UNIQUE (idade_id, vacina_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE vacinas_idade_id_vacina
  OWNER TO postgres;

-- Index: vacinas_idade_id_vacina_078f5c36

-- DROP INDEX vacinas_idade_id_vacina_078f5c36;

CREATE INDEX vacinas_idade_id_vacina_078f5c36
  ON vacinas_idade_id_vacina
  USING btree
  (vacina_id);

-- Index: vacinas_idade_id_vacina_6dde0f41

-- DROP INDEX vacinas_idade_id_vacina_6dde0f41;

CREATE INDEX vacinas_idade_id_vacina_6dde0f41
  ON vacinas_idade_id_vacina
  USING btree
  (idade_id);



---------------------------------------------------------------------------------------------------------

-- Table: vacinas_idade

-- DROP TABLE vacinas_idade;

CREATE TABLE vacinas_idade
(
  id serial NOT NULL,
  idade character varying(15) NOT NULL,
  CONSTRAINT vacinas_idade_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE vacinas_idade
  OWNER TO postgres;

------------------------------------------------------------------------------------------------------

-- Table: doencas_doenca_id_vacina

-- DROP TABLE doencas_doenca_id_vacina;

CREATE TABLE doencas_doenca_id_vacina
(
  id serial NOT NULL,
  doenca_id integer NOT NULL,
  vacina_id integer NOT NULL,
  CONSTRAINT doencas_doenca_id_vacina_pkey PRIMARY KEY (id),
  CONSTRAINT doencas_doenca__doenca_id_32de994ffb715da4_fk_doencas_doenca_id FOREIGN KEY (doenca_id)
      REFERENCES doencas_doenca (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT doencas_doenca__vacina_id_37b8892e4a572468_fk_vacinas_vacina_id FOREIGN KEY (vacina_id)
      REFERENCES vacinas_vacina (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT doencas_doenca_id_vacina_doenca_id_vacina_id_key UNIQUE (doenca_id, vacina_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE doencas_doenca_id_vacina
  OWNER TO postgres;

-- Index: doencas_doenca_id_vacina_078f5c36

-- DROP INDEX doencas_doenca_id_vacina_078f5c36;

CREATE INDEX doencas_doenca_id_vacina_078f5c36
  ON doencas_doenca_id_vacina
  USING btree
  (vacina_id);

-- Index: doencas_doenca_id_vacina_3ccef179

-- DROP INDEX doencas_doenca_id_vacina_3ccef179;

CREATE INDEX doencas_doenca_id_vacina_3ccef179
  ON doencas_doenca_id_vacina
  USING btree
  (doenca_id);

--------------------------------------------------------------------------------------------------------



-- Table: doencas_doenca

-- DROP TABLE doencas_doenca;

CREATE TABLE doencas_doenca
(
  id serial NOT NULL,
  nome character varying(100) NOT NULL,
  image character varying(100),
  descricao text NOT NULL,
  slug character varying(50) NOT NULL,
  CONSTRAINT doencas_doenca_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE doencas_doenca
  OWNER TO postgres;

-- Index: doencas_doenca_2dbcba41

-- DROP INDEX doencas_doenca_2dbcba41;

CREATE INDEX doencas_doenca_2dbcba41
  ON doencas_doenca
  USING btree
  (slug COLLATE pg_catalog."default");


--------------------------------------------------------------------------------------------------------



-- Table: core_unidade_de_vacinacao

-- DROP TABLE core_unidade_de_vacinacao;

CREATE TABLE core_unidade_de_vacinacao
(
  id serial NOT NULL,
  endereco character varying(100) NOT NULL,
  unidade character varying(100) NOT NULL,
  bairro character varying(30) NOT NULL,
  latitude character varying(20) NOT NULL,
  longitude character varying(20) NOT NULL,
  rpa integer NOT NULL,
  CONSTRAINT core_unidade_de_vacinacao_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE core_unidade_de_vacinacao
  OWNER TO postgres;

--------------------------------------------------------------------------------------------
-- Table: core_telefone

-- DROP TABLE core_telefone;

CREATE TABLE core_telefone
(
  id serial NOT NULL,
  fone character varying(30) NOT NULL,
  id_unidade_id integer NOT NULL,
  CONSTRAINT core_telefone_pkey PRIMARY KEY (id),
  CONSTRAINT id_unidade_id_6149bcac55e2b4ae_fk_core_unidade_de_vacinacao_id FOREIGN KEY (id_unidade_id)
      REFERENCES core_unidade_de_vacinacao (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED
)
WITH (
  OIDS=FALSE
);
ALTER TABLE core_telefone
  OWNER TO postgres;

-- Index: core_telefone_cc234e61

-- DROP INDEX core_telefone_cc234e61;

CREATE INDEX core_telefone_cc234e61
  ON core_telefone
  USING btree
  (id_unidade_id);
















































