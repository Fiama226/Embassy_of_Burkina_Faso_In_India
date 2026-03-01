CREATE TABLE "users_sessions" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" text PRIMARY KEY NOT NULL,
	"created_at" text,
	"expires_at" text NOT NULL,
	FOREIGN KEY ("_parent_id") REFERENCES "users"("id") ON UPDATE no action ON DELETE cascade
);
INSERT INTO users_sessions VALUES(1,1,'538e0eee-67da-4a89-acaf-d1d1e0c1b2be','2026-02-28T14:55:29.422Z','2026-02-28T16:55:29.422Z');
CREATE TABLE "users" (
	"id" SERIAL PRIMARY KEY,
	"name" text NOT NULL,
	"role" text DEFAULT 'author' NOT NULL,
	"avatar_id" integer,
	"updated_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"email" text NOT NULL,
	"reset_password_token" text,
	"reset_password_expiration" text,
	"salt" text,
	"hash" text,
	"login_attempts" numeric DEFAULT 0,
	"lock_until" text,
	FOREIGN KEY ("avatar_id") REFERENCES "media"("id") ON UPDATE no action ON DELETE set null
);
INSERT INTO users VALUES(1,'KABORE Landry','admin',NULL,'2026-02-25T23:51:20.933Z','2026-02-25T23:51:20.931Z','usertest@gmail.com',NULL,NULL,'01fe202cce3f05dde040e1f32d93c1c60354daf7cb4db38776a664b322119f0f','12c0a9caab20676875d009f1f8338f5c8e9c107f2f27c9f44d17c05ec006d9b10329155b8b644958adfaa4fa50198575b2ad930788a19b6f7565ff9c0728f5f52d3a67cda8caddd9edf5cc1774545ee1a9c25bef074eb0aee34ccfc4f651071211f4c7fe55494e3a734842b42e68e460d9a9f04bd007c698902f2264a21591e571902fb90f82240a895c31823824e8c195f5b1288d8abbd1509ed6ca828095944e1a6526883244add33185385a1565b784412162e431a06429b30b528ee470b293c149939219043fca20af9ebdafc78333bc7490701f5b84746d85de3c9c421b509c7ce41f0100b27ec5ab7ea144cec15f206bb98c9faf5b59cb82081c3b0abfe90bdb21095d85529a932e40537bcfd2d9f60eea8792395a8eef42a4974c4662f80d2dea17268beabc72bd9580218d10a6170ecad5aa2175bd8864e6227aa0bdb18e908239b633dd440181b32ceaae7de45dbb701c522c3e088f206eab79ddf553082e862fae3d3df09e55d8ac800aa9c8fe9dbf674a423c51ac000e705581fc58f35c67661d642f3f34e9ccde4966af49901f04c7b0de7456e5fd99001f86bb8c7b2db9d39fab2ed12b0f4c7060a962572fb0368089c4bcf5dc7cf1f9dc8db96893fc7b4df20e54c30675b58ea17a0e2f63fb72eaf67a2a1e19fc6b8c7ae4700e3d3dabba8fa56c252f170e771953c38ae00fb82fe475e9ca508047887fa160',0,NULL);
CREATE TABLE "media" (
	"id" SERIAL PRIMARY KEY,
	"updated_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"url" text,
	"thumbnail_u_r_l" text,
	"filename" text,
	"mime_type" text,
	"filesize" numeric,
	"width" numeric,
	"height" numeric,
	"focal_x" numeric,
	"focal_y" numeric,
	"sizes_thumbnail_url" text,
	"sizes_thumbnail_width" numeric,
	"sizes_thumbnail_height" numeric,
	"sizes_thumbnail_mime_type" text,
	"sizes_thumbnail_filesize" numeric,
	"sizes_thumbnail_filename" text,
	"sizes_card_url" text,
	"sizes_card_width" numeric,
	"sizes_card_height" numeric,
	"sizes_card_mime_type" text,
	"sizes_card_filesize" numeric,
	"sizes_card_filename" text,
	"sizes_hero_url" text,
	"sizes_hero_width" numeric,
	"sizes_hero_height" numeric,
	"sizes_hero_mime_type" text,
	"sizes_hero_filesize" numeric,
	"sizes_hero_filename" text
);
INSERT INTO media VALUES(1,'2026-02-26T00:07:20.086Z','2026-02-26T00:07:20.086Z','/api/media/file/whatsapp_image_2026-02-25_at_20.45_44-ef801.jpg',NULL,'whatsapp_image_2026-02-25_at_20.45_44-ef801.jpg','image/jpeg',47784,680,401,50,50,'/api/media/file/whatsapp_image_2026-02-25_at_20.45_44-ef801-400x300.jpg',400,300,'image/jpeg',22557,'whatsapp_image_2026-02-25_at_20.45_44-ef801-400x300.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO media VALUES(2,'2026-02-26T01:27:17.369Z','2026-02-26T01:27:17.369Z','/api/media/file/490920dc-075d-45de-adf3-de81da86afae-5ff4e.jpg',NULL,'490920dc-075d-45de-adf3-de81da86afae-5ff4e.jpg','image/jpeg',59756,600,400,50,50,'/api/media/file/490920dc-075d-45de-adf3-de81da86afae-5ff4e-400x300.jpg',400,300,'image/jpeg',30214,'490920dc-075d-45de-adf3-de81da86afae-5ff4e-400x300.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO media VALUES(3,'2026-02-26T01:27:37.254Z','2026-02-26T01:27:37.254Z','/api/media/file/e3277d7a-347b-4b0d-aebe-f9490767aa7d-30d4d.jpg',NULL,'e3277d7a-347b-4b0d-aebe-f9490767aa7d-30d4d.jpg','image/jpeg',59045,600,400,50,50,'/api/media/file/e3277d7a-347b-4b0d-aebe-f9490767aa7d-30d4d-400x300.jpg',400,300,'image/jpeg',30189,'e3277d7a-347b-4b0d-aebe-f9490767aa7d-30d4d-400x300.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO media VALUES(4,'2026-02-26T01:28:07.039Z','2026-02-26T01:28:07.039Z','/api/media/file/e6d61342-9166-450f-89e8-4fa6f0915613-eb4a2.jpg',NULL,'e6d61342-9166-450f-89e8-4fa6f0915613-eb4a2.jpg','image/jpeg',73255,680,453,50,50,'/api/media/file/e6d61342-9166-450f-89e8-4fa6f0915613-eb4a2-400x300.jpg',400,300,'image/jpeg',28328,'e6d61342-9166-450f-89e8-4fa6f0915613-eb4a2-400x300.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO media VALUES(5,'2026-02-26T01:33:44.242Z','2026-02-26T01:33:44.241Z','/api/media/file/Police-Municipale.jpg',NULL,'Police-Municipale.jpg','image/jpeg',96760,1016,655,50,50,'/api/media/file/Police-Municipale-400x300.jpg',400,300,'image/jpeg',29689,'Police-Municipale-400x300.jpg','/api/media/file/Police-Municipale-768x512.jpg',768,512,'image/jpeg',83659,'Police-Municipale-768x512.jpg',NULL,NULL,NULL,NULL,NULL,NULL);
CREATE TABLE "media_locales" (
	"alt" text,
	"id" SERIAL PRIMARY KEY,
	"_locale" text NOT NULL,
	"_parent_id" integer NOT NULL,
	FOREIGN KEY ("_parent_id") REFERENCES "media"("id") ON UPDATE no action ON DELETE cascade
);
CREATE TABLE "categories" (
	"id" SERIAL PRIMARY KEY,
	"slug" text NOT NULL,
	"updated_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
CREATE TABLE "categories_locales" (
	"name" text NOT NULL,
	"description" text,
	"id" SERIAL PRIMARY KEY,
	"_locale" text NOT NULL,
	"_parent_id" integer NOT NULL,
	FOREIGN KEY ("_parent_id") REFERENCES "categories"("id") ON UPDATE no action ON DELETE cascade
);
CREATE TABLE "tags" (
	"id" SERIAL PRIMARY KEY,
	"slug" text NOT NULL,
	"updated_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
CREATE TABLE "tags_locales" (
	"name" text NOT NULL,
	"id" SERIAL PRIMARY KEY,
	"_locale" text NOT NULL,
	"_parent_id" integer NOT NULL,
	FOREIGN KEY ("_parent_id") REFERENCES "tags"("id") ON UPDATE no action ON DELETE cascade
);
CREATE TABLE "actualites_carousel" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" text PRIMARY KEY NOT NULL,
	"image_id" integer,
	FOREIGN KEY ("image_id") REFERENCES "media"("id") ON UPDATE no action ON DELETE set null,
	FOREIGN KEY ("_parent_id") REFERENCES "actualites"("id") ON UPDATE no action ON DELETE cascade
);
INSERT INTO actualites_carousel VALUES(1,2,'699fa14effd8067f3fa46daa',2);
INSERT INTO actualites_carousel VALUES(2,2,'699fa17affd8067f3fa46dac',3);
INSERT INTO actualites_carousel VALUES(3,2,'699fa18cffd8067f3fa46dae',4);
CREATE TABLE "actualites_carousel_locales" (
	"caption" text,
	"id" SERIAL PRIMARY KEY,
	"_locale" text NOT NULL,
	"_parent_id" text NOT NULL,
	FOREIGN KEY ("_parent_id") REFERENCES "actualites_carousel"("id") ON UPDATE no action ON DELETE cascade
);
INSERT INTO actualites_carousel_locales VALUES('',1,'fr','699fa18cffd8067f3fa46dae');
CREATE TABLE "actualites" (
	"id" SERIAL PRIMARY KEY,
	"og_image_id" integer,
	"slug" text,
	"author_id" integer,
	"publish_date" text,
	"updated_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"_status" text DEFAULT 'draft',
	FOREIGN KEY ("og_image_id") REFERENCES "media"("id") ON UPDATE no action ON DELETE set null,
	FOREIGN KEY ("author_id") REFERENCES "users"("id") ON UPDATE no action ON DELETE set null
);
INSERT INTO actualites VALUES(1,NULL,'dossier-yake-camille-ye-et-autres-du-mouta-mouta-dans-les-marches-de-livraison-des-pagnes-du-8-mars-2024-ds',1,'2026-02-25T23:52:17.189Z','2026-02-26T01:18:54.461Z','2026-02-25T23:52:17.205Z','published');
INSERT INTO actualites VALUES(2,NULL,'burkinareajustement-du-nombre-de-plats-dans-les-restaurants-universitaires-aucun-etudiant-ne-sera-prive-de-ses-repas-quotidiens-clarifie-le-cenou',1,'2026-02-26T01:23:03.656Z','2026-02-26T01:30:08.376Z','2026-02-26T01:23:03.678Z','published');
INSERT INTO actualites VALUES(3,NULL,'burkina-faso-apres-des-scandales-de-corruption-ledile-de-la-capitale-sermonne-la-police-municipale',1,'2026-02-26T01:30:38.874Z','2026-02-26T01:33:51.662Z','2026-02-26T01:30:38.889Z','published');
CREATE TABLE "actualites_locales" (
	"title" text,
	"excerpt" text,
	"text_before_carousel" text,
	"content" text,
	"meta_title" text,
	"meta_description" text,
	"id" SERIAL PRIMARY KEY,
	"_locale" text NOT NULL,
	"_parent_id" integer NOT NULL,
	FOREIGN KEY ("_parent_id") REFERENCES "actualites"("id") ON UPDATE no action ON DELETE cascade
);
INSERT INTO actualites_locales VALUES(NULL,NULL,NULL,NULL,NULL,NULL,1,'en',1);
INSERT INTO actualites_locales VALUES('Dossier  ┬½ Yak├⌐ Camille Y├⌐ et autres ┬╗ : Du ┬½ mouta mouta ┬╗* dans les march├⌐s de livraison des pagnes du 8-mars 2024 ? ds',NULL,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"LΓÇÖaudience sur le ┬½┬ádossier Yak├⌐ Camille Y├⌐ et autres┬á┬╗ sΓÇÖest poursuivie ce mercredi 25 f├⌐vrier 2026 devant le Tribunal de grande instance Ouaga I. La journ├⌐e a quasiment ├⌐t├⌐ consacr├⌐e aux prestations relatives ├á la fourniture des pagnes du 8-mars 2024.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"LΓÇÖaudience a ├⌐t├⌐ ouverte par la d├⌐position du directeur g├⌐n├⌐ral des ├⌐tudes et des statistiques sectorielles (DGESS) au moment des faits, Ousmane Belem, entendu en qualit├⌐ de t├⌐moin. Son passage visait ainsi ├á ├⌐clairer le Tribunal, par ├⌐galement une confrontation avec des d├⌐clarations du pr├⌐venu Yak├⌐ Camille Y├⌐. LΓÇÖint├⌐r├¬t du Tribunal a donc port├⌐ sur le processus dΓÇÖ├⌐laboration du rapport annuel de performance 2023 et du budget sensible au genre. Ces deux activit├⌐s ont jusque-l├á cristallis├⌐ les d├⌐bats, en ce sens que cΓÇÖest autour de celles-ci ├⌐galement que de lΓÇÖargent a ├⌐t├⌐ d├⌐falqu├⌐ pour \"r├⌐tributions\".","type":"text","version":1},{"type":"linebreak","version":1},{"type":"linebreak","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"type":"upload","version":3,"format":"","id":"699f8eb837373664a5da909e","fields":null,"relationTo":"media","value":1},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Sur quelles bases┬á? Explication┬á!","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"En effet, pendant que les pr├⌐venus (Yak├⌐ Camille Y├⌐, Lydie Bonkoungou, Issiaka Sangar├⌐ et Kouka Dimanche Yam├⌐ogo) ont reconnu que ces deux activit├⌐s ont ├⌐t├⌐ ex├⌐cut├⌐es sans des Termes de r├⌐f├⌐rence (TDR) et un arr├¬t├⌐ portant mise en place de comit├⌐s comme cela a ├⌐t├⌐ proc├⌐d├⌐, M.┬áBelem affirme que les TDR existent (le Tribunal a demand├⌐ ├á ce quΓÇÖil produise lesdits documents pour lΓÇÖensemble des parties).","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Il explique que les TDR sont ├⌐labor├⌐s par la DGESS, tout en sollicitant la direction de la gestion financi├¿re pour la partie li├⌐e aux ressources financi├¿res (ce qui corrobore la d├⌐claration de Yak├⌐ Camille Y├⌐ sur ce point).","type":"text","version":1},{"type":"linebreak","version":1},{"detail":0,"format":0,"mode":"normal","style":"","text":"Un autre point de divergence concerne la dur├⌐e des travaux. Durant leur passage, les pr├⌐venus sus-r├⌐f├⌐r├⌐s ont tous d├⌐clar├⌐ que la dur├⌐e impartie ├⌐tait dΓÇÖun mois. Mais, selon le t├⌐moin Belem, les travaux ont dur├⌐ une semaine (ce que confirme une des pi├¿ces du dossier pr├⌐sent├⌐es par le Tribunal). Tout comme les pr├⌐venus, le DGESS Ousmane Belem a confi├⌐ que chaque participant a re├ºu une r├⌐tribution de 300 000 FCFA.","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1,"textFormat":1}}',NULL,NULL,2,'fr',1);
INSERT INTO actualites_locales VALUES(NULL,NULL,NULL,NULL,NULL,NULL,3,'en',2);
INSERT INTO actualites_locales VALUES('Burkina/R├⌐ajustement du nombre de plats dans les restaurants universitaires : ┬½ Aucun ├⌐tudiant ne sera priv├⌐ de ses repas quotidiens ┬╗, clarifie le CENOU',NULL,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Dans un communiqu├⌐ sorti le 11 f├⌐vrier 2026, le Centre national des ┼ôuvres universitaires (CENOU), annon├ºait la r├⌐duction du nombre de plats servis dans les restaurants universitaires. Cette annonce a provoqu├⌐ une vague dΓÇÖincompr├⌐hensions notamment au sein de la communaut├⌐ estudiantine.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Face ├á une pression croissante sur les services de restauration, li├⌐e notamment ├á lΓÇÖaugmentation continue du nombre dΓÇÖ├⌐tudiants et aux r├⌐percussions de la crise s├⌐curitaire sur les familles, le CENOU a affirm├⌐ avoir ├⌐t├⌐ confront├⌐ ├á un choix entre accro├«tre davantage lΓÇÖoffre ou r├⌐guler la demande. Si des efforts budg├⌐taires et organisationnels sont engag├⌐s pour renforcer lΓÇÖoffre, lΓÇÖinstitution a ├⌐galement opt├⌐ pour une mesure de r├⌐gulation.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"┬áFace ├á cette situation exceptionnelle, nous avons deux leviers┬á: augmenter lΓÇÖoffre et/ou r├⌐guler la demande de mani├¿re ├⌐quitable. C├┤t├⌐ offre, lΓÇÖ├ëtat a consenti des efforts historiques et croissants dont le remboursement massif des dettes (plus de 2 milliards de FCFA en 2023 pour les deux plus grands restaurants universitaires)┬á; lΓÇÖaugmentation substantielle des budgets de la restauration┬á: 6,96 milliards de FCFA en 2022, 7,8 milliards en 2023, 8,4 milliards en 2024, 9 milliards en 2025 et 9,6 milliards de FCFA en 2026 (soit 93,6┬á% de la subvention totale vers├⌐e par lΓÇÖEtat)┬á; des efforts suppl├⌐mentaires exceptionnels pour la normalisation des ann├⌐es acad├⌐miques (1,1 milliard en 2024 et 790 millions en 2025 pour la restauration en ao├╗t et septembre, p├⌐riode de vacances universitaires). Malgr├⌐ ces investissements consid├⌐rables, la pression reste tr├¿s forte┬á: certains restaurants enregistrent des d├⌐passements (230 millions de FCFA de reste ├á payer en 2025, par exemple), mena├ºant ainsi la p├⌐rennit├⌐ du service. C├┤t├⌐ demande, nous avons opt├⌐ pour une mesure de r├⌐├⌐quilibrage solidaire. En effet, pour quΓÇÖaucun nouvel ├⌐tudiant, aucun fr├¿re ou s┼ôur arriv├⌐ r├⌐cemment de zones en crise, ne se retrouve sans ticket, nous avons ajust├⌐ le plafond ├á 65 repas┬á┬╗, a expliqu├⌐ le directeur g├⌐n├⌐ral, No├½l Thiombiano.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}',NULL,NULL,4,'fr',2);
INSERT INTO actualites_locales VALUES(NULL,NULL,NULL,NULL,NULL,NULL,5,'en',3);
INSERT INTO actualites_locales VALUES('Burkina Faso : Apr├¿s des scandales de corruption, lΓÇÖ├⌐dile de la Capitale sermonne la Police municipale',NULL,'{"root":{"children":[{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Au cours de la traditionnelle mont├⌐e des couleurs, ce mardi 24 f├⌐vrier 2026, ├á Ouagadougou, le pr├⌐sident de la d├⌐l├⌐gation sp├⌐ciale, Maurice Konat├⌐, sΓÇÖest adress├⌐ aux ├⌐l├⌐ments de la Police municipale apr├¿s les r├⌐cents faits de corruption, notamment lors de la sortie terrain du KORAG o├╣ deux policiers municipaux ont ├⌐t├⌐ pris en flagrant d├⌐lit de corruption, des faits qui jettent un discr├⌐dit sur lΓÇÖinstitution.┬á","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":1,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1,"textFormat":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Il a poursuivi : ΓÇ£","type":"text","version":1},{"detail":0,"format":3,"mode":"normal","style":"","text":"Tout de suite quand le KORAG a fait sa sortie, la Police municipale ├⌐tait encore au premier plan. Je rentre la nuit, je ne dors pas. Je ne sais pas ce quΓÇÖil faut faire. On est 975 policiers municipaux, disons 1000. Prenez m├¬me seulement le salaire dΓÇÖun seul policier municipal dans le budget de la commune. Prenez les 1000, prenez leur habillement (ΓÇª).","type":"text","version":1}],"direction":null,"format":"justify","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":3,"mode":"normal","style":"","text":"Regardez aujourdΓÇÖhui ce que lΓÇÖEtat est en train de faire pour rendre cette institution Police municipale digne de son nom. Ils sont arm├⌐s, vous avez des v├⌐hicules, on vous accorde m├¬me un certain nombre de droits que vous nΓÇÖaviez jamais eus","type":"text","version":1},{"detail":0,"format":0,"mode":"normal","style":"","text":"ΓÇ¥.","type":"text","version":1}],"direction":null,"format":"justify","indent":0,"type":"paragraph","version":1,"textFormat":3,"textStyle":""},{"children":[],"direction":null,"format":"justify","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"type":"upload","version":3,"format":"","id":"699fa2f89f286f0ccb77f531","fields":null,"relationTo":"media","value":5},{"children":[],"direction":null,"format":"justify","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}',NULL,NULL,6,'fr',3);
CREATE TABLE "actualites_rels" (
	"id" SERIAL PRIMARY KEY,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" text NOT NULL,
	"categories_id" integer,
	"tags_id" integer,
	FOREIGN KEY ("parent_id") REFERENCES "actualites"("id") ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY ("categories_id") REFERENCES "categories"("id") ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY ("tags_id") REFERENCES "tags"("id") ON UPDATE no action ON DELETE cascade
);
CREATE TABLE "_actualites_v_version_carousel" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" SERIAL PRIMARY KEY,
	"image_id" integer,
	"_uuid" text,
	FOREIGN KEY ("image_id") REFERENCES "media"("id") ON UPDATE no action ON DELETE set null,
	FOREIGN KEY ("_parent_id") REFERENCES "_actualites_v"("id") ON UPDATE no action ON DELETE cascade
);
INSERT INTO _actualites_v_version_carousel VALUES(1,9,1,2,'699fa14effd8067f3fa46daa');
INSERT INTO _actualites_v_version_carousel VALUES(2,9,2,3,'699fa17affd8067f3fa46dac');
INSERT INTO _actualites_v_version_carousel VALUES(3,9,3,4,'699fa18cffd8067f3fa46dae');
INSERT INTO _actualites_v_version_carousel VALUES(1,10,4,2,'699fa14effd8067f3fa46daa');
INSERT INTO _actualites_v_version_carousel VALUES(2,10,5,3,'699fa17affd8067f3fa46dac');
INSERT INTO _actualites_v_version_carousel VALUES(3,10,6,4,'699fa18cffd8067f3fa46dae');
CREATE TABLE "_actualites_v_version_carousel_locales" (
	"caption" text,
	"id" SERIAL PRIMARY KEY,
	"_locale" text NOT NULL,
	"_parent_id" integer NOT NULL,
	FOREIGN KEY ("_parent_id") REFERENCES "_actualites_v_version_carousel"("id") ON UPDATE no action ON DELETE cascade
);
INSERT INTO _actualites_v_version_carousel_locales VALUES('',1,'fr',3);
INSERT INTO _actualites_v_version_carousel_locales VALUES(NULL,2,'en',4);
INSERT INTO _actualites_v_version_carousel_locales VALUES(NULL,3,'fr',4);
INSERT INTO _actualites_v_version_carousel_locales VALUES(NULL,4,'en',5);
INSERT INTO _actualites_v_version_carousel_locales VALUES(NULL,5,'fr',5);
INSERT INTO _actualites_v_version_carousel_locales VALUES('',6,'fr',6);
CREATE TABLE "_actualites_v" (
	"id" SERIAL PRIMARY KEY,
	"parent_id" integer,
	"version_og_image_id" integer,
	"version_slug" text,
	"version_author_id" integer,
	"version_publish_date" text,
	"version_updated_at" text,
	"version_created_at" text,
	"version__status" text DEFAULT 'draft',
	"created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"updated_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"snapshot" integer,
	"published_locale" text,
	"latest" integer,
	"autosave" integer,
	FOREIGN KEY ("parent_id") REFERENCES "actualites"("id") ON UPDATE no action ON DELETE set null,
	FOREIGN KEY ("version_og_image_id") REFERENCES "media"("id") ON UPDATE no action ON DELETE set null,
	FOREIGN KEY ("version_author_id") REFERENCES "users"("id") ON UPDATE no action ON DELETE set null
);
INSERT INTO _actualites_v VALUES(1,1,NULL,NULL,1,'2026-02-25T23:52:17.189Z','2026-02-25T23:52:17.206Z','2026-02-25T23:52:17.205Z','draft','2026-02-25T23:52:17.220Z','2026-02-25T23:52:17.220Z',NULL,NULL,0,0);
INSERT INTO _actualites_v VALUES(2,1,NULL,'Dossier ┬½ Yak├⌐ Camille Y├⌐ et autres ┬╗ : Du ┬½ mouta mouta ┬╗* dans les march├⌐s de livraison des pagnes du 8-mars 2024 ?',1,'2026-02-25T23:52:17.189Z','2026-02-26T00:10:27.360Z','2026-02-25T23:52:17.205Z','draft','2026-02-26T00:01:57.669Z','2026-02-26T00:10:27.360Z',NULL,NULL,0,1);
INSERT INTO _actualites_v VALUES(3,1,NULL,'Dossier ┬½ Yak├⌐ Camille Y├⌐ et autres ┬╗ : Du ┬½ mouta mouta ┬╗* dans les march├⌐s de livraison des pagnes du 8-mars 2024 ?',1,'2026-02-25T23:52:17.189Z','2026-02-26T00:10:41.390Z','2026-02-25T23:52:17.205Z','published','2026-02-26T00:10:41.440Z','2026-02-26T00:10:41.440Z',NULL,NULL,0,0);
INSERT INTO _actualites_v VALUES(4,1,NULL,'Dossier',1,'2026-02-25T23:52:17.189Z','2026-02-26T00:57:31.275Z','2026-02-25T23:52:17.205Z','draft','2026-02-26T00:57:19.975Z','2026-02-26T00:57:31.275Z',NULL,NULL,0,1);
INSERT INTO _actualites_v VALUES(5,1,NULL,'Dossier',1,'2026-02-25T23:52:17.189Z','2026-02-26T00:57:39.059Z','2026-02-25T23:52:17.205Z','published','2026-02-26T00:57:39.101Z','2026-02-26T00:57:39.101Z',NULL,NULL,0,0);
INSERT INTO _actualites_v VALUES(6,1,NULL,'dossier-yake-camille-ye-et-autres-du-mouta-mouta-dans-les-marches-de-livraison-des-pagnes-du-8-mars-2024-ds',1,'2026-02-25T23:52:17.189Z','2026-02-26T01:18:30.657Z','2026-02-25T23:52:17.205Z','draft','2026-02-26T00:57:58.632Z','2026-02-26T01:18:30.657Z',NULL,NULL,0,1);
INSERT INTO _actualites_v VALUES(7,1,NULL,'dossier-yake-camille-ye-et-autres-du-mouta-mouta-dans-les-marches-de-livraison-des-pagnes-du-8-mars-2024-ds',1,'2026-02-25T23:52:17.189Z','2026-02-26T01:18:54.461Z','2026-02-25T23:52:17.205Z','published','2026-02-26T01:18:54.512Z','2026-02-26T01:18:54.512Z',NULL,NULL,1,0);
INSERT INTO _actualites_v VALUES(8,2,NULL,NULL,1,'2026-02-26T01:23:03.656Z','2026-02-26T01:23:03.680Z','2026-02-26T01:23:03.678Z','draft','2026-02-26T01:23:03.706Z','2026-02-26T01:23:03.706Z',NULL,NULL,0,0);
INSERT INTO _actualites_v VALUES(9,2,NULL,'burkinareajustement-du-nombre-de-plats-dans-les-restaurants-universitaires-aucun-etudiant-ne-sera-prive-de-ses-repas-quotidiens-clarifie-le-cenou',1,'2026-02-26T01:23:03.656Z','2026-02-26T01:30:02.675Z','2026-02-26T01:23:03.678Z','draft','2026-02-26T01:24:28.118Z','2026-02-26T01:30:02.675Z',NULL,NULL,0,1);
INSERT INTO _actualites_v VALUES(10,2,NULL,'burkinareajustement-du-nombre-de-plats-dans-les-restaurants-universitaires-aucun-etudiant-ne-sera-prive-de-ses-repas-quotidiens-clarifie-le-cenou',1,'2026-02-26T01:23:03.656Z','2026-02-26T01:30:08.376Z','2026-02-26T01:23:03.678Z','published','2026-02-26T01:30:08.438Z','2026-02-26T01:30:08.438Z',NULL,NULL,1,0);
INSERT INTO _actualites_v VALUES(11,3,NULL,NULL,1,'2026-02-26T01:30:38.874Z','2026-02-26T01:30:38.889Z','2026-02-26T01:30:38.889Z','draft','2026-02-26T01:30:38.906Z','2026-02-26T01:30:38.906Z',NULL,NULL,0,0);
INSERT INTO _actualites_v VALUES(12,3,NULL,'burkina-faso-apres-des-scandales-de-corruption-ledile-de-la-capitale-sermonne-la-police-municipale',1,'2026-02-26T01:30:38.874Z','2026-02-26T01:33:45.822Z','2026-02-26T01:30:38.889Z','draft','2026-02-26T01:30:59.069Z','2026-02-26T01:33:45.822Z',NULL,NULL,0,1);
INSERT INTO _actualites_v VALUES(13,3,NULL,'burkina-faso-apres-des-scandales-de-corruption-ledile-de-la-capitale-sermonne-la-police-municipale',1,'2026-02-26T01:30:38.874Z','2026-02-26T01:33:51.662Z','2026-02-26T01:30:38.889Z','published','2026-02-26T01:33:51.706Z','2026-02-26T01:33:51.706Z',NULL,NULL,1,0);
CREATE TABLE "_actualites_v_locales" (
	"version_title" text,
	"version_excerpt" text,
	"version_text_before_carousel" text,
	"version_content" text,
	"version_meta_title" text,
	"version_meta_description" text,
	"id" SERIAL PRIMARY KEY,
	"_locale" text NOT NULL,
	"_parent_id" integer NOT NULL,
	FOREIGN KEY ("_parent_id") REFERENCES "_actualites_v"("id") ON UPDATE no action ON DELETE cascade
);
INSERT INTO _actualites_v_locales VALUES(NULL,NULL,NULL,NULL,NULL,NULL,1,'en',1);
INSERT INTO _actualites_v_locales VALUES(NULL,NULL,NULL,NULL,NULL,NULL,2,'fr',1);
INSERT INTO _actualites_v_locales VALUES(NULL,NULL,NULL,NULL,NULL,NULL,3,'en',2);
INSERT INTO _actualites_v_locales VALUES('Dossier ┬½ Yak├⌐ Camille Y├⌐ et autres ┬╗ : Du ┬½ mouta mouta ┬╗* dans les march├⌐s de livraison des pagnes du 8-mars 2024 ?',NULL,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"LΓÇÖaudience sur le ┬½┬ádossier Yak├⌐ Camille Y├⌐ et autres┬á┬╗ sΓÇÖest poursuivie ce mercredi 25 f├⌐vrier 2026 devant le Tribunal de grande instance Ouaga I. La journ├⌐e a quasiment ├⌐t├⌐ consacr├⌐e aux prestations relatives ├á la fourniture des pagnes du 8-mars 2024.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"LΓÇÖaudience a ├⌐t├⌐ ouverte par la d├⌐position du directeur g├⌐n├⌐ral des ├⌐tudes et des statistiques sectorielles (DGESS) au moment des faits, Ousmane Belem, entendu en qualit├⌐ de t├⌐moin. Son passage visait ainsi ├á ├⌐clairer le Tribunal, par ├⌐galement une confrontation avec des d├⌐clarations du pr├⌐venu Yak├⌐ Camille Y├⌐. LΓÇÖint├⌐r├¬t du Tribunal a donc port├⌐ sur le processus dΓÇÖ├⌐laboration du rapport annuel de performance 2023 et du budget sensible au genre. Ces deux activit├⌐s ont jusque-l├á cristallis├⌐ les d├⌐bats, en ce sens que cΓÇÖest autour de celles-ci ├⌐galement que de lΓÇÖargent a ├⌐t├⌐ d├⌐falqu├⌐ pour \"r├⌐tributions\".","type":"text","version":1},{"type":"linebreak","version":1},{"type":"linebreak","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"type":"upload","version":3,"format":"","id":"699f8eb837373664a5da909e","fields":null,"relationTo":"media","value":1},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Sur quelles bases┬á? Explication┬á!","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"En effet, pendant que les pr├⌐venus (Yak├⌐ Camille Y├⌐, Lydie Bonkoungou, Issiaka Sangar├⌐ et Kouka Dimanche Yam├⌐ogo) ont reconnu que ces deux activit├⌐s ont ├⌐t├⌐ ex├⌐cut├⌐es sans des Termes de r├⌐f├⌐rence (TDR) et un arr├¬t├⌐ portant mise en place de comit├⌐s comme cela a ├⌐t├⌐ proc├⌐d├⌐, M.┬áBelem affirme que les TDR existent (le Tribunal a demand├⌐ ├á ce quΓÇÖil produise lesdits documents pour lΓÇÖensemble des parties).","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Il explique que les TDR sont ├⌐labor├⌐s par la DGESS, tout en sollicitant la direction de la gestion financi├¿re pour la partie li├⌐e aux ressources financi├¿res (ce qui corrobore la d├⌐claration de Yak├⌐ Camille Y├⌐ sur ce point).","type":"text","version":1},{"type":"linebreak","version":1},{"detail":0,"format":0,"mode":"normal","style":"","text":"Un autre point de divergence concerne la dur├⌐e des travaux. Durant leur passage, les pr├⌐venus sus-r├⌐f├⌐r├⌐s ont tous d├⌐clar├⌐ que la dur├⌐e impartie ├⌐tait dΓÇÖun mois. Mais, selon le t├⌐moin Belem, les travaux ont dur├⌐ une semaine (ce que confirme une des pi├¿ces du dossier pr├⌐sent├⌐es par le Tribunal). Tout comme les pr├⌐venus, le DGESS Ousmane Belem a confi├⌐ que chaque participant a re├ºu une r├⌐tribution de 300 000 FCFA.","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1,"textFormat":1}}',NULL,NULL,4,'fr',2);
INSERT INTO _actualites_v_locales VALUES(NULL,NULL,NULL,NULL,NULL,NULL,5,'en',3);
INSERT INTO _actualites_v_locales VALUES('Dossier ┬½ Yak├⌐ Camille Y├⌐ et autres ┬╗ : Du ┬½ mouta mouta ┬╗* dans les march├⌐s de livraison des pagnes du 8-mars 2024 ?',NULL,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"LΓÇÖaudience sur le ┬½┬ádossier Yak├⌐ Camille Y├⌐ et autres┬á┬╗ sΓÇÖest poursuivie ce mercredi 25 f├⌐vrier 2026 devant le Tribunal de grande instance Ouaga I. La journ├⌐e a quasiment ├⌐t├⌐ consacr├⌐e aux prestations relatives ├á la fourniture des pagnes du 8-mars 2024.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"LΓÇÖaudience a ├⌐t├⌐ ouverte par la d├⌐position du directeur g├⌐n├⌐ral des ├⌐tudes et des statistiques sectorielles (DGESS) au moment des faits, Ousmane Belem, entendu en qualit├⌐ de t├⌐moin. Son passage visait ainsi ├á ├⌐clairer le Tribunal, par ├⌐galement une confrontation avec des d├⌐clarations du pr├⌐venu Yak├⌐ Camille Y├⌐. LΓÇÖint├⌐r├¬t du Tribunal a donc port├⌐ sur le processus dΓÇÖ├⌐laboration du rapport annuel de performance 2023 et du budget sensible au genre. Ces deux activit├⌐s ont jusque-l├á cristallis├⌐ les d├⌐bats, en ce sens que cΓÇÖest autour de celles-ci ├⌐galement que de lΓÇÖargent a ├⌐t├⌐ d├⌐falqu├⌐ pour \"r├⌐tributions\".","type":"text","version":1},{"type":"linebreak","version":1},{"type":"linebreak","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"type":"upload","version":3,"format":"","id":"699f8eb837373664a5da909e","fields":null,"relationTo":"media","value":1},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Sur quelles bases┬á? Explication┬á!","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"En effet, pendant que les pr├⌐venus (Yak├⌐ Camille Y├⌐, Lydie Bonkoungou, Issiaka Sangar├⌐ et Kouka Dimanche Yam├⌐ogo) ont reconnu que ces deux activit├⌐s ont ├⌐t├⌐ ex├⌐cut├⌐es sans des Termes de r├⌐f├⌐rence (TDR) et un arr├¬t├⌐ portant mise en place de comit├⌐s comme cela a ├⌐t├⌐ proc├⌐d├⌐, M.┬áBelem affirme que les TDR existent (le Tribunal a demand├⌐ ├á ce quΓÇÖil produise lesdits documents pour lΓÇÖensemble des parties).","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Il explique que les TDR sont ├⌐labor├⌐s par la DGESS, tout en sollicitant la direction de la gestion financi├¿re pour la partie li├⌐e aux ressources financi├¿res (ce qui corrobore la d├⌐claration de Yak├⌐ Camille Y├⌐ sur ce point).","type":"text","version":1},{"type":"linebreak","version":1},{"detail":0,"format":0,"mode":"normal","style":"","text":"Un autre point de divergence concerne la dur├⌐e des travaux. Durant leur passage, les pr├⌐venus sus-r├⌐f├⌐r├⌐s ont tous d├⌐clar├⌐ que la dur├⌐e impartie ├⌐tait dΓÇÖun mois. Mais, selon le t├⌐moin Belem, les travaux ont dur├⌐ une semaine (ce que confirme une des pi├¿ces du dossier pr├⌐sent├⌐es par le Tribunal). Tout comme les pr├⌐venus, le DGESS Ousmane Belem a confi├⌐ que chaque participant a re├ºu une r├⌐tribution de 300 000 FCFA.","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1,"textFormat":1}}',NULL,NULL,6,'fr',3);
INSERT INTO _actualites_v_locales VALUES(NULL,NULL,NULL,NULL,NULL,NULL,7,'en',4);
INSERT INTO _actualites_v_locales VALUES('Dossier  ┬½ Yak├⌐ Camille Y├⌐ et autres ┬╗ : Du ┬½ mouta mouta ┬╗* dans les march├⌐s de livraison des pagnes du 8-mars 2024 ?',NULL,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"LΓÇÖaudience sur le ┬½┬ádossier Yak├⌐ Camille Y├⌐ et autres┬á┬╗ sΓÇÖest poursuivie ce mercredi 25 f├⌐vrier 2026 devant le Tribunal de grande instance Ouaga I. La journ├⌐e a quasiment ├⌐t├⌐ consacr├⌐e aux prestations relatives ├á la fourniture des pagnes du 8-mars 2024.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"LΓÇÖaudience a ├⌐t├⌐ ouverte par la d├⌐position du directeur g├⌐n├⌐ral des ├⌐tudes et des statistiques sectorielles (DGESS) au moment des faits, Ousmane Belem, entendu en qualit├⌐ de t├⌐moin. Son passage visait ainsi ├á ├⌐clairer le Tribunal, par ├⌐galement une confrontation avec des d├⌐clarations du pr├⌐venu Yak├⌐ Camille Y├⌐. LΓÇÖint├⌐r├¬t du Tribunal a donc port├⌐ sur le processus dΓÇÖ├⌐laboration du rapport annuel de performance 2023 et du budget sensible au genre. Ces deux activit├⌐s ont jusque-l├á cristallis├⌐ les d├⌐bats, en ce sens que cΓÇÖest autour de celles-ci ├⌐galement que de lΓÇÖargent a ├⌐t├⌐ d├⌐falqu├⌐ pour \"r├⌐tributions\".","type":"text","version":1},{"type":"linebreak","version":1},{"type":"linebreak","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"type":"upload","version":3,"format":"","id":"699f8eb837373664a5da909e","fields":null,"relationTo":"media","value":1},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Sur quelles bases┬á? Explication┬á!","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"En effet, pendant que les pr├⌐venus (Yak├⌐ Camille Y├⌐, Lydie Bonkoungou, Issiaka Sangar├⌐ et Kouka Dimanche Yam├⌐ogo) ont reconnu que ces deux activit├⌐s ont ├⌐t├⌐ ex├⌐cut├⌐es sans des Termes de r├⌐f├⌐rence (TDR) et un arr├¬t├⌐ portant mise en place de comit├⌐s comme cela a ├⌐t├⌐ proc├⌐d├⌐, M.┬áBelem affirme que les TDR existent (le Tribunal a demand├⌐ ├á ce quΓÇÖil produise lesdits documents pour lΓÇÖensemble des parties).","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Il explique que les TDR sont ├⌐labor├⌐s par la DGESS, tout en sollicitant la direction de la gestion financi├¿re pour la partie li├⌐e aux ressources financi├¿res (ce qui corrobore la d├⌐claration de Yak├⌐ Camille Y├⌐ sur ce point).","type":"text","version":1},{"type":"linebreak","version":1},{"detail":0,"format":0,"mode":"normal","style":"","text":"Un autre point de divergence concerne la dur├⌐e des travaux. Durant leur passage, les pr├⌐venus sus-r├⌐f├⌐r├⌐s ont tous d├⌐clar├⌐ que la dur├⌐e impartie ├⌐tait dΓÇÖun mois. Mais, selon le t├⌐moin Belem, les travaux ont dur├⌐ une semaine (ce que confirme une des pi├¿ces du dossier pr├⌐sent├⌐es par le Tribunal). Tout comme les pr├⌐venus, le DGESS Ousmane Belem a confi├⌐ que chaque participant a re├ºu une r├⌐tribution de 300 000 FCFA.","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1,"textFormat":1}}',NULL,NULL,8,'fr',4);
INSERT INTO _actualites_v_locales VALUES(NULL,NULL,NULL,NULL,NULL,NULL,9,'en',5);
INSERT INTO _actualites_v_locales VALUES('Dossier  ┬½ Yak├⌐ Camille Y├⌐ et autres ┬╗ : Du ┬½ mouta mouta ┬╗* dans les march├⌐s de livraison des pagnes du 8-mars 2024 ?',NULL,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"LΓÇÖaudience sur le ┬½┬ádossier Yak├⌐ Camille Y├⌐ et autres┬á┬╗ sΓÇÖest poursuivie ce mercredi 25 f├⌐vrier 2026 devant le Tribunal de grande instance Ouaga I. La journ├⌐e a quasiment ├⌐t├⌐ consacr├⌐e aux prestations relatives ├á la fourniture des pagnes du 8-mars 2024.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"LΓÇÖaudience a ├⌐t├⌐ ouverte par la d├⌐position du directeur g├⌐n├⌐ral des ├⌐tudes et des statistiques sectorielles (DGESS) au moment des faits, Ousmane Belem, entendu en qualit├⌐ de t├⌐moin. Son passage visait ainsi ├á ├⌐clairer le Tribunal, par ├⌐galement une confrontation avec des d├⌐clarations du pr├⌐venu Yak├⌐ Camille Y├⌐. LΓÇÖint├⌐r├¬t du Tribunal a donc port├⌐ sur le processus dΓÇÖ├⌐laboration du rapport annuel de performance 2023 et du budget sensible au genre. Ces deux activit├⌐s ont jusque-l├á cristallis├⌐ les d├⌐bats, en ce sens que cΓÇÖest autour de celles-ci ├⌐galement que de lΓÇÖargent a ├⌐t├⌐ d├⌐falqu├⌐ pour \"r├⌐tributions\".","type":"text","version":1},{"type":"linebreak","version":1},{"type":"linebreak","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"type":"upload","version":3,"format":"","id":"699f8eb837373664a5da909e","fields":null,"relationTo":"media","value":1},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Sur quelles bases┬á? Explication┬á!","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"En effet, pendant que les pr├⌐venus (Yak├⌐ Camille Y├⌐, Lydie Bonkoungou, Issiaka Sangar├⌐ et Kouka Dimanche Yam├⌐ogo) ont reconnu que ces deux activit├⌐s ont ├⌐t├⌐ ex├⌐cut├⌐es sans des Termes de r├⌐f├⌐rence (TDR) et un arr├¬t├⌐ portant mise en place de comit├⌐s comme cela a ├⌐t├⌐ proc├⌐d├⌐, M.┬áBelem affirme que les TDR existent (le Tribunal a demand├⌐ ├á ce quΓÇÖil produise lesdits documents pour lΓÇÖensemble des parties).","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Il explique que les TDR sont ├⌐labor├⌐s par la DGESS, tout en sollicitant la direction de la gestion financi├¿re pour la partie li├⌐e aux ressources financi├¿res (ce qui corrobore la d├⌐claration de Yak├⌐ Camille Y├⌐ sur ce point).","type":"text","version":1},{"type":"linebreak","version":1},{"detail":0,"format":0,"mode":"normal","style":"","text":"Un autre point de divergence concerne la dur├⌐e des travaux. Durant leur passage, les pr├⌐venus sus-r├⌐f├⌐r├⌐s ont tous d├⌐clar├⌐ que la dur├⌐e impartie ├⌐tait dΓÇÖun mois. Mais, selon le t├⌐moin Belem, les travaux ont dur├⌐ une semaine (ce que confirme une des pi├¿ces du dossier pr├⌐sent├⌐es par le Tribunal). Tout comme les pr├⌐venus, le DGESS Ousmane Belem a confi├⌐ que chaque participant a re├ºu une r├⌐tribution de 300 000 FCFA.","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1,"textFormat":1}}',NULL,NULL,10,'fr',5);
INSERT INTO _actualites_v_locales VALUES(NULL,NULL,NULL,NULL,NULL,NULL,11,'en',6);
INSERT INTO _actualites_v_locales VALUES('Dossier  ┬½ Yak├⌐ Camille Y├⌐ et autres ┬╗ : Du ┬½ mouta mouta ┬╗* dans les march├⌐s de livraison des pagnes du 8-mars 2024 ? ds',NULL,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"LΓÇÖaudience sur le ┬½┬ádossier Yak├⌐ Camille Y├⌐ et autres┬á┬╗ sΓÇÖest poursuivie ce mercredi 25 f├⌐vrier 2026 devant le Tribunal de grande instance Ouaga I. La journ├⌐e a quasiment ├⌐t├⌐ consacr├⌐e aux prestations relatives ├á la fourniture des pagnes du 8-mars 2024.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"LΓÇÖaudience a ├⌐t├⌐ ouverte par la d├⌐position du directeur g├⌐n├⌐ral des ├⌐tudes et des statistiques sectorielles (DGESS) au moment des faits, Ousmane Belem, entendu en qualit├⌐ de t├⌐moin. Son passage visait ainsi ├á ├⌐clairer le Tribunal, par ├⌐galement une confrontation avec des d├⌐clarations du pr├⌐venu Yak├⌐ Camille Y├⌐. LΓÇÖint├⌐r├¬t du Tribunal a donc port├⌐ sur le processus dΓÇÖ├⌐laboration du rapport annuel de performance 2023 et du budget sensible au genre. Ces deux activit├⌐s ont jusque-l├á cristallis├⌐ les d├⌐bats, en ce sens que cΓÇÖest autour de celles-ci ├⌐galement que de lΓÇÖargent a ├⌐t├⌐ d├⌐falqu├⌐ pour \"r├⌐tributions\".","type":"text","version":1},{"type":"linebreak","version":1},{"type":"linebreak","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"type":"upload","version":3,"format":"","id":"699f8eb837373664a5da909e","fields":null,"relationTo":"media","value":1},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Sur quelles bases┬á? Explication┬á!","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"En effet, pendant que les pr├⌐venus (Yak├⌐ Camille Y├⌐, Lydie Bonkoungou, Issiaka Sangar├⌐ et Kouka Dimanche Yam├⌐ogo) ont reconnu que ces deux activit├⌐s ont ├⌐t├⌐ ex├⌐cut├⌐es sans des Termes de r├⌐f├⌐rence (TDR) et un arr├¬t├⌐ portant mise en place de comit├⌐s comme cela a ├⌐t├⌐ proc├⌐d├⌐, M.┬áBelem affirme que les TDR existent (le Tribunal a demand├⌐ ├á ce quΓÇÖil produise lesdits documents pour lΓÇÖensemble des parties).","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Il explique que les TDR sont ├⌐labor├⌐s par la DGESS, tout en sollicitant la direction de la gestion financi├¿re pour la partie li├⌐e aux ressources financi├¿res (ce qui corrobore la d├⌐claration de Yak├⌐ Camille Y├⌐ sur ce point).","type":"text","version":1},{"type":"linebreak","version":1},{"detail":0,"format":0,"mode":"normal","style":"","text":"Un autre point de divergence concerne la dur├⌐e des travaux. Durant leur passage, les pr├⌐venus sus-r├⌐f├⌐r├⌐s ont tous d├⌐clar├⌐ que la dur├⌐e impartie ├⌐tait dΓÇÖun mois. Mais, selon le t├⌐moin Belem, les travaux ont dur├⌐ une semaine (ce que confirme une des pi├¿ces du dossier pr├⌐sent├⌐es par le Tribunal). Tout comme les pr├⌐venus, le DGESS Ousmane Belem a confi├⌐ que chaque participant a re├ºu une r├⌐tribution de 300 000 FCFA.","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1,"textFormat":1}}',NULL,NULL,12,'fr',6);
INSERT INTO _actualites_v_locales VALUES(NULL,NULL,NULL,NULL,NULL,NULL,13,'en',7);
INSERT INTO _actualites_v_locales VALUES('Dossier  ┬½ Yak├⌐ Camille Y├⌐ et autres ┬╗ : Du ┬½ mouta mouta ┬╗* dans les march├⌐s de livraison des pagnes du 8-mars 2024 ? ds',NULL,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"LΓÇÖaudience sur le ┬½┬ádossier Yak├⌐ Camille Y├⌐ et autres┬á┬╗ sΓÇÖest poursuivie ce mercredi 25 f├⌐vrier 2026 devant le Tribunal de grande instance Ouaga I. La journ├⌐e a quasiment ├⌐t├⌐ consacr├⌐e aux prestations relatives ├á la fourniture des pagnes du 8-mars 2024.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"LΓÇÖaudience a ├⌐t├⌐ ouverte par la d├⌐position du directeur g├⌐n├⌐ral des ├⌐tudes et des statistiques sectorielles (DGESS) au moment des faits, Ousmane Belem, entendu en qualit├⌐ de t├⌐moin. Son passage visait ainsi ├á ├⌐clairer le Tribunal, par ├⌐galement une confrontation avec des d├⌐clarations du pr├⌐venu Yak├⌐ Camille Y├⌐. LΓÇÖint├⌐r├¬t du Tribunal a donc port├⌐ sur le processus dΓÇÖ├⌐laboration du rapport annuel de performance 2023 et du budget sensible au genre. Ces deux activit├⌐s ont jusque-l├á cristallis├⌐ les d├⌐bats, en ce sens que cΓÇÖest autour de celles-ci ├⌐galement que de lΓÇÖargent a ├⌐t├⌐ d├⌐falqu├⌐ pour \"r├⌐tributions\".","type":"text","version":1},{"type":"linebreak","version":1},{"type":"linebreak","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"type":"upload","version":3,"format":"","id":"699f8eb837373664a5da909e","fields":null,"relationTo":"media","value":1},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Sur quelles bases┬á? Explication┬á!","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"En effet, pendant que les pr├⌐venus (Yak├⌐ Camille Y├⌐, Lydie Bonkoungou, Issiaka Sangar├⌐ et Kouka Dimanche Yam├⌐ogo) ont reconnu que ces deux activit├⌐s ont ├⌐t├⌐ ex├⌐cut├⌐es sans des Termes de r├⌐f├⌐rence (TDR) et un arr├¬t├⌐ portant mise en place de comit├⌐s comme cela a ├⌐t├⌐ proc├⌐d├⌐, M.┬áBelem affirme que les TDR existent (le Tribunal a demand├⌐ ├á ce quΓÇÖil produise lesdits documents pour lΓÇÖensemble des parties).","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Il explique que les TDR sont ├⌐labor├⌐s par la DGESS, tout en sollicitant la direction de la gestion financi├¿re pour la partie li├⌐e aux ressources financi├¿res (ce qui corrobore la d├⌐claration de Yak├⌐ Camille Y├⌐ sur ce point).","type":"text","version":1},{"type":"linebreak","version":1},{"detail":0,"format":0,"mode":"normal","style":"","text":"Un autre point de divergence concerne la dur├⌐e des travaux. Durant leur passage, les pr├⌐venus sus-r├⌐f├⌐r├⌐s ont tous d├⌐clar├⌐ que la dur├⌐e impartie ├⌐tait dΓÇÖun mois. Mais, selon le t├⌐moin Belem, les travaux ont dur├⌐ une semaine (ce que confirme une des pi├¿ces du dossier pr├⌐sent├⌐es par le Tribunal). Tout comme les pr├⌐venus, le DGESS Ousmane Belem a confi├⌐ que chaque participant a re├ºu une r├⌐tribution de 300 000 FCFA.","type":"text","version":1}],"direction":null,"format":"start","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1,"textFormat":1}}',NULL,NULL,14,'fr',7);
INSERT INTO _actualites_v_locales VALUES(NULL,NULL,NULL,NULL,NULL,NULL,15,'en',8);
INSERT INTO _actualites_v_locales VALUES(NULL,NULL,NULL,NULL,NULL,NULL,16,'fr',8);
INSERT INTO _actualites_v_locales VALUES(NULL,NULL,NULL,NULL,NULL,NULL,17,'en',9);
INSERT INTO _actualites_v_locales VALUES('Burkina/R├⌐ajustement du nombre de plats dans les restaurants universitaires : ┬½ Aucun ├⌐tudiant ne sera priv├⌐ de ses repas quotidiens ┬╗, clarifie le CENOU',NULL,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Dans un communiqu├⌐ sorti le 11 f├⌐vrier 2026, le Centre national des ┼ôuvres universitaires (CENOU), annon├ºait la r├⌐duction du nombre de plats servis dans les restaurants universitaires. Cette annonce a provoqu├⌐ une vague dΓÇÖincompr├⌐hensions notamment au sein de la communaut├⌐ estudiantine.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Face ├á une pression croissante sur les services de restauration, li├⌐e notamment ├á lΓÇÖaugmentation continue du nombre dΓÇÖ├⌐tudiants et aux r├⌐percussions de la crise s├⌐curitaire sur les familles, le CENOU a affirm├⌐ avoir ├⌐t├⌐ confront├⌐ ├á un choix entre accro├«tre davantage lΓÇÖoffre ou r├⌐guler la demande. Si des efforts budg├⌐taires et organisationnels sont engag├⌐s pour renforcer lΓÇÖoffre, lΓÇÖinstitution a ├⌐galement opt├⌐ pour une mesure de r├⌐gulation.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"┬áFace ├á cette situation exceptionnelle, nous avons deux leviers┬á: augmenter lΓÇÖoffre et/ou r├⌐guler la demande de mani├¿re ├⌐quitable. C├┤t├⌐ offre, lΓÇÖ├ëtat a consenti des efforts historiques et croissants dont le remboursement massif des dettes (plus de 2 milliards de FCFA en 2023 pour les deux plus grands restaurants universitaires)┬á; lΓÇÖaugmentation substantielle des budgets de la restauration┬á: 6,96 milliards de FCFA en 2022, 7,8 milliards en 2023, 8,4 milliards en 2024, 9 milliards en 2025 et 9,6 milliards de FCFA en 2026 (soit 93,6┬á% de la subvention totale vers├⌐e par lΓÇÖEtat)┬á; des efforts suppl├⌐mentaires exceptionnels pour la normalisation des ann├⌐es acad├⌐miques (1,1 milliard en 2024 et 790 millions en 2025 pour la restauration en ao├╗t et septembre, p├⌐riode de vacances universitaires). Malgr├⌐ ces investissements consid├⌐rables, la pression reste tr├¿s forte┬á: certains restaurants enregistrent des d├⌐passements (230 millions de FCFA de reste ├á payer en 2025, par exemple), mena├ºant ainsi la p├⌐rennit├⌐ du service. C├┤t├⌐ demande, nous avons opt├⌐ pour une mesure de r├⌐├⌐quilibrage solidaire. En effet, pour quΓÇÖaucun nouvel ├⌐tudiant, aucun fr├¿re ou s┼ôur arriv├⌐ r├⌐cemment de zones en crise, ne se retrouve sans ticket, nous avons ajust├⌐ le plafond ├á 65 repas┬á┬╗, a expliqu├⌐ le directeur g├⌐n├⌐ral, No├½l Thiombiano.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}',NULL,NULL,18,'fr',9);
INSERT INTO _actualites_v_locales VALUES(NULL,NULL,NULL,NULL,NULL,NULL,19,'en',10);
INSERT INTO _actualites_v_locales VALUES('Burkina/R├⌐ajustement du nombre de plats dans les restaurants universitaires : ┬½ Aucun ├⌐tudiant ne sera priv├⌐ de ses repas quotidiens ┬╗, clarifie le CENOU',NULL,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Dans un communiqu├⌐ sorti le 11 f├⌐vrier 2026, le Centre national des ┼ôuvres universitaires (CENOU), annon├ºait la r├⌐duction du nombre de plats servis dans les restaurants universitaires. Cette annonce a provoqu├⌐ une vague dΓÇÖincompr├⌐hensions notamment au sein de la communaut├⌐ estudiantine.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Face ├á une pression croissante sur les services de restauration, li├⌐e notamment ├á lΓÇÖaugmentation continue du nombre dΓÇÖ├⌐tudiants et aux r├⌐percussions de la crise s├⌐curitaire sur les familles, le CENOU a affirm├⌐ avoir ├⌐t├⌐ confront├⌐ ├á un choix entre accro├«tre davantage lΓÇÖoffre ou r├⌐guler la demande. Si des efforts budg├⌐taires et organisationnels sont engag├⌐s pour renforcer lΓÇÖoffre, lΓÇÖinstitution a ├⌐galement opt├⌐ pour une mesure de r├⌐gulation.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"┬áFace ├á cette situation exceptionnelle, nous avons deux leviers┬á: augmenter lΓÇÖoffre et/ou r├⌐guler la demande de mani├¿re ├⌐quitable. C├┤t├⌐ offre, lΓÇÖ├ëtat a consenti des efforts historiques et croissants dont le remboursement massif des dettes (plus de 2 milliards de FCFA en 2023 pour les deux plus grands restaurants universitaires)┬á; lΓÇÖaugmentation substantielle des budgets de la restauration┬á: 6,96 milliards de FCFA en 2022, 7,8 milliards en 2023, 8,4 milliards en 2024, 9 milliards en 2025 et 9,6 milliards de FCFA en 2026 (soit 93,6┬á% de la subvention totale vers├⌐e par lΓÇÖEtat)┬á; des efforts suppl├⌐mentaires exceptionnels pour la normalisation des ann├⌐es acad├⌐miques (1,1 milliard en 2024 et 790 millions en 2025 pour la restauration en ao├╗t et septembre, p├⌐riode de vacances universitaires). Malgr├⌐ ces investissements consid├⌐rables, la pression reste tr├¿s forte┬á: certains restaurants enregistrent des d├⌐passements (230 millions de FCFA de reste ├á payer en 2025, par exemple), mena├ºant ainsi la p├⌐rennit├⌐ du service. C├┤t├⌐ demande, nous avons opt├⌐ pour une mesure de r├⌐├⌐quilibrage solidaire. En effet, pour quΓÇÖaucun nouvel ├⌐tudiant, aucun fr├¿re ou s┼ôur arriv├⌐ r├⌐cemment de zones en crise, ne se retrouve sans ticket, nous avons ajust├⌐ le plafond ├á 65 repas┬á┬╗, a expliqu├⌐ le directeur g├⌐n├⌐ral, No├½l Thiombiano.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}',NULL,NULL,20,'fr',10);
INSERT INTO _actualites_v_locales VALUES(NULL,NULL,NULL,NULL,NULL,NULL,21,'en',11);
INSERT INTO _actualites_v_locales VALUES(NULL,NULL,NULL,NULL,NULL,NULL,22,'fr',11);
INSERT INTO _actualites_v_locales VALUES(NULL,NULL,NULL,NULL,NULL,NULL,23,'en',12);
INSERT INTO _actualites_v_locales VALUES('Burkina Faso : Apr├¿s des scandales de corruption, lΓÇÖ├⌐dile de la Capitale sermonne la Police municipale',NULL,'{"root":{"children":[{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Au cours de la traditionnelle mont├⌐e des couleurs, ce mardi 24 f├⌐vrier 2026, ├á Ouagadougou, le pr├⌐sident de la d├⌐l├⌐gation sp├⌐ciale, Maurice Konat├⌐, sΓÇÖest adress├⌐ aux ├⌐l├⌐ments de la Police municipale apr├¿s les r├⌐cents faits de corruption, notamment lors de la sortie terrain du KORAG o├╣ deux policiers municipaux ont ├⌐t├⌐ pris en flagrant d├⌐lit de corruption, des faits qui jettent un discr├⌐dit sur lΓÇÖinstitution.┬á","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":1,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1,"textFormat":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Il a poursuivi : ΓÇ£","type":"text","version":1},{"detail":0,"format":3,"mode":"normal","style":"","text":"Tout de suite quand le KORAG a fait sa sortie, la Police municipale ├⌐tait encore au premier plan. Je rentre la nuit, je ne dors pas. Je ne sais pas ce quΓÇÖil faut faire. On est 975 policiers municipaux, disons 1000. Prenez m├¬me seulement le salaire dΓÇÖun seul policier municipal dans le budget de la commune. Prenez les 1000, prenez leur habillement (ΓÇª).","type":"text","version":1}],"direction":null,"format":"justify","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":3,"mode":"normal","style":"","text":"Regardez aujourdΓÇÖhui ce que lΓÇÖEtat est en train de faire pour rendre cette institution Police municipale digne de son nom. Ils sont arm├⌐s, vous avez des v├⌐hicules, on vous accorde m├¬me un certain nombre de droits que vous nΓÇÖaviez jamais eus","type":"text","version":1},{"detail":0,"format":0,"mode":"normal","style":"","text":"ΓÇ¥.","type":"text","version":1}],"direction":null,"format":"justify","indent":0,"type":"paragraph","version":1,"textFormat":3,"textStyle":""},{"children":[],"direction":null,"format":"justify","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"type":"upload","version":3,"format":"","id":"699fa2f89f286f0ccb77f531","fields":null,"relationTo":"media","value":5},{"children":[],"direction":null,"format":"justify","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}',NULL,NULL,24,'fr',12);
INSERT INTO _actualites_v_locales VALUES(NULL,NULL,NULL,NULL,NULL,NULL,25,'en',13);
INSERT INTO _actualites_v_locales VALUES('Burkina Faso : Apr├¿s des scandales de corruption, lΓÇÖ├⌐dile de la Capitale sermonne la Police municipale',NULL,'{"root":{"children":[{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Au cours de la traditionnelle mont├⌐e des couleurs, ce mardi 24 f├⌐vrier 2026, ├á Ouagadougou, le pr├⌐sident de la d├⌐l├⌐gation sp├⌐ciale, Maurice Konat├⌐, sΓÇÖest adress├⌐ aux ├⌐l├⌐ments de la Police municipale apr├¿s les r├⌐cents faits de corruption, notamment lors de la sortie terrain du KORAG o├╣ deux policiers municipaux ont ├⌐t├⌐ pris en flagrant d├⌐lit de corruption, des faits qui jettent un discr├⌐dit sur lΓÇÖinstitution.┬á","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":1,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1,"textFormat":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Il a poursuivi : ΓÇ£","type":"text","version":1},{"detail":0,"format":3,"mode":"normal","style":"","text":"Tout de suite quand le KORAG a fait sa sortie, la Police municipale ├⌐tait encore au premier plan. Je rentre la nuit, je ne dors pas. Je ne sais pas ce quΓÇÖil faut faire. On est 975 policiers municipaux, disons 1000. Prenez m├¬me seulement le salaire dΓÇÖun seul policier municipal dans le budget de la commune. Prenez les 1000, prenez leur habillement (ΓÇª).","type":"text","version":1}],"direction":null,"format":"justify","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":3,"mode":"normal","style":"","text":"Regardez aujourdΓÇÖhui ce que lΓÇÖEtat est en train de faire pour rendre cette institution Police municipale digne de son nom. Ils sont arm├⌐s, vous avez des v├⌐hicules, on vous accorde m├¬me un certain nombre de droits que vous nΓÇÖaviez jamais eus","type":"text","version":1},{"detail":0,"format":0,"mode":"normal","style":"","text":"ΓÇ¥.","type":"text","version":1}],"direction":null,"format":"justify","indent":0,"type":"paragraph","version":1,"textFormat":3,"textStyle":""},{"children":[],"direction":null,"format":"justify","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"type":"upload","version":3,"format":"","id":"699fa2f89f286f0ccb77f531","fields":null,"relationTo":"media","value":5},{"children":[],"direction":null,"format":"justify","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}',NULL,NULL,26,'fr',13);
CREATE TABLE "_actualites_v_rels" (
	"id" SERIAL PRIMARY KEY,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" text NOT NULL,
	"categories_id" integer,
	"tags_id" integer,
	FOREIGN KEY ("parent_id") REFERENCES "_actualites_v"("id") ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY ("categories_id") REFERENCES "categories"("id") ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY ("tags_id") REFERENCES "tags"("id") ON UPDATE no action ON DELETE cascade
);
CREATE TABLE "payload_kv" (
	"id" SERIAL PRIMARY KEY,
	"key" text NOT NULL,
	"data" text NOT NULL
);
CREATE TABLE "payload_locked_documents" (
	"id" SERIAL PRIMARY KEY,
	"global_slug" text,
	"updated_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
CREATE TABLE "payload_locked_documents_rels" (
	"id" SERIAL PRIMARY KEY,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" text NOT NULL,
	"users_id" integer,
	"media_id" integer,
	"categories_id" integer,
	"tags_id" integer,
	"actualites_id" integer,
	FOREIGN KEY ("parent_id") REFERENCES "payload_locked_documents"("id") ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY ("users_id") REFERENCES "users"("id") ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY ("media_id") REFERENCES "media"("id") ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY ("categories_id") REFERENCES "categories"("id") ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY ("tags_id") REFERENCES "tags"("id") ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY ("actualites_id") REFERENCES "actualites"("id") ON UPDATE no action ON DELETE cascade
);
CREATE TABLE "payload_preferences" (
	"id" SERIAL PRIMARY KEY,
	"key" text,
	"value" text,
	"updated_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
INSERT INTO payload_preferences VALUES(1,'collection-users','{}','2026-02-25T23:51:36.551Z','2026-02-25T23:51:36.547Z');
INSERT INTO payload_preferences VALUES(2,'collection-media','{"editViewType":"default"}','2026-02-26T00:06:53.959Z','2026-02-25T23:51:40.711Z');
INSERT INTO payload_preferences VALUES(3,'collection-categories','{}','2026-02-25T23:51:49.005Z','2026-02-25T23:51:49.004Z');
INSERT INTO payload_preferences VALUES(4,'collection-tags','{}','2026-02-25T23:51:55.254Z','2026-02-25T23:51:55.253Z');
INSERT INTO payload_preferences VALUES(5,'collection-actualites','{"editViewType":"default","limit":10,"sort":"-publishDate"}','2026-02-26T00:07:50.418Z','2026-02-25T23:51:59.677Z');
INSERT INTO payload_preferences VALUES(6,'nav','{"open":true}','2026-02-28T15:23:53.800Z','2026-02-26T00:59:00.058Z');
CREATE TABLE "payload_preferences_rels" (
	"id" SERIAL PRIMARY KEY,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" text NOT NULL,
	"users_id" integer,
	FOREIGN KEY ("parent_id") REFERENCES "payload_preferences"("id") ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY ("users_id") REFERENCES "users"("id") ON UPDATE no action ON DELETE cascade
);
INSERT INTO payload_preferences_rels VALUES(1,NULL,1,'user',1);
INSERT INTO payload_preferences_rels VALUES(3,NULL,3,'user',1);
INSERT INTO payload_preferences_rels VALUES(4,NULL,4,'user',1);
INSERT INTO payload_preferences_rels VALUES(6,NULL,2,'user',1);
INSERT INTO payload_preferences_rels VALUES(7,NULL,5,'user',1);
INSERT INTO payload_preferences_rels VALUES(8,NULL,6,'user',1);
CREATE TABLE "payload_migrations" (
	"id" SERIAL PRIMARY KEY,
	"name" text,
	"batch" numeric,
	"updated_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
INSERT INTO payload_migrations VALUES(1,'dev',-1,'2026-02-28 23:55:40','2026-02-25T23:47:33.958Z');
CREATE INDEX "users_sessions_order_idx" ON "users_sessions" ("_order");
CREATE INDEX "users_sessions_parent_id_idx" ON "users_sessions" ("_parent_id");
CREATE INDEX "users_avatar_idx" ON "users" ("avatar_id");
CREATE INDEX "users_updated_at_idx" ON "users" ("updated_at");
CREATE INDEX "users_created_at_idx" ON "users" ("created_at");
CREATE UNIQUE INDEX "users_email_idx" ON "users" ("email");
CREATE INDEX "media_updated_at_idx" ON "media" ("updated_at");
CREATE INDEX "media_created_at_idx" ON "media" ("created_at");
CREATE UNIQUE INDEX "media_filename_idx" ON "media" ("filename");
CREATE INDEX "media_sizes_thumbnail_sizes_thumbnail_filename_idx" ON "media" ("sizes_thumbnail_filename");
CREATE INDEX "media_sizes_card_sizes_card_filename_idx" ON "media" ("sizes_card_filename");
CREATE INDEX "media_sizes_hero_sizes_hero_filename_idx" ON "media" ("sizes_hero_filename");
CREATE UNIQUE INDEX "media_locales_locale_parent_id_unique" ON "media_locales" ("_locale","_parent_id");
CREATE UNIQUE INDEX "categories_slug_idx" ON "categories" ("slug");
CREATE INDEX "categories_updated_at_idx" ON "categories" ("updated_at");
CREATE INDEX "categories_created_at_idx" ON "categories" ("created_at");
CREATE UNIQUE INDEX "categories_locales_locale_parent_id_unique" ON "categories_locales" ("_locale","_parent_id");
CREATE UNIQUE INDEX "tags_slug_idx" ON "tags" ("slug");
CREATE INDEX "tags_updated_at_idx" ON "tags" ("updated_at");
CREATE INDEX "tags_created_at_idx" ON "tags" ("created_at");
CREATE UNIQUE INDEX "tags_locales_locale_parent_id_unique" ON "tags_locales" ("_locale","_parent_id");
CREATE INDEX "actualites_carousel_order_idx" ON "actualites_carousel" ("_order");
CREATE INDEX "actualites_carousel_parent_id_idx" ON "actualites_carousel" ("_parent_id");
CREATE INDEX "actualites_carousel_image_idx" ON "actualites_carousel" ("image_id");
CREATE UNIQUE INDEX "actualites_carousel_locales_locale_parent_id_unique" ON "actualites_carousel_locales" ("_locale","_parent_id");
CREATE INDEX "actualites_og_image_idx" ON "actualites" ("og_image_id");
CREATE UNIQUE INDEX "actualites_slug_idx" ON "actualites" ("slug");
CREATE INDEX "actualites_author_idx" ON "actualites" ("author_id");
CREATE INDEX "actualites_updated_at_idx" ON "actualites" ("updated_at");
CREATE INDEX "actualites_created_at_idx" ON "actualites" ("created_at");
CREATE INDEX "actualites__status_idx" ON "actualites" ("_status");
CREATE UNIQUE INDEX "actualites_locales_locale_parent_id_unique" ON "actualites_locales" ("_locale","_parent_id");
CREATE INDEX "actualites_rels_order_idx" ON "actualites_rels" ("order");
CREATE INDEX "actualites_rels_parent_idx" ON "actualites_rels" ("parent_id");
CREATE INDEX "actualites_rels_path_idx" ON "actualites_rels" ("path");
CREATE INDEX "actualites_rels_categories_id_idx" ON "actualites_rels" ("categories_id");
CREATE INDEX "actualites_rels_tags_id_idx" ON "actualites_rels" ("tags_id");
CREATE INDEX "_actualites_v_version_carousel_order_idx" ON "_actualites_v_version_carousel" ("_order");
CREATE INDEX "_actualites_v_version_carousel_parent_id_idx" ON "_actualites_v_version_carousel" ("_parent_id");
CREATE INDEX "_actualites_v_version_carousel_image_idx" ON "_actualites_v_version_carousel" ("image_id");
CREATE UNIQUE INDEX "_actualites_v_version_carousel_locales_locale_parent_id_uniq" ON "_actualites_v_version_carousel_locales" ("_locale","_parent_id");
CREATE INDEX "_actualites_v_parent_idx" ON "_actualites_v" ("parent_id");
CREATE INDEX "_actualites_v_version_version_og_image_idx" ON "_actualites_v" ("version_og_image_id");
CREATE INDEX "_actualites_v_version_version_slug_idx" ON "_actualites_v" ("version_slug");
CREATE INDEX "_actualites_v_version_version_author_idx" ON "_actualites_v" ("version_author_id");
CREATE INDEX "_actualites_v_version_version_updated_at_idx" ON "_actualites_v" ("version_updated_at");
CREATE INDEX "_actualites_v_version_version_created_at_idx" ON "_actualites_v" ("version_created_at");
CREATE INDEX "_actualites_v_version_version__status_idx" ON "_actualites_v" ("version__status");
CREATE INDEX "_actualites_v_created_at_idx" ON "_actualites_v" ("created_at");
CREATE INDEX "_actualites_v_updated_at_idx" ON "_actualites_v" ("updated_at");
CREATE INDEX "_actualites_v_snapshot_idx" ON "_actualites_v" ("snapshot");
CREATE INDEX "_actualites_v_published_locale_idx" ON "_actualites_v" ("published_locale");
CREATE INDEX "_actualites_v_latest_idx" ON "_actualites_v" ("latest");
CREATE INDEX "_actualites_v_autosave_idx" ON "_actualites_v" ("autosave");
CREATE UNIQUE INDEX "_actualites_v_locales_locale_parent_id_unique" ON "_actualites_v_locales" ("_locale","_parent_id");
CREATE INDEX "_actualites_v_rels_order_idx" ON "_actualites_v_rels" ("order");
CREATE INDEX "_actualites_v_rels_parent_idx" ON "_actualites_v_rels" ("parent_id");
CREATE INDEX "_actualites_v_rels_path_idx" ON "_actualites_v_rels" ("path");
CREATE INDEX "_actualites_v_rels_categories_id_idx" ON "_actualites_v_rels" ("categories_id");
CREATE INDEX "_actualites_v_rels_tags_id_idx" ON "_actualites_v_rels" ("tags_id");
CREATE UNIQUE INDEX "payload_kv_key_idx" ON "payload_kv" ("key");
CREATE INDEX "payload_locked_documents_global_slug_idx" ON "payload_locked_documents" ("global_slug");
CREATE INDEX "payload_locked_documents_updated_at_idx" ON "payload_locked_documents" ("updated_at");
CREATE INDEX "payload_locked_documents_created_at_idx" ON "payload_locked_documents" ("created_at");
CREATE INDEX "payload_locked_documents_rels_order_idx" ON "payload_locked_documents_rels" ("order");
CREATE INDEX "payload_locked_documents_rels_parent_idx" ON "payload_locked_documents_rels" ("parent_id");
CREATE INDEX "payload_locked_documents_rels_path_idx" ON "payload_locked_documents_rels" ("path");
CREATE INDEX "payload_locked_documents_rels_users_id_idx" ON "payload_locked_documents_rels" ("users_id");
CREATE INDEX "payload_locked_documents_rels_media_id_idx" ON "payload_locked_documents_rels" ("media_id");
CREATE INDEX "payload_locked_documents_rels_categories_id_idx" ON "payload_locked_documents_rels" ("categories_id");
CREATE INDEX "payload_locked_documents_rels_tags_id_idx" ON "payload_locked_documents_rels" ("tags_id");
CREATE INDEX "payload_locked_documents_rels_actualites_id_idx" ON "payload_locked_documents_rels" ("actualites_id");
CREATE INDEX "payload_preferences_key_idx" ON "payload_preferences" ("key");
CREATE INDEX "payload_preferences_updated_at_idx" ON "payload_preferences" ("updated_at");
CREATE INDEX "payload_preferences_created_at_idx" ON "payload_preferences" ("created_at");
CREATE INDEX "payload_preferences_rels_order_idx" ON "payload_preferences_rels" ("order");
CREATE INDEX "payload_preferences_rels_parent_idx" ON "payload_preferences_rels" ("parent_id");
CREATE INDEX "payload_preferences_rels_path_idx" ON "payload_preferences_rels" ("path");
CREATE INDEX "payload_preferences_rels_users_id_idx" ON "payload_preferences_rels" ("users_id");
CREATE INDEX "payload_migrations_updated_at_idx" ON "payload_migrations" ("updated_at");
CREATE INDEX "payload_migrations_created_at_idx" ON "payload_migrations" ("created_at");
