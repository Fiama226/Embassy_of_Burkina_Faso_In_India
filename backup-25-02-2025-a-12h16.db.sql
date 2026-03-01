BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "_actualites_v" (
	"id"	integer NOT NULL,
	"parent_id"	integer,
	"version_og_image_id"	integer,
	"version_slug"	text,
	"version_author_id"	integer,
	"version_publish_date"	text,
	"version_updated_at"	text,
	"version_created_at"	text,
	"version__status"	text DEFAULT 'draft',
	"created_at"	text NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
	"updated_at"	text NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
	"snapshot"	integer,
	"published_locale"	text,
	"latest"	integer,
	"autosave"	integer,
	PRIMARY KEY("id"),
	FOREIGN KEY("parent_id") REFERENCES "actualites"("id") ON UPDATE no action ON DELETE set null,
	FOREIGN KEY("version_author_id") REFERENCES "users"("id") ON UPDATE no action ON DELETE set null,
	FOREIGN KEY("version_og_image_id") REFERENCES "media"("id") ON UPDATE no action ON DELETE set null
);
CREATE TABLE IF NOT EXISTS "_actualites_v_locales" (
	"version_title"	text,
	"version_excerpt"	text,
	"version_text_before_carousel"	text,
	"version_content"	text,
	"version_meta_title"	text,
	"version_meta_description"	text,
	"id"	integer NOT NULL,
	"_locale"	text NOT NULL,
	"_parent_id"	integer NOT NULL,
	PRIMARY KEY("id"),
	FOREIGN KEY("_parent_id") REFERENCES "_actualites_v"("id") ON UPDATE no action ON DELETE cascade
);
CREATE TABLE IF NOT EXISTS "_actualites_v_rels" (
	"id"	integer NOT NULL,
	"order"	integer,
	"parent_id"	integer NOT NULL,
	"path"	text NOT NULL,
	"categories_id"	integer,
	"tags_id"	integer,
	PRIMARY KEY("id"),
	FOREIGN KEY("categories_id") REFERENCES "categories"("id") ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY("parent_id") REFERENCES "_actualites_v"("id") ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY("tags_id") REFERENCES "tags"("id") ON UPDATE no action ON DELETE cascade
);
CREATE TABLE IF NOT EXISTS "_actualites_v_version_carousel" (
	"_order"	integer NOT NULL,
	"_parent_id"	integer NOT NULL,
	"id"	integer NOT NULL,
	"image_id"	integer,
	"_uuid"	text,
	PRIMARY KEY("id"),
	FOREIGN KEY("_parent_id") REFERENCES "_actualites_v"("id") ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY("image_id") REFERENCES "media"("id") ON UPDATE no action ON DELETE set null
);
CREATE TABLE IF NOT EXISTS "_actualites_v_version_carousel_locales" (
	"caption"	text,
	"id"	integer NOT NULL,
	"_locale"	text NOT NULL,
	"_parent_id"	integer NOT NULL,
	PRIMARY KEY("id"),
	FOREIGN KEY("_parent_id") REFERENCES "_actualites_v_version_carousel"("id") ON UPDATE no action ON DELETE cascade
);
CREATE TABLE IF NOT EXISTS "actualites" (
	"id"	integer NOT NULL,
	"og_image_id"	integer,
	"slug"	text,
	"author_id"	integer,
	"publish_date"	text,
	"updated_at"	text NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
	"created_at"	text NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
	"_status"	text DEFAULT 'draft',
	PRIMARY KEY("id"),
	FOREIGN KEY("author_id") REFERENCES "users"("id") ON UPDATE no action ON DELETE set null,
	FOREIGN KEY("og_image_id") REFERENCES "media"("id") ON UPDATE no action ON DELETE set null
);
CREATE TABLE IF NOT EXISTS "actualites_carousel" (
	"_order"	integer NOT NULL,
	"_parent_id"	integer NOT NULL,
	"id"	text NOT NULL,
	"image_id"	integer,
	PRIMARY KEY("id"),
	FOREIGN KEY("_parent_id") REFERENCES "actualites"("id") ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY("image_id") REFERENCES "media"("id") ON UPDATE no action ON DELETE set null
);
CREATE TABLE IF NOT EXISTS "actualites_carousel_locales" (
	"caption"	text,
	"id"	integer NOT NULL,
	"_locale"	text NOT NULL,
	"_parent_id"	text NOT NULL,
	PRIMARY KEY("id"),
	FOREIGN KEY("_parent_id") REFERENCES "actualites_carousel"("id") ON UPDATE no action ON DELETE cascade
);
CREATE TABLE IF NOT EXISTS "actualites_locales" (
	"title"	text,
	"excerpt"	text,
	"text_before_carousel"	text,
	"content"	text,
	"meta_title"	text,
	"meta_description"	text,
	"id"	integer NOT NULL,
	"_locale"	text NOT NULL,
	"_parent_id"	integer NOT NULL,
	PRIMARY KEY("id"),
	FOREIGN KEY("_parent_id") REFERENCES "actualites"("id") ON UPDATE no action ON DELETE cascade
);
CREATE TABLE IF NOT EXISTS "actualites_rels" (
	"id"	integer NOT NULL,
	"order"	integer,
	"parent_id"	integer NOT NULL,
	"path"	text NOT NULL,
	"categories_id"	integer,
	"tags_id"	integer,
	PRIMARY KEY("id"),
	FOREIGN KEY("categories_id") REFERENCES "categories"("id") ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY("parent_id") REFERENCES "actualites"("id") ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY("tags_id") REFERENCES "tags"("id") ON UPDATE no action ON DELETE cascade
);
CREATE TABLE IF NOT EXISTS "categories" (
	"id"	integer NOT NULL,
	"slug"	text NOT NULL,
	"updated_at"	text NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
	"created_at"	text NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "categories_locales" (
	"name"	text NOT NULL,
	"description"	text,
	"id"	integer NOT NULL,
	"_locale"	text NOT NULL,
	"_parent_id"	integer NOT NULL,
	PRIMARY KEY("id"),
	FOREIGN KEY("_parent_id") REFERENCES "categories"("id") ON UPDATE no action ON DELETE cascade
);
CREATE TABLE IF NOT EXISTS "media" (
	"id"	integer NOT NULL,
	"updated_at"	text NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
	"created_at"	text NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
	"url"	text,
	"thumbnail_u_r_l"	text,
	"filename"	text,
	"mime_type"	text,
	"filesize"	numeric,
	"width"	numeric,
	"height"	numeric,
	"focal_x"	numeric,
	"focal_y"	numeric,
	"sizes_thumbnail_url"	text,
	"sizes_thumbnail_width"	numeric,
	"sizes_thumbnail_height"	numeric,
	"sizes_thumbnail_mime_type"	text,
	"sizes_thumbnail_filesize"	numeric,
	"sizes_thumbnail_filename"	text,
	"sizes_card_url"	text,
	"sizes_card_width"	numeric,
	"sizes_card_height"	numeric,
	"sizes_card_mime_type"	text,
	"sizes_card_filesize"	numeric,
	"sizes_card_filename"	text,
	"sizes_hero_url"	text,
	"sizes_hero_width"	numeric,
	"sizes_hero_height"	numeric,
	"sizes_hero_mime_type"	text,
	"sizes_hero_filesize"	numeric,
	"sizes_hero_filename"	text,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "media_locales" (
	"alt"	text,
	"id"	integer NOT NULL,
	"_locale"	text NOT NULL,
	"_parent_id"	integer NOT NULL,
	PRIMARY KEY("id"),
	FOREIGN KEY("_parent_id") REFERENCES "media"("id") ON UPDATE no action ON DELETE cascade
);
CREATE TABLE IF NOT EXISTS "payload_kv" (
	"id"	integer NOT NULL,
	"key"	text NOT NULL,
	"data"	text NOT NULL,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "payload_locked_documents" (
	"id"	integer NOT NULL,
	"global_slug"	text,
	"updated_at"	text NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
	"created_at"	text NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "payload_locked_documents_rels" (
	"id"	integer NOT NULL,
	"order"	integer,
	"parent_id"	integer NOT NULL,
	"path"	text NOT NULL,
	"users_id"	integer,
	"media_id"	integer,
	"categories_id"	integer,
	"tags_id"	integer,
	"actualites_id"	integer,
	PRIMARY KEY("id"),
	FOREIGN KEY("actualites_id") REFERENCES "actualites"("id") ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY("categories_id") REFERENCES "categories"("id") ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY("media_id") REFERENCES "media"("id") ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY("parent_id") REFERENCES "payload_locked_documents"("id") ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY("tags_id") REFERENCES "tags"("id") ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY("users_id") REFERENCES "users"("id") ON UPDATE no action ON DELETE cascade
);
CREATE TABLE IF NOT EXISTS "payload_migrations" (
	"id"	integer NOT NULL,
	"name"	text,
	"batch"	numeric,
	"updated_at"	text NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
	"created_at"	text NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "payload_preferences" (
	"id"	integer NOT NULL,
	"key"	text,
	"value"	text,
	"updated_at"	text NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
	"created_at"	text NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "payload_preferences_rels" (
	"id"	integer NOT NULL,
	"order"	integer,
	"parent_id"	integer NOT NULL,
	"path"	text NOT NULL,
	"users_id"	integer,
	PRIMARY KEY("id"),
	FOREIGN KEY("parent_id") REFERENCES "payload_preferences"("id") ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY("users_id") REFERENCES "users"("id") ON UPDATE no action ON DELETE cascade
);
CREATE TABLE IF NOT EXISTS "tags" (
	"id"	integer NOT NULL,
	"slug"	text NOT NULL,
	"updated_at"	text NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
	"created_at"	text NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "tags_locales" (
	"name"	text NOT NULL,
	"id"	integer NOT NULL,
	"_locale"	text NOT NULL,
	"_parent_id"	integer NOT NULL,
	PRIMARY KEY("id"),
	FOREIGN KEY("_parent_id") REFERENCES "tags"("id") ON UPDATE no action ON DELETE cascade
);
CREATE TABLE IF NOT EXISTS "users" (
	"id"	integer NOT NULL,
	"name"	text NOT NULL,
	"role"	text NOT NULL DEFAULT 'author',
	"avatar_id"	integer,
	"updated_at"	text NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
	"created_at"	text NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
	"email"	text NOT NULL,
	"reset_password_token"	text,
	"reset_password_expiration"	text,
	"salt"	text,
	"hash"	text,
	"login_attempts"	numeric DEFAULT 0,
	"lock_until"	text,
	PRIMARY KEY("id"),
	FOREIGN KEY("avatar_id") REFERENCES "media"("id") ON UPDATE no action ON DELETE set null
);
CREATE TABLE IF NOT EXISTS "users_sessions" (
	"_order"	integer NOT NULL,
	"_parent_id"	integer NOT NULL,
	"id"	text NOT NULL,
	"created_at"	text,
	"expires_at"	text NOT NULL,
	PRIMARY KEY("id"),
	FOREIGN KEY("_parent_id") REFERENCES "users"("id") ON UPDATE no action ON DELETE cascade
);
INSERT INTO "_actualites_v" VALUES (1,1,NULL,NULL,1,'2026-02-25T23:52:17.189Z','2026-02-25T23:52:17.206Z','2026-02-25T23:52:17.205Z','draft','2026-02-25T23:52:17.220Z','2026-02-25T23:52:17.220Z',NULL,NULL,0,0);
INSERT INTO "_actualites_v" VALUES (2,1,NULL,'Dossier « Yaké Camille Yé et autres » : Du « mouta mouta »* dans les marchés de livraison des pagnes du 8-mars 2024 ?',1,'2026-02-25T23:52:17.189Z','2026-02-26T00:10:27.360Z','2026-02-25T23:52:17.205Z','draft','2026-02-26T00:01:57.669Z','2026-02-26T00:10:27.360Z',NULL,NULL,0,1);
INSERT INTO "_actualites_v" VALUES (3,1,NULL,'Dossier « Yaké Camille Yé et autres » : Du « mouta mouta »* dans les marchés de livraison des pagnes du 8-mars 2024 ?',1,'2026-02-25T23:52:17.189Z','2026-02-26T00:10:41.390Z','2026-02-25T23:52:17.205Z','published','2026-02-26T00:10:41.440Z','2026-02-26T00:10:41.440Z',NULL,NULL,0,0);
INSERT INTO "_actualites_v" VALUES (4,1,NULL,'Dossier',1,'2026-02-25T23:52:17.189Z','2026-02-26T00:57:31.275Z','2026-02-25T23:52:17.205Z','draft','2026-02-26T00:57:19.975Z','2026-02-26T00:57:31.275Z',NULL,NULL,0,1);
INSERT INTO "_actualites_v" VALUES (5,1,NULL,'Dossier',1,'2026-02-25T23:52:17.189Z','2026-02-26T00:57:39.059Z','2026-02-25T23:52:17.205Z','published','2026-02-26T00:57:39.101Z','2026-02-26T00:57:39.101Z',NULL,NULL,0,0);
INSERT INTO "_actualites_v" VALUES (6,1,NULL,'dossier-yake-camille-ye-et-autres-du-mouta-mouta-dans-les-marches-de-livraison-des-pagnes-du-8-mars-2024-ds',1,'2026-02-25T23:52:17.189Z','2026-02-26T01:18:30.657Z','2026-02-25T23:52:17.205Z','draft','2026-02-26T00:57:58.632Z','2026-02-26T01:18:30.657Z',NULL,NULL,0,1);
INSERT INTO "_actualites_v" VALUES (7,1,NULL,'dossier-yake-camille-ye-et-autres-du-mouta-mouta-dans-les-marches-de-livraison-des-pagnes-du-8-mars-2024-ds',1,'2026-02-25T23:52:17.189Z','2026-02-26T01:18:54.461Z','2026-02-25T23:52:17.205Z','published','2026-02-26T01:18:54.512Z','2026-02-26T01:18:54.512Z',NULL,NULL,1,0);
INSERT INTO "_actualites_v" VALUES (8,2,NULL,NULL,1,'2026-02-26T01:23:03.656Z','2026-02-26T01:23:03.680Z','2026-02-26T01:23:03.678Z','draft','2026-02-26T01:23:03.706Z','2026-02-26T01:23:03.706Z',NULL,NULL,0,0);
INSERT INTO "_actualites_v" VALUES (9,2,NULL,'burkinareajustement-du-nombre-de-plats-dans-les-restaurants-universitaires-aucun-etudiant-ne-sera-prive-de-ses-repas-quotidiens-clarifie-le-cenou',1,'2026-02-26T01:23:03.656Z','2026-02-26T01:30:02.675Z','2026-02-26T01:23:03.678Z','draft','2026-02-26T01:24:28.118Z','2026-02-26T01:30:02.675Z',NULL,NULL,0,1);
INSERT INTO "_actualites_v" VALUES (10,2,NULL,'burkinareajustement-du-nombre-de-plats-dans-les-restaurants-universitaires-aucun-etudiant-ne-sera-prive-de-ses-repas-quotidiens-clarifie-le-cenou',1,'2026-02-26T01:23:03.656Z','2026-02-26T01:30:08.376Z','2026-02-26T01:23:03.678Z','published','2026-02-26T01:30:08.438Z','2026-02-26T01:30:08.438Z',NULL,NULL,1,0);
INSERT INTO "_actualites_v" VALUES (11,3,NULL,NULL,1,'2026-02-26T01:30:38.874Z','2026-02-26T01:30:38.889Z','2026-02-26T01:30:38.889Z','draft','2026-02-26T01:30:38.906Z','2026-02-26T01:30:38.906Z',NULL,NULL,0,0);
INSERT INTO "_actualites_v" VALUES (12,3,NULL,'burkina-faso-apres-des-scandales-de-corruption-ledile-de-la-capitale-sermonne-la-police-municipale',1,'2026-02-26T01:30:38.874Z','2026-02-26T01:33:45.822Z','2026-02-26T01:30:38.889Z','draft','2026-02-26T01:30:59.069Z','2026-02-26T01:33:45.822Z',NULL,NULL,0,1);
INSERT INTO "_actualites_v" VALUES (13,3,NULL,'burkina-faso-apres-des-scandales-de-corruption-ledile-de-la-capitale-sermonne-la-police-municipale',1,'2026-02-26T01:30:38.874Z','2026-02-26T01:33:51.662Z','2026-02-26T01:30:38.889Z','published','2026-02-26T01:33:51.706Z','2026-02-26T01:33:51.706Z',NULL,NULL,1,0);
INSERT INTO "_actualites_v_locales" VALUES (NULL,NULL,NULL,NULL,NULL,NULL,1,'en',1);
INSERT INTO "_actualites_v_locales" VALUES (NULL,NULL,NULL,NULL,NULL,NULL,2,'fr',1);
INSERT INTO "_actualites_v_locales" VALUES (NULL,NULL,NULL,NULL,NULL,NULL,3,'en',2);
INSERT INTO "_actualites_v_locales" VALUES ('Dossier « Yaké Camille Yé et autres » : Du « mouta mouta »* dans les marchés de livraison des pagnes du 8-mars 2024 ?',NULL,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"L’audience sur le « dossier Yaké Camille Yé et autres » s’est poursuivie ce mercredi 25 février 2026 devant le Tribunal de grande instance Ouaga I. La journée a quasiment été consacrée aux prestations relatives à la fourniture des pagnes du 8-mars 2024.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"L’audience a été ouverte par la déposition du directeur général des études et des statistiques sectorielles (DGESS) au moment des faits, Ousmane Belem, entendu en qualité de témoin. Son passage visait ainsi à éclairer le Tribunal, par également une confrontation avec des déclarations du prévenu Yaké Camille Yé. L’intérêt du Tribunal a donc porté sur le processus d’élaboration du rapport annuel de performance 2023 et du budget sensible au genre. Ces deux activités ont jusque-là cristallisé les débats, en ce sens que c’est autour de celles-ci également que de l’argent a été défalqué pour \"rétributions\".","type":"text","version":1},{"type":"linebreak","version":1},{"type":"linebreak","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"type":"upload","version":3,"format":"","id":"699f8eb837373664a5da909e","fields":null,"relationTo":"media","value":1},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Sur quelles bases ? Explication !","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"En effet, pendant que les prévenus (Yaké Camille Yé, Lydie Bonkoungou, Issiaka Sangaré et Kouka Dimanche Yaméogo) ont reconnu que ces deux activités ont été exécutées sans des Termes de référence (TDR) et un arrêté portant mise en place de comités comme cela a été procédé, M. Belem affirme que les TDR existent (le Tribunal a demandé à ce qu’il produise lesdits documents pour l’ensemble des parties).","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Il explique que les TDR sont élaborés par la DGESS, tout en sollicitant la direction de la gestion financière pour la partie liée aux ressources financières (ce qui corrobore la déclaration de Yaké Camille Yé sur ce point).","type":"text","version":1},{"type":"linebreak","version":1},{"detail":0,"format":0,"mode":"normal","style":"","text":"Un autre point de divergence concerne la durée des travaux. Durant leur passage, les prévenus sus-référés ont tous déclaré que la durée impartie était d’un mois. Mais, selon le témoin Belem, les travaux ont duré une semaine (ce que confirme une des pièces du dossier présentées par le Tribunal). Tout comme les prévenus, le DGESS Ousmane Belem a confié que chaque participant a reçu une rétribution de 300 000 FCFA.","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1,"textFormat":1}}',NULL,NULL,4,'fr',2);
INSERT INTO "_actualites_v_locales" VALUES (NULL,NULL,NULL,NULL,NULL,NULL,5,'en',3);
INSERT INTO "_actualites_v_locales" VALUES ('Dossier « Yaké Camille Yé et autres » : Du « mouta mouta »* dans les marchés de livraison des pagnes du 8-mars 2024 ?',NULL,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"L’audience sur le « dossier Yaké Camille Yé et autres » s’est poursuivie ce mercredi 25 février 2026 devant le Tribunal de grande instance Ouaga I. La journée a quasiment été consacrée aux prestations relatives à la fourniture des pagnes du 8-mars 2024.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"L’audience a été ouverte par la déposition du directeur général des études et des statistiques sectorielles (DGESS) au moment des faits, Ousmane Belem, entendu en qualité de témoin. Son passage visait ainsi à éclairer le Tribunal, par également une confrontation avec des déclarations du prévenu Yaké Camille Yé. L’intérêt du Tribunal a donc porté sur le processus d’élaboration du rapport annuel de performance 2023 et du budget sensible au genre. Ces deux activités ont jusque-là cristallisé les débats, en ce sens que c’est autour de celles-ci également que de l’argent a été défalqué pour \"rétributions\".","type":"text","version":1},{"type":"linebreak","version":1},{"type":"linebreak","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"type":"upload","version":3,"format":"","id":"699f8eb837373664a5da909e","fields":null,"relationTo":"media","value":1},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Sur quelles bases ? Explication !","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"En effet, pendant que les prévenus (Yaké Camille Yé, Lydie Bonkoungou, Issiaka Sangaré et Kouka Dimanche Yaméogo) ont reconnu que ces deux activités ont été exécutées sans des Termes de référence (TDR) et un arrêté portant mise en place de comités comme cela a été procédé, M. Belem affirme que les TDR existent (le Tribunal a demandé à ce qu’il produise lesdits documents pour l’ensemble des parties).","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Il explique que les TDR sont élaborés par la DGESS, tout en sollicitant la direction de la gestion financière pour la partie liée aux ressources financières (ce qui corrobore la déclaration de Yaké Camille Yé sur ce point).","type":"text","version":1},{"type":"linebreak","version":1},{"detail":0,"format":0,"mode":"normal","style":"","text":"Un autre point de divergence concerne la durée des travaux. Durant leur passage, les prévenus sus-référés ont tous déclaré que la durée impartie était d’un mois. Mais, selon le témoin Belem, les travaux ont duré une semaine (ce que confirme une des pièces du dossier présentées par le Tribunal). Tout comme les prévenus, le DGESS Ousmane Belem a confié que chaque participant a reçu une rétribution de 300 000 FCFA.","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1,"textFormat":1}}',NULL,NULL,6,'fr',3);
INSERT INTO "_actualites_v_locales" VALUES (NULL,NULL,NULL,NULL,NULL,NULL,7,'en',4);
INSERT INTO "_actualites_v_locales" VALUES ('Dossier  « Yaké Camille Yé et autres » : Du « mouta mouta »* dans les marchés de livraison des pagnes du 8-mars 2024 ?',NULL,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"L’audience sur le « dossier Yaké Camille Yé et autres » s’est poursuivie ce mercredi 25 février 2026 devant le Tribunal de grande instance Ouaga I. La journée a quasiment été consacrée aux prestations relatives à la fourniture des pagnes du 8-mars 2024.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"L’audience a été ouverte par la déposition du directeur général des études et des statistiques sectorielles (DGESS) au moment des faits, Ousmane Belem, entendu en qualité de témoin. Son passage visait ainsi à éclairer le Tribunal, par également une confrontation avec des déclarations du prévenu Yaké Camille Yé. L’intérêt du Tribunal a donc porté sur le processus d’élaboration du rapport annuel de performance 2023 et du budget sensible au genre. Ces deux activités ont jusque-là cristallisé les débats, en ce sens que c’est autour de celles-ci également que de l’argent a été défalqué pour \"rétributions\".","type":"text","version":1},{"type":"linebreak","version":1},{"type":"linebreak","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"type":"upload","version":3,"format":"","id":"699f8eb837373664a5da909e","fields":null,"relationTo":"media","value":1},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Sur quelles bases ? Explication !","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"En effet, pendant que les prévenus (Yaké Camille Yé, Lydie Bonkoungou, Issiaka Sangaré et Kouka Dimanche Yaméogo) ont reconnu que ces deux activités ont été exécutées sans des Termes de référence (TDR) et un arrêté portant mise en place de comités comme cela a été procédé, M. Belem affirme que les TDR existent (le Tribunal a demandé à ce qu’il produise lesdits documents pour l’ensemble des parties).","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Il explique que les TDR sont élaborés par la DGESS, tout en sollicitant la direction de la gestion financière pour la partie liée aux ressources financières (ce qui corrobore la déclaration de Yaké Camille Yé sur ce point).","type":"text","version":1},{"type":"linebreak","version":1},{"detail":0,"format":0,"mode":"normal","style":"","text":"Un autre point de divergence concerne la durée des travaux. Durant leur passage, les prévenus sus-référés ont tous déclaré que la durée impartie était d’un mois. Mais, selon le témoin Belem, les travaux ont duré une semaine (ce que confirme une des pièces du dossier présentées par le Tribunal). Tout comme les prévenus, le DGESS Ousmane Belem a confié que chaque participant a reçu une rétribution de 300 000 FCFA.","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1,"textFormat":1}}',NULL,NULL,8,'fr',4);
INSERT INTO "_actualites_v_locales" VALUES (NULL,NULL,NULL,NULL,NULL,NULL,9,'en',5);
INSERT INTO "_actualites_v_locales" VALUES ('Dossier  « Yaké Camille Yé et autres » : Du « mouta mouta »* dans les marchés de livraison des pagnes du 8-mars 2024 ?',NULL,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"L’audience sur le « dossier Yaké Camille Yé et autres » s’est poursuivie ce mercredi 25 février 2026 devant le Tribunal de grande instance Ouaga I. La journée a quasiment été consacrée aux prestations relatives à la fourniture des pagnes du 8-mars 2024.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"L’audience a été ouverte par la déposition du directeur général des études et des statistiques sectorielles (DGESS) au moment des faits, Ousmane Belem, entendu en qualité de témoin. Son passage visait ainsi à éclairer le Tribunal, par également une confrontation avec des déclarations du prévenu Yaké Camille Yé. L’intérêt du Tribunal a donc porté sur le processus d’élaboration du rapport annuel de performance 2023 et du budget sensible au genre. Ces deux activités ont jusque-là cristallisé les débats, en ce sens que c’est autour de celles-ci également que de l’argent a été défalqué pour \"rétributions\".","type":"text","version":1},{"type":"linebreak","version":1},{"type":"linebreak","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"type":"upload","version":3,"format":"","id":"699f8eb837373664a5da909e","fields":null,"relationTo":"media","value":1},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Sur quelles bases ? Explication !","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"En effet, pendant que les prévenus (Yaké Camille Yé, Lydie Bonkoungou, Issiaka Sangaré et Kouka Dimanche Yaméogo) ont reconnu que ces deux activités ont été exécutées sans des Termes de référence (TDR) et un arrêté portant mise en place de comités comme cela a été procédé, M. Belem affirme que les TDR existent (le Tribunal a demandé à ce qu’il produise lesdits documents pour l’ensemble des parties).","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Il explique que les TDR sont élaborés par la DGESS, tout en sollicitant la direction de la gestion financière pour la partie liée aux ressources financières (ce qui corrobore la déclaration de Yaké Camille Yé sur ce point).","type":"text","version":1},{"type":"linebreak","version":1},{"detail":0,"format":0,"mode":"normal","style":"","text":"Un autre point de divergence concerne la durée des travaux. Durant leur passage, les prévenus sus-référés ont tous déclaré que la durée impartie était d’un mois. Mais, selon le témoin Belem, les travaux ont duré une semaine (ce que confirme une des pièces du dossier présentées par le Tribunal). Tout comme les prévenus, le DGESS Ousmane Belem a confié que chaque participant a reçu une rétribution de 300 000 FCFA.","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1,"textFormat":1}}',NULL,NULL,10,'fr',5);
INSERT INTO "_actualites_v_locales" VALUES (NULL,NULL,NULL,NULL,NULL,NULL,11,'en',6);
INSERT INTO "_actualites_v_locales" VALUES ('Dossier  « Yaké Camille Yé et autres » : Du « mouta mouta »* dans les marchés de livraison des pagnes du 8-mars 2024 ? ds',NULL,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"L’audience sur le « dossier Yaké Camille Yé et autres » s’est poursuivie ce mercredi 25 février 2026 devant le Tribunal de grande instance Ouaga I. La journée a quasiment été consacrée aux prestations relatives à la fourniture des pagnes du 8-mars 2024.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"L’audience a été ouverte par la déposition du directeur général des études et des statistiques sectorielles (DGESS) au moment des faits, Ousmane Belem, entendu en qualité de témoin. Son passage visait ainsi à éclairer le Tribunal, par également une confrontation avec des déclarations du prévenu Yaké Camille Yé. L’intérêt du Tribunal a donc porté sur le processus d’élaboration du rapport annuel de performance 2023 et du budget sensible au genre. Ces deux activités ont jusque-là cristallisé les débats, en ce sens que c’est autour de celles-ci également que de l’argent a été défalqué pour \"rétributions\".","type":"text","version":1},{"type":"linebreak","version":1},{"type":"linebreak","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"type":"upload","version":3,"format":"","id":"699f8eb837373664a5da909e","fields":null,"relationTo":"media","value":1},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Sur quelles bases ? Explication !","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"En effet, pendant que les prévenus (Yaké Camille Yé, Lydie Bonkoungou, Issiaka Sangaré et Kouka Dimanche Yaméogo) ont reconnu que ces deux activités ont été exécutées sans des Termes de référence (TDR) et un arrêté portant mise en place de comités comme cela a été procédé, M. Belem affirme que les TDR existent (le Tribunal a demandé à ce qu’il produise lesdits documents pour l’ensemble des parties).","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Il explique que les TDR sont élaborés par la DGESS, tout en sollicitant la direction de la gestion financière pour la partie liée aux ressources financières (ce qui corrobore la déclaration de Yaké Camille Yé sur ce point).","type":"text","version":1},{"type":"linebreak","version":1},{"detail":0,"format":0,"mode":"normal","style":"","text":"Un autre point de divergence concerne la durée des travaux. Durant leur passage, les prévenus sus-référés ont tous déclaré que la durée impartie était d’un mois. Mais, selon le témoin Belem, les travaux ont duré une semaine (ce que confirme une des pièces du dossier présentées par le Tribunal). Tout comme les prévenus, le DGESS Ousmane Belem a confié que chaque participant a reçu une rétribution de 300 000 FCFA.","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1,"textFormat":1}}',NULL,NULL,12,'fr',6);
INSERT INTO "_actualites_v_locales" VALUES (NULL,NULL,NULL,NULL,NULL,NULL,13,'en',7);
INSERT INTO "_actualites_v_locales" VALUES ('Dossier  « Yaké Camille Yé et autres » : Du « mouta mouta »* dans les marchés de livraison des pagnes du 8-mars 2024 ? ds',NULL,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"L’audience sur le « dossier Yaké Camille Yé et autres » s’est poursuivie ce mercredi 25 février 2026 devant le Tribunal de grande instance Ouaga I. La journée a quasiment été consacrée aux prestations relatives à la fourniture des pagnes du 8-mars 2024.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"L’audience a été ouverte par la déposition du directeur général des études et des statistiques sectorielles (DGESS) au moment des faits, Ousmane Belem, entendu en qualité de témoin. Son passage visait ainsi à éclairer le Tribunal, par également une confrontation avec des déclarations du prévenu Yaké Camille Yé. L’intérêt du Tribunal a donc porté sur le processus d’élaboration du rapport annuel de performance 2023 et du budget sensible au genre. Ces deux activités ont jusque-là cristallisé les débats, en ce sens que c’est autour de celles-ci également que de l’argent a été défalqué pour \"rétributions\".","type":"text","version":1},{"type":"linebreak","version":1},{"type":"linebreak","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"type":"upload","version":3,"format":"","id":"699f8eb837373664a5da909e","fields":null,"relationTo":"media","value":1},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Sur quelles bases ? Explication !","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"En effet, pendant que les prévenus (Yaké Camille Yé, Lydie Bonkoungou, Issiaka Sangaré et Kouka Dimanche Yaméogo) ont reconnu que ces deux activités ont été exécutées sans des Termes de référence (TDR) et un arrêté portant mise en place de comités comme cela a été procédé, M. Belem affirme que les TDR existent (le Tribunal a demandé à ce qu’il produise lesdits documents pour l’ensemble des parties).","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Il explique que les TDR sont élaborés par la DGESS, tout en sollicitant la direction de la gestion financière pour la partie liée aux ressources financières (ce qui corrobore la déclaration de Yaké Camille Yé sur ce point).","type":"text","version":1},{"type":"linebreak","version":1},{"detail":0,"format":0,"mode":"normal","style":"","text":"Un autre point de divergence concerne la durée des travaux. Durant leur passage, les prévenus sus-référés ont tous déclaré que la durée impartie était d’un mois. Mais, selon le témoin Belem, les travaux ont duré une semaine (ce que confirme une des pièces du dossier présentées par le Tribunal). Tout comme les prévenus, le DGESS Ousmane Belem a confié que chaque participant a reçu une rétribution de 300 000 FCFA.","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1,"textFormat":1}}',NULL,NULL,14,'fr',7);
INSERT INTO "_actualites_v_locales" VALUES (NULL,NULL,NULL,NULL,NULL,NULL,15,'en',8);
INSERT INTO "_actualites_v_locales" VALUES (NULL,NULL,NULL,NULL,NULL,NULL,16,'fr',8);
INSERT INTO "_actualites_v_locales" VALUES (NULL,NULL,NULL,NULL,NULL,NULL,17,'en',9);
INSERT INTO "_actualites_v_locales" VALUES ('Burkina/Réajustement du nombre de plats dans les restaurants universitaires : « Aucun étudiant ne sera privé de ses repas quotidiens », clarifie le CENOU',NULL,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Dans un communiqué sorti le 11 février 2026, le Centre national des œuvres universitaires (CENOU), annonçait la réduction du nombre de plats servis dans les restaurants universitaires. Cette annonce a provoqué une vague d’incompréhensions notamment au sein de la communauté estudiantine.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Face à une pression croissante sur les services de restauration, liée notamment à l’augmentation continue du nombre d’étudiants et aux répercussions de la crise sécuritaire sur les familles, le CENOU a affirmé avoir été confronté à un choix entre accroître davantage l’offre ou réguler la demande. Si des efforts budgétaires et organisationnels sont engagés pour renforcer l’offre, l’institution a également opté pour une mesure de régulation.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":" Face à cette situation exceptionnelle, nous avons deux leviers : augmenter l’offre et/ou réguler la demande de manière équitable. Côté offre, l’État a consenti des efforts historiques et croissants dont le remboursement massif des dettes (plus de 2 milliards de FCFA en 2023 pour les deux plus grands restaurants universitaires) ; l’augmentation substantielle des budgets de la restauration : 6,96 milliards de FCFA en 2022, 7,8 milliards en 2023, 8,4 milliards en 2024, 9 milliards en 2025 et 9,6 milliards de FCFA en 2026 (soit 93,6 % de la subvention totale versée par l’Etat) ; des efforts supplémentaires exceptionnels pour la normalisation des années académiques (1,1 milliard en 2024 et 790 millions en 2025 pour la restauration en août et septembre, période de vacances universitaires). Malgré ces investissements considérables, la pression reste très forte : certains restaurants enregistrent des dépassements (230 millions de FCFA de reste à payer en 2025, par exemple), menaçant ainsi la pérennité du service. Côté demande, nous avons opté pour une mesure de rééquilibrage solidaire. En effet, pour qu’aucun nouvel étudiant, aucun frère ou sœur arrivé récemment de zones en crise, ne se retrouve sans ticket, nous avons ajusté le plafond à 65 repas », a expliqué le directeur général, Noël Thiombiano.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}',NULL,NULL,18,'fr',9);
INSERT INTO "_actualites_v_locales" VALUES (NULL,NULL,NULL,NULL,NULL,NULL,19,'en',10);
INSERT INTO "_actualites_v_locales" VALUES ('Burkina/Réajustement du nombre de plats dans les restaurants universitaires : « Aucun étudiant ne sera privé de ses repas quotidiens », clarifie le CENOU',NULL,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Dans un communiqué sorti le 11 février 2026, le Centre national des œuvres universitaires (CENOU), annonçait la réduction du nombre de plats servis dans les restaurants universitaires. Cette annonce a provoqué une vague d’incompréhensions notamment au sein de la communauté estudiantine.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Face à une pression croissante sur les services de restauration, liée notamment à l’augmentation continue du nombre d’étudiants et aux répercussions de la crise sécuritaire sur les familles, le CENOU a affirmé avoir été confronté à un choix entre accroître davantage l’offre ou réguler la demande. Si des efforts budgétaires et organisationnels sont engagés pour renforcer l’offre, l’institution a également opté pour une mesure de régulation.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":" Face à cette situation exceptionnelle, nous avons deux leviers : augmenter l’offre et/ou réguler la demande de manière équitable. Côté offre, l’État a consenti des efforts historiques et croissants dont le remboursement massif des dettes (plus de 2 milliards de FCFA en 2023 pour les deux plus grands restaurants universitaires) ; l’augmentation substantielle des budgets de la restauration : 6,96 milliards de FCFA en 2022, 7,8 milliards en 2023, 8,4 milliards en 2024, 9 milliards en 2025 et 9,6 milliards de FCFA en 2026 (soit 93,6 % de la subvention totale versée par l’Etat) ; des efforts supplémentaires exceptionnels pour la normalisation des années académiques (1,1 milliard en 2024 et 790 millions en 2025 pour la restauration en août et septembre, période de vacances universitaires). Malgré ces investissements considérables, la pression reste très forte : certains restaurants enregistrent des dépassements (230 millions de FCFA de reste à payer en 2025, par exemple), menaçant ainsi la pérennité du service. Côté demande, nous avons opté pour une mesure de rééquilibrage solidaire. En effet, pour qu’aucun nouvel étudiant, aucun frère ou sœur arrivé récemment de zones en crise, ne se retrouve sans ticket, nous avons ajusté le plafond à 65 repas », a expliqué le directeur général, Noël Thiombiano.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}',NULL,NULL,20,'fr',10);
INSERT INTO "_actualites_v_locales" VALUES (NULL,NULL,NULL,NULL,NULL,NULL,21,'en',11);
INSERT INTO "_actualites_v_locales" VALUES (NULL,NULL,NULL,NULL,NULL,NULL,22,'fr',11);
INSERT INTO "_actualites_v_locales" VALUES (NULL,NULL,NULL,NULL,NULL,NULL,23,'en',12);
INSERT INTO "_actualites_v_locales" VALUES ('Burkina Faso : Après des scandales de corruption, l’édile de la Capitale sermonne la Police municipale',NULL,'{"root":{"children":[{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Au cours de la traditionnelle montée des couleurs, ce mardi 24 février 2026, à Ouagadougou, le président de la délégation spéciale, Maurice Konaté, s’est adressé aux éléments de la Police municipale après les récents faits de corruption, notamment lors de la sortie terrain du KORAG où deux policiers municipaux ont été pris en flagrant délit de corruption, des faits qui jettent un discrédit sur l’institution. ","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":1,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1,"textFormat":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Il a poursuivi : “","type":"text","version":1},{"detail":0,"format":3,"mode":"normal","style":"","text":"Tout de suite quand le KORAG a fait sa sortie, la Police municipale était encore au premier plan. Je rentre la nuit, je ne dors pas. Je ne sais pas ce qu’il faut faire. On est 975 policiers municipaux, disons 1000. Prenez même seulement le salaire d’un seul policier municipal dans le budget de la commune. Prenez les 1000, prenez leur habillement (…).","type":"text","version":1}],"direction":null,"format":"justify","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":3,"mode":"normal","style":"","text":"Regardez aujourd’hui ce que l’Etat est en train de faire pour rendre cette institution Police municipale digne de son nom. Ils sont armés, vous avez des véhicules, on vous accorde même un certain nombre de droits que vous n’aviez jamais eus","type":"text","version":1},{"detail":0,"format":0,"mode":"normal","style":"","text":"”.","type":"text","version":1}],"direction":null,"format":"justify","indent":0,"type":"paragraph","version":1,"textFormat":3,"textStyle":""},{"children":[],"direction":null,"format":"justify","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"type":"upload","version":3,"format":"","id":"699fa2f89f286f0ccb77f531","fields":null,"relationTo":"media","value":5},{"children":[],"direction":null,"format":"justify","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}',NULL,NULL,24,'fr',12);
INSERT INTO "_actualites_v_locales" VALUES (NULL,NULL,NULL,NULL,NULL,NULL,25,'en',13);
INSERT INTO "_actualites_v_locales" VALUES ('Burkina Faso : Après des scandales de corruption, l’édile de la Capitale sermonne la Police municipale',NULL,'{"root":{"children":[{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Au cours de la traditionnelle montée des couleurs, ce mardi 24 février 2026, à Ouagadougou, le président de la délégation spéciale, Maurice Konaté, s’est adressé aux éléments de la Police municipale après les récents faits de corruption, notamment lors de la sortie terrain du KORAG où deux policiers municipaux ont été pris en flagrant délit de corruption, des faits qui jettent un discrédit sur l’institution. ","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":1,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1,"textFormat":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Il a poursuivi : “","type":"text","version":1},{"detail":0,"format":3,"mode":"normal","style":"","text":"Tout de suite quand le KORAG a fait sa sortie, la Police municipale était encore au premier plan. Je rentre la nuit, je ne dors pas. Je ne sais pas ce qu’il faut faire. On est 975 policiers municipaux, disons 1000. Prenez même seulement le salaire d’un seul policier municipal dans le budget de la commune. Prenez les 1000, prenez leur habillement (…).","type":"text","version":1}],"direction":null,"format":"justify","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":3,"mode":"normal","style":"","text":"Regardez aujourd’hui ce que l’Etat est en train de faire pour rendre cette institution Police municipale digne de son nom. Ils sont armés, vous avez des véhicules, on vous accorde même un certain nombre de droits que vous n’aviez jamais eus","type":"text","version":1},{"detail":0,"format":0,"mode":"normal","style":"","text":"”.","type":"text","version":1}],"direction":null,"format":"justify","indent":0,"type":"paragraph","version":1,"textFormat":3,"textStyle":""},{"children":[],"direction":null,"format":"justify","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"type":"upload","version":3,"format":"","id":"699fa2f89f286f0ccb77f531","fields":null,"relationTo":"media","value":5},{"children":[],"direction":null,"format":"justify","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}',NULL,NULL,26,'fr',13);
INSERT INTO "_actualites_v_version_carousel" VALUES (1,9,1,2,'699fa14effd8067f3fa46daa');
INSERT INTO "_actualites_v_version_carousel" VALUES (2,9,2,3,'699fa17affd8067f3fa46dac');
INSERT INTO "_actualites_v_version_carousel" VALUES (3,9,3,4,'699fa18cffd8067f3fa46dae');
INSERT INTO "_actualites_v_version_carousel" VALUES (1,10,4,2,'699fa14effd8067f3fa46daa');
INSERT INTO "_actualites_v_version_carousel" VALUES (2,10,5,3,'699fa17affd8067f3fa46dac');
INSERT INTO "_actualites_v_version_carousel" VALUES (3,10,6,4,'699fa18cffd8067f3fa46dae');
INSERT INTO "_actualites_v_version_carousel_locales" VALUES ('',1,'fr',3);
INSERT INTO "_actualites_v_version_carousel_locales" VALUES (NULL,2,'en',4);
INSERT INTO "_actualites_v_version_carousel_locales" VALUES (NULL,3,'fr',4);
INSERT INTO "_actualites_v_version_carousel_locales" VALUES (NULL,4,'en',5);
INSERT INTO "_actualites_v_version_carousel_locales" VALUES (NULL,5,'fr',5);
INSERT INTO "_actualites_v_version_carousel_locales" VALUES ('',6,'fr',6);
INSERT INTO "actualites" VALUES (1,NULL,'dossier-yake-camille-ye-et-autres-du-mouta-mouta-dans-les-marches-de-livraison-des-pagnes-du-8-mars-2024-ds',1,'2026-02-25T23:52:17.189Z','2026-02-26T01:18:54.461Z','2026-02-25T23:52:17.205Z','published');
INSERT INTO "actualites" VALUES (2,NULL,'burkinareajustement-du-nombre-de-plats-dans-les-restaurants-universitaires-aucun-etudiant-ne-sera-prive-de-ses-repas-quotidiens-clarifie-le-cenou',1,'2026-02-26T01:23:03.656Z','2026-02-26T01:30:08.376Z','2026-02-26T01:23:03.678Z','published');
INSERT INTO "actualites" VALUES (3,NULL,'burkina-faso-apres-des-scandales-de-corruption-ledile-de-la-capitale-sermonne-la-police-municipale',1,'2026-02-26T01:30:38.874Z','2026-02-26T01:33:51.662Z','2026-02-26T01:30:38.889Z','published');
INSERT INTO "actualites_carousel" VALUES (1,2,'699fa14effd8067f3fa46daa',2);
INSERT INTO "actualites_carousel" VALUES (2,2,'699fa17affd8067f3fa46dac',3);
INSERT INTO "actualites_carousel" VALUES (3,2,'699fa18cffd8067f3fa46dae',4);
INSERT INTO "actualites_carousel_locales" VALUES ('',1,'fr','699fa18cffd8067f3fa46dae');
INSERT INTO "actualites_locales" VALUES (NULL,NULL,NULL,NULL,NULL,NULL,1,'en',1);
INSERT INTO "actualites_locales" VALUES ('Dossier  « Yaké Camille Yé et autres » : Du « mouta mouta »* dans les marchés de livraison des pagnes du 8-mars 2024 ? ds',NULL,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"L’audience sur le « dossier Yaké Camille Yé et autres » s’est poursuivie ce mercredi 25 février 2026 devant le Tribunal de grande instance Ouaga I. La journée a quasiment été consacrée aux prestations relatives à la fourniture des pagnes du 8-mars 2024.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"L’audience a été ouverte par la déposition du directeur général des études et des statistiques sectorielles (DGESS) au moment des faits, Ousmane Belem, entendu en qualité de témoin. Son passage visait ainsi à éclairer le Tribunal, par également une confrontation avec des déclarations du prévenu Yaké Camille Yé. L’intérêt du Tribunal a donc porté sur le processus d’élaboration du rapport annuel de performance 2023 et du budget sensible au genre. Ces deux activités ont jusque-là cristallisé les débats, en ce sens que c’est autour de celles-ci également que de l’argent a été défalqué pour \"rétributions\".","type":"text","version":1},{"type":"linebreak","version":1},{"type":"linebreak","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"type":"upload","version":3,"format":"","id":"699f8eb837373664a5da909e","fields":null,"relationTo":"media","value":1},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Sur quelles bases ? Explication !","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"En effet, pendant que les prévenus (Yaké Camille Yé, Lydie Bonkoungou, Issiaka Sangaré et Kouka Dimanche Yaméogo) ont reconnu que ces deux activités ont été exécutées sans des Termes de référence (TDR) et un arrêté portant mise en place de comités comme cela a été procédé, M. Belem affirme que les TDR existent (le Tribunal a demandé à ce qu’il produise lesdits documents pour l’ensemble des parties).","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Il explique que les TDR sont élaborés par la DGESS, tout en sollicitant la direction de la gestion financière pour la partie liée aux ressources financières (ce qui corrobore la déclaration de Yaké Camille Yé sur ce point).","type":"text","version":1},{"type":"linebreak","version":1},{"detail":0,"format":0,"mode":"normal","style":"","text":"Un autre point de divergence concerne la durée des travaux. Durant leur passage, les prévenus sus-référés ont tous déclaré que la durée impartie était d’un mois. Mais, selon le témoin Belem, les travaux ont duré une semaine (ce que confirme une des pièces du dossier présentées par le Tribunal). Tout comme les prévenus, le DGESS Ousmane Belem a confié que chaque participant a reçu une rétribution de 300 000 FCFA.","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1,"textFormat":1}}',NULL,NULL,2,'fr',1);
INSERT INTO "actualites_locales" VALUES (NULL,NULL,NULL,NULL,NULL,NULL,3,'en',2);
INSERT INTO "actualites_locales" VALUES ('Burkina/Réajustement du nombre de plats dans les restaurants universitaires : « Aucun étudiant ne sera privé de ses repas quotidiens », clarifie le CENOU',NULL,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Dans un communiqué sorti le 11 février 2026, le Centre national des œuvres universitaires (CENOU), annonçait la réduction du nombre de plats servis dans les restaurants universitaires. Cette annonce a provoqué une vague d’incompréhensions notamment au sein de la communauté estudiantine.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Face à une pression croissante sur les services de restauration, liée notamment à l’augmentation continue du nombre d’étudiants et aux répercussions de la crise sécuritaire sur les familles, le CENOU a affirmé avoir été confronté à un choix entre accroître davantage l’offre ou réguler la demande. Si des efforts budgétaires et organisationnels sont engagés pour renforcer l’offre, l’institution a également opté pour une mesure de régulation.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":" Face à cette situation exceptionnelle, nous avons deux leviers : augmenter l’offre et/ou réguler la demande de manière équitable. Côté offre, l’État a consenti des efforts historiques et croissants dont le remboursement massif des dettes (plus de 2 milliards de FCFA en 2023 pour les deux plus grands restaurants universitaires) ; l’augmentation substantielle des budgets de la restauration : 6,96 milliards de FCFA en 2022, 7,8 milliards en 2023, 8,4 milliards en 2024, 9 milliards en 2025 et 9,6 milliards de FCFA en 2026 (soit 93,6 % de la subvention totale versée par l’Etat) ; des efforts supplémentaires exceptionnels pour la normalisation des années académiques (1,1 milliard en 2024 et 790 millions en 2025 pour la restauration en août et septembre, période de vacances universitaires). Malgré ces investissements considérables, la pression reste très forte : certains restaurants enregistrent des dépassements (230 millions de FCFA de reste à payer en 2025, par exemple), menaçant ainsi la pérennité du service. Côté demande, nous avons opté pour une mesure de rééquilibrage solidaire. En effet, pour qu’aucun nouvel étudiant, aucun frère ou sœur arrivé récemment de zones en crise, ne se retrouve sans ticket, nous avons ajusté le plafond à 65 repas », a expliqué le directeur général, Noël Thiombiano.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}',NULL,NULL,4,'fr',2);
INSERT INTO "actualites_locales" VALUES (NULL,NULL,NULL,NULL,NULL,NULL,5,'en',3);
INSERT INTO "actualites_locales" VALUES ('Burkina Faso : Après des scandales de corruption, l’édile de la Capitale sermonne la Police municipale',NULL,'{"root":{"children":[{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Au cours de la traditionnelle montée des couleurs, ce mardi 24 février 2026, à Ouagadougou, le président de la délégation spéciale, Maurice Konaté, s’est adressé aux éléments de la Police municipale après les récents faits de corruption, notamment lors de la sortie terrain du KORAG où deux policiers municipaux ont été pris en flagrant délit de corruption, des faits qui jettent un discrédit sur l’institution. ","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":1,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1,"textFormat":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Il a poursuivi : “","type":"text","version":1},{"detail":0,"format":3,"mode":"normal","style":"","text":"Tout de suite quand le KORAG a fait sa sortie, la Police municipale était encore au premier plan. Je rentre la nuit, je ne dors pas. Je ne sais pas ce qu’il faut faire. On est 975 policiers municipaux, disons 1000. Prenez même seulement le salaire d’un seul policier municipal dans le budget de la commune. Prenez les 1000, prenez leur habillement (…).","type":"text","version":1}],"direction":null,"format":"justify","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":3,"mode":"normal","style":"","text":"Regardez aujourd’hui ce que l’Etat est en train de faire pour rendre cette institution Police municipale digne de son nom. Ils sont armés, vous avez des véhicules, on vous accorde même un certain nombre de droits que vous n’aviez jamais eus","type":"text","version":1},{"detail":0,"format":0,"mode":"normal","style":"","text":"”.","type":"text","version":1}],"direction":null,"format":"justify","indent":0,"type":"paragraph","version":1,"textFormat":3,"textStyle":""},{"children":[],"direction":null,"format":"justify","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"type":"upload","version":3,"format":"","id":"699fa2f89f286f0ccb77f531","fields":null,"relationTo":"media","value":5},{"children":[],"direction":null,"format":"justify","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}',NULL,NULL,6,'fr',3);
INSERT INTO "media" VALUES (1,'2026-02-26T00:07:20.086Z','2026-02-26T00:07:20.086Z','/api/media/file/whatsapp_image_2026-02-25_at_20.45_44-ef801.jpg',NULL,'whatsapp_image_2026-02-25_at_20.45_44-ef801.jpg','image/jpeg',47784,680,401,50,50,'/api/media/file/whatsapp_image_2026-02-25_at_20.45_44-ef801-400x300.jpg',400,300,'image/jpeg',22557,'whatsapp_image_2026-02-25_at_20.45_44-ef801-400x300.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "media" VALUES (2,'2026-02-26T01:27:17.369Z','2026-02-26T01:27:17.369Z','/api/media/file/490920dc-075d-45de-adf3-de81da86afae-5ff4e.jpg',NULL,'490920dc-075d-45de-adf3-de81da86afae-5ff4e.jpg','image/jpeg',59756,600,400,50,50,'/api/media/file/490920dc-075d-45de-adf3-de81da86afae-5ff4e-400x300.jpg',400,300,'image/jpeg',30214,'490920dc-075d-45de-adf3-de81da86afae-5ff4e-400x300.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "media" VALUES (3,'2026-02-26T01:27:37.254Z','2026-02-26T01:27:37.254Z','/api/media/file/e3277d7a-347b-4b0d-aebe-f9490767aa7d-30d4d.jpg',NULL,'e3277d7a-347b-4b0d-aebe-f9490767aa7d-30d4d.jpg','image/jpeg',59045,600,400,50,50,'/api/media/file/e3277d7a-347b-4b0d-aebe-f9490767aa7d-30d4d-400x300.jpg',400,300,'image/jpeg',30189,'e3277d7a-347b-4b0d-aebe-f9490767aa7d-30d4d-400x300.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "media" VALUES (4,'2026-02-26T01:28:07.039Z','2026-02-26T01:28:07.039Z','/api/media/file/e6d61342-9166-450f-89e8-4fa6f0915613-eb4a2.jpg',NULL,'e6d61342-9166-450f-89e8-4fa6f0915613-eb4a2.jpg','image/jpeg',73255,680,453,50,50,'/api/media/file/e6d61342-9166-450f-89e8-4fa6f0915613-eb4a2-400x300.jpg',400,300,'image/jpeg',28328,'e6d61342-9166-450f-89e8-4fa6f0915613-eb4a2-400x300.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "media" VALUES (5,'2026-02-26T01:33:44.242Z','2026-02-26T01:33:44.241Z','/api/media/file/Police-Municipale.jpg',NULL,'Police-Municipale.jpg','image/jpeg',96760,1016,655,50,50,'/api/media/file/Police-Municipale-400x300.jpg',400,300,'image/jpeg',29689,'Police-Municipale-400x300.jpg','/api/media/file/Police-Municipale-768x512.jpg',768,512,'image/jpeg',83659,'Police-Municipale-768x512.jpg',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "payload_migrations" VALUES (1,'dev',-1,'2026-02-28 23:55:40','2026-02-25T23:47:33.958Z');
INSERT INTO "payload_preferences" VALUES (1,'collection-users','{}','2026-02-25T23:51:36.551Z','2026-02-25T23:51:36.547Z');
INSERT INTO "payload_preferences" VALUES (2,'collection-media','{"editViewType":"default"}','2026-02-26T00:06:53.959Z','2026-02-25T23:51:40.711Z');
INSERT INTO "payload_preferences" VALUES (3,'collection-categories','{}','2026-02-25T23:51:49.005Z','2026-02-25T23:51:49.004Z');
INSERT INTO "payload_preferences" VALUES (4,'collection-tags','{}','2026-02-25T23:51:55.254Z','2026-02-25T23:51:55.253Z');
INSERT INTO "payload_preferences" VALUES (5,'collection-actualites','{"editViewType":"default","limit":10,"sort":"-publishDate"}','2026-02-26T00:07:50.418Z','2026-02-25T23:51:59.677Z');
INSERT INTO "payload_preferences" VALUES (6,'nav','{"open":true}','2026-02-28T15:23:53.800Z','2026-02-26T00:59:00.058Z');
INSERT INTO "payload_preferences_rels" VALUES (1,NULL,1,'user',1);
INSERT INTO "payload_preferences_rels" VALUES (3,NULL,3,'user',1);
INSERT INTO "payload_preferences_rels" VALUES (4,NULL,4,'user',1);
INSERT INTO "payload_preferences_rels" VALUES (6,NULL,2,'user',1);
INSERT INTO "payload_preferences_rels" VALUES (7,NULL,5,'user',1);
INSERT INTO "payload_preferences_rels" VALUES (8,NULL,6,'user',1);
INSERT INTO "users" VALUES (1,'KABORE Landry','admin',NULL,'2026-02-25T23:51:20.933Z','2026-02-25T23:51:20.931Z','usertest@gmail.com',NULL,NULL,'01fe202cce3f05dde040e1f32d93c1c60354daf7cb4db38776a664b322119f0f','12c0a9caab20676875d009f1f8338f5c8e9c107f2f27c9f44d17c05ec006d9b10329155b8b644958adfaa4fa50198575b2ad930788a19b6f7565ff9c0728f5f52d3a67cda8caddd9edf5cc1774545ee1a9c25bef074eb0aee34ccfc4f651071211f4c7fe55494e3a734842b42e68e460d9a9f04bd007c698902f2264a21591e571902fb90f82240a895c31823824e8c195f5b1288d8abbd1509ed6ca828095944e1a6526883244add33185385a1565b784412162e431a06429b30b528ee470b293c149939219043fca20af9ebdafc78333bc7490701f5b84746d85de3c9c421b509c7ce41f0100b27ec5ab7ea144cec15f206bb98c9faf5b59cb82081c3b0abfe90bdb21095d85529a932e40537bcfd2d9f60eea8792395a8eef42a4974c4662f80d2dea17268beabc72bd9580218d10a6170ecad5aa2175bd8864e6227aa0bdb18e908239b633dd440181b32ceaae7de45dbb701c522c3e088f206eab79ddf553082e862fae3d3df09e55d8ac800aa9c8fe9dbf674a423c51ac000e705581fc58f35c67661d642f3f34e9ccde4966af49901f04c7b0de7456e5fd99001f86bb8c7b2db9d39fab2ed12b0f4c7060a962572fb0368089c4bcf5dc7cf1f9dc8db96893fc7b4df20e54c30675b58ea17a0e2f63fb72eaf67a2a1e19fc6b8c7ae4700e3d3dabba8fa56c252f170e771953c38ae00fb82fe475e9ca508047887fa160',0,NULL);
INSERT INTO "users_sessions" VALUES (1,1,'538e0eee-67da-4a89-acaf-d1d1e0c1b2be','2026-02-28T14:55:29.422Z','2026-02-28T16:55:29.422Z');
CREATE INDEX IF NOT EXISTS "_actualites_v_autosave_idx" ON "_actualites_v" (
	"autosave"
);
CREATE INDEX IF NOT EXISTS "_actualites_v_created_at_idx" ON "_actualites_v" (
	"created_at"
);
CREATE INDEX IF NOT EXISTS "_actualites_v_latest_idx" ON "_actualites_v" (
	"latest"
);
CREATE UNIQUE INDEX IF NOT EXISTS "_actualites_v_locales_locale_parent_id_unique" ON "_actualites_v_locales" (
	"_locale",
	"_parent_id"
);
CREATE INDEX IF NOT EXISTS "_actualites_v_parent_idx" ON "_actualites_v" (
	"parent_id"
);
CREATE INDEX IF NOT EXISTS "_actualites_v_published_locale_idx" ON "_actualites_v" (
	"published_locale"
);
CREATE INDEX IF NOT EXISTS "_actualites_v_rels_categories_id_idx" ON "_actualites_v_rels" (
	"categories_id"
);
CREATE INDEX IF NOT EXISTS "_actualites_v_rels_order_idx" ON "_actualites_v_rels" (
	"order"
);
CREATE INDEX IF NOT EXISTS "_actualites_v_rels_parent_idx" ON "_actualites_v_rels" (
	"parent_id"
);
CREATE INDEX IF NOT EXISTS "_actualites_v_rels_path_idx" ON "_actualites_v_rels" (
	"path"
);
CREATE INDEX IF NOT EXISTS "_actualites_v_rels_tags_id_idx" ON "_actualites_v_rels" (
	"tags_id"
);
CREATE INDEX IF NOT EXISTS "_actualites_v_snapshot_idx" ON "_actualites_v" (
	"snapshot"
);
CREATE INDEX IF NOT EXISTS "_actualites_v_updated_at_idx" ON "_actualites_v" (
	"updated_at"
);
CREATE INDEX IF NOT EXISTS "_actualites_v_version_carousel_image_idx" ON "_actualites_v_version_carousel" (
	"image_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "_actualites_v_version_carousel_locales_locale_parent_id_uniq" ON "_actualites_v_version_carousel_locales" (
	"_locale",
	"_parent_id"
);
CREATE INDEX IF NOT EXISTS "_actualites_v_version_carousel_order_idx" ON "_actualites_v_version_carousel" (
	"_order"
);
CREATE INDEX IF NOT EXISTS "_actualites_v_version_carousel_parent_id_idx" ON "_actualites_v_version_carousel" (
	"_parent_id"
);
CREATE INDEX IF NOT EXISTS "_actualites_v_version_version__status_idx" ON "_actualites_v" (
	"version__status"
);
CREATE INDEX IF NOT EXISTS "_actualites_v_version_version_author_idx" ON "_actualites_v" (
	"version_author_id"
);
CREATE INDEX IF NOT EXISTS "_actualites_v_version_version_created_at_idx" ON "_actualites_v" (
	"version_created_at"
);
CREATE INDEX IF NOT EXISTS "_actualites_v_version_version_og_image_idx" ON "_actualites_v" (
	"version_og_image_id"
);
CREATE INDEX IF NOT EXISTS "_actualites_v_version_version_slug_idx" ON "_actualites_v" (
	"version_slug"
);
CREATE INDEX IF NOT EXISTS "_actualites_v_version_version_updated_at_idx" ON "_actualites_v" (
	"version_updated_at"
);
CREATE INDEX IF NOT EXISTS "actualites__status_idx" ON "actualites" (
	"_status"
);
CREATE INDEX IF NOT EXISTS "actualites_author_idx" ON "actualites" (
	"author_id"
);
CREATE INDEX IF NOT EXISTS "actualites_carousel_image_idx" ON "actualites_carousel" (
	"image_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "actualites_carousel_locales_locale_parent_id_unique" ON "actualites_carousel_locales" (
	"_locale",
	"_parent_id"
);
CREATE INDEX IF NOT EXISTS "actualites_carousel_order_idx" ON "actualites_carousel" (
	"_order"
);
CREATE INDEX IF NOT EXISTS "actualites_carousel_parent_id_idx" ON "actualites_carousel" (
	"_parent_id"
);
CREATE INDEX IF NOT EXISTS "actualites_created_at_idx" ON "actualites" (
	"created_at"
);
CREATE UNIQUE INDEX IF NOT EXISTS "actualites_locales_locale_parent_id_unique" ON "actualites_locales" (
	"_locale",
	"_parent_id"
);
CREATE INDEX IF NOT EXISTS "actualites_og_image_idx" ON "actualites" (
	"og_image_id"
);
CREATE INDEX IF NOT EXISTS "actualites_rels_categories_id_idx" ON "actualites_rels" (
	"categories_id"
);
CREATE INDEX IF NOT EXISTS "actualites_rels_order_idx" ON "actualites_rels" (
	"order"
);
CREATE INDEX IF NOT EXISTS "actualites_rels_parent_idx" ON "actualites_rels" (
	"parent_id"
);
CREATE INDEX IF NOT EXISTS "actualites_rels_path_idx" ON "actualites_rels" (
	"path"
);
CREATE INDEX IF NOT EXISTS "actualites_rels_tags_id_idx" ON "actualites_rels" (
	"tags_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "actualites_slug_idx" ON "actualites" (
	"slug"
);
CREATE INDEX IF NOT EXISTS "actualites_updated_at_idx" ON "actualites" (
	"updated_at"
);
CREATE INDEX IF NOT EXISTS "categories_created_at_idx" ON "categories" (
	"created_at"
);
CREATE UNIQUE INDEX IF NOT EXISTS "categories_locales_locale_parent_id_unique" ON "categories_locales" (
	"_locale",
	"_parent_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "categories_slug_idx" ON "categories" (
	"slug"
);
CREATE INDEX IF NOT EXISTS "categories_updated_at_idx" ON "categories" (
	"updated_at"
);
CREATE INDEX IF NOT EXISTS "media_created_at_idx" ON "media" (
	"created_at"
);
CREATE UNIQUE INDEX IF NOT EXISTS "media_filename_idx" ON "media" (
	"filename"
);
CREATE UNIQUE INDEX IF NOT EXISTS "media_locales_locale_parent_id_unique" ON "media_locales" (
	"_locale",
	"_parent_id"
);
CREATE INDEX IF NOT EXISTS "media_sizes_card_sizes_card_filename_idx" ON "media" (
	"sizes_card_filename"
);
CREATE INDEX IF NOT EXISTS "media_sizes_hero_sizes_hero_filename_idx" ON "media" (
	"sizes_hero_filename"
);
CREATE INDEX IF NOT EXISTS "media_sizes_thumbnail_sizes_thumbnail_filename_idx" ON "media" (
	"sizes_thumbnail_filename"
);
CREATE INDEX IF NOT EXISTS "media_updated_at_idx" ON "media" (
	"updated_at"
);
CREATE UNIQUE INDEX IF NOT EXISTS "payload_kv_key_idx" ON "payload_kv" (
	"key"
);
CREATE INDEX IF NOT EXISTS "payload_locked_documents_created_at_idx" ON "payload_locked_documents" (
	"created_at"
);
CREATE INDEX IF NOT EXISTS "payload_locked_documents_global_slug_idx" ON "payload_locked_documents" (
	"global_slug"
);
CREATE INDEX IF NOT EXISTS "payload_locked_documents_rels_actualites_id_idx" ON "payload_locked_documents_rels" (
	"actualites_id"
);
CREATE INDEX IF NOT EXISTS "payload_locked_documents_rels_categories_id_idx" ON "payload_locked_documents_rels" (
	"categories_id"
);
CREATE INDEX IF NOT EXISTS "payload_locked_documents_rels_media_id_idx" ON "payload_locked_documents_rels" (
	"media_id"
);
CREATE INDEX IF NOT EXISTS "payload_locked_documents_rels_order_idx" ON "payload_locked_documents_rels" (
	"order"
);
CREATE INDEX IF NOT EXISTS "payload_locked_documents_rels_parent_idx" ON "payload_locked_documents_rels" (
	"parent_id"
);
CREATE INDEX IF NOT EXISTS "payload_locked_documents_rels_path_idx" ON "payload_locked_documents_rels" (
	"path"
);
CREATE INDEX IF NOT EXISTS "payload_locked_documents_rels_tags_id_idx" ON "payload_locked_documents_rels" (
	"tags_id"
);
CREATE INDEX IF NOT EXISTS "payload_locked_documents_rels_users_id_idx" ON "payload_locked_documents_rels" (
	"users_id"
);
CREATE INDEX IF NOT EXISTS "payload_locked_documents_updated_at_idx" ON "payload_locked_documents" (
	"updated_at"
);
CREATE INDEX IF NOT EXISTS "payload_migrations_created_at_idx" ON "payload_migrations" (
	"created_at"
);
CREATE INDEX IF NOT EXISTS "payload_migrations_updated_at_idx" ON "payload_migrations" (
	"updated_at"
);
CREATE INDEX IF NOT EXISTS "payload_preferences_created_at_idx" ON "payload_preferences" (
	"created_at"
);
CREATE INDEX IF NOT EXISTS "payload_preferences_key_idx" ON "payload_preferences" (
	"key"
);
CREATE INDEX IF NOT EXISTS "payload_preferences_rels_order_idx" ON "payload_preferences_rels" (
	"order"
);
CREATE INDEX IF NOT EXISTS "payload_preferences_rels_parent_idx" ON "payload_preferences_rels" (
	"parent_id"
);
CREATE INDEX IF NOT EXISTS "payload_preferences_rels_path_idx" ON "payload_preferences_rels" (
	"path"
);
CREATE INDEX IF NOT EXISTS "payload_preferences_rels_users_id_idx" ON "payload_preferences_rels" (
	"users_id"
);
CREATE INDEX IF NOT EXISTS "payload_preferences_updated_at_idx" ON "payload_preferences" (
	"updated_at"
);
CREATE INDEX IF NOT EXISTS "tags_created_at_idx" ON "tags" (
	"created_at"
);
CREATE UNIQUE INDEX IF NOT EXISTS "tags_locales_locale_parent_id_unique" ON "tags_locales" (
	"_locale",
	"_parent_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "tags_slug_idx" ON "tags" (
	"slug"
);
CREATE INDEX IF NOT EXISTS "tags_updated_at_idx" ON "tags" (
	"updated_at"
);
CREATE INDEX IF NOT EXISTS "users_avatar_idx" ON "users" (
	"avatar_id"
);
CREATE INDEX IF NOT EXISTS "users_created_at_idx" ON "users" (
	"created_at"
);
CREATE UNIQUE INDEX IF NOT EXISTS "users_email_idx" ON "users" (
	"email"
);
CREATE INDEX IF NOT EXISTS "users_sessions_order_idx" ON "users_sessions" (
	"_order"
);
CREATE INDEX IF NOT EXISTS "users_sessions_parent_id_idx" ON "users_sessions" (
	"_parent_id"
);
CREATE INDEX IF NOT EXISTS "users_updated_at_idx" ON "users" (
	"updated_at"
);
COMMIT;
