{
    "type": "database",
    "name": "backup-25-02-2025-a-12h16",
    "objects": [
        {
            "type": "table",
            "database": null,
            "name": "_actualites_v",
            "withoutRowId": false,
            "strict": false,
            "ddl": "CREATE TABLE `_actualites_v` (\n\t`id` integer PRIMARY KEY NOT NULL,\n\t`parent_id` integer,\n\t`version_og_image_id` integer,\n\t`version_slug` text,\n\t`version_author_id` integer,\n\t`version_publish_date` text,\n\t`version_updated_at` text,\n\t`version_created_at` text,\n\t`version__status` text DEFAULT 'draft',\n\t`created_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,\n\t`updated_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,\n\t`snapshot` integer,\n\t`published_locale` text,\n\t`latest` integer,\n\t`autosave` integer,\n\tFOREIGN KEY (`parent_id`) REFERENCES `actualites`(`id`) ON UPDATE no action ON DELETE set null,\n\tFOREIGN KEY (`version_og_image_id`) REFERENCES `media`(`id`) ON UPDATE no action ON DELETE set null,\n\tFOREIGN KEY (`version_author_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE set null\n)",
            "columns": [
                {
                    "name": "id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "PRIMARY KEY",
                            "definition": "PRIMARY KEY "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "parent_id",
                    "type": "integer"
                },
                {
                    "name": "version_og_image_id",
                    "type": "integer"
                },
                {
                    "name": "version_slug",
                    "type": "text"
                },
                {
                    "name": "version_author_id",
                    "type": "integer"
                },
                {
                    "name": "version_publish_date",
                    "type": "text"
                },
                {
                    "name": "version_updated_at",
                    "type": "text"
                },
                {
                    "name": "version_created_at",
                    "type": "text"
                },
                {
                    "name": "version__status",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "DEFAULT",
                            "definition": "DEFAULT 'draft'"
                        }
                    ]
                },
                {
                    "name": "created_at",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "DEFAULT",
                            "definition": "DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "updated_at",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "DEFAULT",
                            "definition": "DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "snapshot",
                    "type": "integer"
                },
                {
                    "name": "published_locale",
                    "type": "text"
                },
                {
                    "name": "latest",
                    "type": "integer"
                },
                {
                    "name": "autosave",
                    "type": "integer"
                }
            ],
            "constraints": [
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`parent_id`) REFERENCES `actualites`(`id`) ON UPDATE no action ON DELETE set null"
                },
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`version_og_image_id`) REFERENCES `media`(`id`) ON UPDATE no action ON DELETE set null"
                },
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`version_author_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE set null\n"
                }
            ],
            "rows": [
                [
                    1,
                    1,
                    null,
                    null,
                    1,
                    "2026-02-25T23:52:17.189Z",
                    "2026-02-25T23:52:17.206Z",
                    "2026-02-25T23:52:17.205Z",
                    "draft",
                    "2026-02-25T23:52:17.220Z",
                    "2026-02-25T23:52:17.220Z",
                    null,
                    null,
                    0,
                    0
                ],
                [
                    2,
                    1,
                    null,
                    "Dossier « Yaké Camille Yé et autres » : Du « mouta mouta »* dans les marchés de livraison des pagnes du 8-mars 2024 ?",
                    1,
                    "2026-02-25T23:52:17.189Z",
                    "2026-02-26T00:10:27.360Z",
                    "2026-02-25T23:52:17.205Z",
                    "draft",
                    "2026-02-26T00:01:57.669Z",
                    "2026-02-26T00:10:27.360Z",
                    null,
                    null,
                    0,
                    1
                ],
                [
                    3,
                    1,
                    null,
                    "Dossier « Yaké Camille Yé et autres » : Du « mouta mouta »* dans les marchés de livraison des pagnes du 8-mars 2024 ?",
                    1,
                    "2026-02-25T23:52:17.189Z",
                    "2026-02-26T00:10:41.390Z",
                    "2026-02-25T23:52:17.205Z",
                    "published",
                    "2026-02-26T00:10:41.440Z",
                    "2026-02-26T00:10:41.440Z",
                    null,
                    null,
                    0,
                    0
                ],
                [
                    4,
                    1,
                    null,
                    "Dossier",
                    1,
                    "2026-02-25T23:52:17.189Z",
                    "2026-02-26T00:57:31.275Z",
                    "2026-02-25T23:52:17.205Z",
                    "draft",
                    "2026-02-26T00:57:19.975Z",
                    "2026-02-26T00:57:31.275Z",
                    null,
                    null,
                    0,
                    1
                ],
                [
                    5,
                    1,
                    null,
                    "Dossier",
                    1,
                    "2026-02-25T23:52:17.189Z",
                    "2026-02-26T00:57:39.059Z",
                    "2026-02-25T23:52:17.205Z",
                    "published",
                    "2026-02-26T00:57:39.101Z",
                    "2026-02-26T00:57:39.101Z",
                    null,
                    null,
                    0,
                    0
                ],
                [
                    6,
                    1,
                    null,
                    "dossier-yake-camille-ye-et-autres-du-mouta-mouta-dans-les-marches-de-livraison-des-pagnes-du-8-mars-2024-ds",
                    1,
                    "2026-02-25T23:52:17.189Z",
                    "2026-02-26T01:18:30.657Z",
                    "2026-02-25T23:52:17.205Z",
                    "draft",
                    "2026-02-26T00:57:58.632Z",
                    "2026-02-26T01:18:30.657Z",
                    null,
                    null,
                    0,
                    1
                ],
                [
                    7,
                    1,
                    null,
                    "dossier-yake-camille-ye-et-autres-du-mouta-mouta-dans-les-marches-de-livraison-des-pagnes-du-8-mars-2024-ds",
                    1,
                    "2026-02-25T23:52:17.189Z",
                    "2026-02-26T01:18:54.461Z",
                    "2026-02-25T23:52:17.205Z",
                    "published",
                    "2026-02-26T01:18:54.512Z",
                    "2026-02-26T01:18:54.512Z",
                    null,
                    null,
                    1,
                    0
                ],
                [
                    8,
                    2,
                    null,
                    null,
                    1,
                    "2026-02-26T01:23:03.656Z",
                    "2026-02-26T01:23:03.680Z",
                    "2026-02-26T01:23:03.678Z",
                    "draft",
                    "2026-02-26T01:23:03.706Z",
                    "2026-02-26T01:23:03.706Z",
                    null,
                    null,
                    0,
                    0
                ],
                [
                    9,
                    2,
                    null,
                    "burkinareajustement-du-nombre-de-plats-dans-les-restaurants-universitaires-aucun-etudiant-ne-sera-prive-de-ses-repas-quotidiens-clarifie-le-cenou",
                    1,
                    "2026-02-26T01:23:03.656Z",
                    "2026-02-26T01:30:02.675Z",
                    "2026-02-26T01:23:03.678Z",
                    "draft",
                    "2026-02-26T01:24:28.118Z",
                    "2026-02-26T01:30:02.675Z",
                    null,
                    null,
                    0,
                    1
                ],
                [
                    10,
                    2,
                    null,
                    "burkinareajustement-du-nombre-de-plats-dans-les-restaurants-universitaires-aucun-etudiant-ne-sera-prive-de-ses-repas-quotidiens-clarifie-le-cenou",
                    1,
                    "2026-02-26T01:23:03.656Z",
                    "2026-02-26T01:30:08.376Z",
                    "2026-02-26T01:23:03.678Z",
                    "published",
                    "2026-02-26T01:30:08.438Z",
                    "2026-02-26T01:30:08.438Z",
                    null,
                    null,
                    1,
                    0
                ],
                [
                    11,
                    3,
                    null,
                    null,
                    1,
                    "2026-02-26T01:30:38.874Z",
                    "2026-02-26T01:30:38.889Z",
                    "2026-02-26T01:30:38.889Z",
                    "draft",
                    "2026-02-26T01:30:38.906Z",
                    "2026-02-26T01:30:38.906Z",
                    null,
                    null,
                    0,
                    0
                ],
                [
                    12,
                    3,
                    null,
                    "burkina-faso-apres-des-scandales-de-corruption-ledile-de-la-capitale-sermonne-la-police-municipale",
                    1,
                    "2026-02-26T01:30:38.874Z",
                    "2026-02-26T01:33:45.822Z",
                    "2026-02-26T01:30:38.889Z",
                    "draft",
                    "2026-02-26T01:30:59.069Z",
                    "2026-02-26T01:33:45.822Z",
                    null,
                    null,
                    0,
                    1
                ],
                [
                    13,
                    3,
                    null,
                    "burkina-faso-apres-des-scandales-de-corruption-ledile-de-la-capitale-sermonne-la-police-municipale",
                    1,
                    "2026-02-26T01:30:38.874Z",
                    "2026-02-26T01:33:51.662Z",
                    "2026-02-26T01:30:38.889Z",
                    "published",
                    "2026-02-26T01:33:51.706Z",
                    "2026-02-26T01:33:51.706Z",
                    null,
                    null,
                    1,
                    0
                ]
            ]
        },
        {
            "type": "table",
            "database": null,
            "name": "_actualites_v_locales",
            "withoutRowId": false,
            "strict": false,
            "ddl": "CREATE TABLE `_actualites_v_locales` (\n\t`version_title` text,\n\t`version_excerpt` text,\n\t`version_text_before_carousel` text,\n\t`version_content` text,\n\t`version_meta_title` text,\n\t`version_meta_description` text,\n\t`id` integer PRIMARY KEY NOT NULL,\n\t`_locale` text NOT NULL,\n\t`_parent_id` integer NOT NULL,\n\tFOREIGN KEY (`_parent_id`) REFERENCES `_actualites_v`(`id`) ON UPDATE no action ON DELETE cascade\n)",
            "columns": [
                {
                    "name": "version_title",
                    "type": "text"
                },
                {
                    "name": "version_excerpt",
                    "type": "text"
                },
                {
                    "name": "version_text_before_carousel",
                    "type": "text"
                },
                {
                    "name": "version_content",
                    "type": "text"
                },
                {
                    "name": "version_meta_title",
                    "type": "text"
                },
                {
                    "name": "version_meta_description",
                    "type": "text"
                },
                {
                    "name": "id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "PRIMARY KEY",
                            "definition": "PRIMARY KEY "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "_locale",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "_parent_id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                }
            ],
            "constraints": [
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`_parent_id`) REFERENCES `_actualites_v`(`id`) ON UPDATE no action ON DELETE cascade\n"
                }
            ],
            "rows": [
                [
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    1,
                    "en",
                    1
                ],
                [
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    2,
                    "fr",
                    1
                ],
                [
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    3,
                    "en",
                    2
                ],
                [
                    "Dossier « Yaké Camille Yé et autres » : Du « mouta mouta »* dans les marchés de livraison des pagnes du 8-mars 2024 ?",
                    null,
                    "{\"root\":{\"children\":[{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"L’audience sur le « dossier Yaké Camille Yé et autres » s’est poursuivie ce mercredi 25 février 2026 devant le Tribunal de grande instance Ouaga I. La journée a quasiment été consacrée aux prestations relatives à la fourniture des pagnes du 8-mars 2024.\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"root\",\"version\":1}}",
                    "{\"root\":{\"children\":[{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"L’audience a été ouverte par la déposition du directeur général des études et des statistiques sectorielles (DGESS) au moment des faits, Ousmane Belem, entendu en qualité de témoin. Son passage visait ainsi à éclairer le Tribunal, par également une confrontation avec des déclarations du prévenu Yaké Camille Yé. L’intérêt du Tribunal a donc porté sur le processus d’élaboration du rapport annuel de performance 2023 et du budget sensible au genre. Ces deux activités ont jusque-là cristallisé les débats, en ce sens que c’est autour de celles-ci également que de l’argent a été défalqué pour \\\"rétributions\\\".\",\"type\":\"text\",\"version\":1},{\"type\":\"linebreak\",\"version\":1},{\"type\":\"linebreak\",\"version\":1}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"type\":\"upload\",\"version\":3,\"format\":\"\",\"id\":\"699f8eb837373664a5da909e\",\"fields\":null,\"relationTo\":\"media\",\"value\":1},{\"children\":[],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":1,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Sur quelles bases ? Explication !\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"start\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"En effet, pendant que les prévenus (Yaké Camille Yé, Lydie Bonkoungou, Issiaka Sangaré et Kouka Dimanche Yaméogo) ont reconnu que ces deux activités ont été exécutées sans des Termes de référence (TDR) et un arrêté portant mise en place de comités comme cela a été procédé, M. Belem affirme que les TDR existent (le Tribunal a demandé à ce qu’il produise lesdits documents pour l’ensemble des parties).\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"start\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Il explique que les TDR sont élaborés par la DGESS, tout en sollicitant la direction de la gestion financière pour la partie liée aux ressources financières (ce qui corrobore la déclaration de Yaké Camille Yé sur ce point).\",\"type\":\"text\",\"version\":1},{\"type\":\"linebreak\",\"version\":1},{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Un autre point de divergence concerne la durée des travaux. Durant leur passage, les prévenus sus-référés ont tous déclaré que la durée impartie était d’un mois. Mais, selon le témoin Belem, les travaux ont duré une semaine (ce que confirme une des pièces du dossier présentées par le Tribunal). Tout comme les prévenus, le DGESS Ousmane Belem a confié que chaque participant a reçu une rétribution de 300 000 FCFA.\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"start\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"root\",\"version\":1,\"textFormat\":1}}",
                    null,
                    null,
                    4,
                    "fr",
                    2
                ],
                [
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    5,
                    "en",
                    3
                ],
                [
                    "Dossier « Yaké Camille Yé et autres » : Du « mouta mouta »* dans les marchés de livraison des pagnes du 8-mars 2024 ?",
                    null,
                    "{\"root\":{\"children\":[{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"L’audience sur le « dossier Yaké Camille Yé et autres » s’est poursuivie ce mercredi 25 février 2026 devant le Tribunal de grande instance Ouaga I. La journée a quasiment été consacrée aux prestations relatives à la fourniture des pagnes du 8-mars 2024.\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"root\",\"version\":1}}",
                    "{\"root\":{\"children\":[{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"L’audience a été ouverte par la déposition du directeur général des études et des statistiques sectorielles (DGESS) au moment des faits, Ousmane Belem, entendu en qualité de témoin. Son passage visait ainsi à éclairer le Tribunal, par également une confrontation avec des déclarations du prévenu Yaké Camille Yé. L’intérêt du Tribunal a donc porté sur le processus d’élaboration du rapport annuel de performance 2023 et du budget sensible au genre. Ces deux activités ont jusque-là cristallisé les débats, en ce sens que c’est autour de celles-ci également que de l’argent a été défalqué pour \\\"rétributions\\\".\",\"type\":\"text\",\"version\":1},{\"type\":\"linebreak\",\"version\":1},{\"type\":\"linebreak\",\"version\":1}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"type\":\"upload\",\"version\":3,\"format\":\"\",\"id\":\"699f8eb837373664a5da909e\",\"fields\":null,\"relationTo\":\"media\",\"value\":1},{\"children\":[],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":1,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Sur quelles bases ? Explication !\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"start\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"En effet, pendant que les prévenus (Yaké Camille Yé, Lydie Bonkoungou, Issiaka Sangaré et Kouka Dimanche Yaméogo) ont reconnu que ces deux activités ont été exécutées sans des Termes de référence (TDR) et un arrêté portant mise en place de comités comme cela a été procédé, M. Belem affirme que les TDR existent (le Tribunal a demandé à ce qu’il produise lesdits documents pour l’ensemble des parties).\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"start\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Il explique que les TDR sont élaborés par la DGESS, tout en sollicitant la direction de la gestion financière pour la partie liée aux ressources financières (ce qui corrobore la déclaration de Yaké Camille Yé sur ce point).\",\"type\":\"text\",\"version\":1},{\"type\":\"linebreak\",\"version\":1},{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Un autre point de divergence concerne la durée des travaux. Durant leur passage, les prévenus sus-référés ont tous déclaré que la durée impartie était d’un mois. Mais, selon le témoin Belem, les travaux ont duré une semaine (ce que confirme une des pièces du dossier présentées par le Tribunal). Tout comme les prévenus, le DGESS Ousmane Belem a confié que chaque participant a reçu une rétribution de 300 000 FCFA.\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"start\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"root\",\"version\":1,\"textFormat\":1}}",
                    null,
                    null,
                    6,
                    "fr",
                    3
                ],
                [
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    7,
                    "en",
                    4
                ],
                [
                    "Dossier  « Yaké Camille Yé et autres » : Du « mouta mouta »* dans les marchés de livraison des pagnes du 8-mars 2024 ?",
                    null,
                    "{\"root\":{\"children\":[{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"L’audience sur le « dossier Yaké Camille Yé et autres » s’est poursuivie ce mercredi 25 février 2026 devant le Tribunal de grande instance Ouaga I. La journée a quasiment été consacrée aux prestations relatives à la fourniture des pagnes du 8-mars 2024.\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"root\",\"version\":1}}",
                    "{\"root\":{\"children\":[{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"L’audience a été ouverte par la déposition du directeur général des études et des statistiques sectorielles (DGESS) au moment des faits, Ousmane Belem, entendu en qualité de témoin. Son passage visait ainsi à éclairer le Tribunal, par également une confrontation avec des déclarations du prévenu Yaké Camille Yé. L’intérêt du Tribunal a donc porté sur le processus d’élaboration du rapport annuel de performance 2023 et du budget sensible au genre. Ces deux activités ont jusque-là cristallisé les débats, en ce sens que c’est autour de celles-ci également que de l’argent a été défalqué pour \\\"rétributions\\\".\",\"type\":\"text\",\"version\":1},{\"type\":\"linebreak\",\"version\":1},{\"type\":\"linebreak\",\"version\":1}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"type\":\"upload\",\"version\":3,\"format\":\"\",\"id\":\"699f8eb837373664a5da909e\",\"fields\":null,\"relationTo\":\"media\",\"value\":1},{\"children\":[],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":1,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Sur quelles bases ? Explication !\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"start\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"En effet, pendant que les prévenus (Yaké Camille Yé, Lydie Bonkoungou, Issiaka Sangaré et Kouka Dimanche Yaméogo) ont reconnu que ces deux activités ont été exécutées sans des Termes de référence (TDR) et un arrêté portant mise en place de comités comme cela a été procédé, M. Belem affirme que les TDR existent (le Tribunal a demandé à ce qu’il produise lesdits documents pour l’ensemble des parties).\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"start\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Il explique que les TDR sont élaborés par la DGESS, tout en sollicitant la direction de la gestion financière pour la partie liée aux ressources financières (ce qui corrobore la déclaration de Yaké Camille Yé sur ce point).\",\"type\":\"text\",\"version\":1},{\"type\":\"linebreak\",\"version\":1},{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Un autre point de divergence concerne la durée des travaux. Durant leur passage, les prévenus sus-référés ont tous déclaré que la durée impartie était d’un mois. Mais, selon le témoin Belem, les travaux ont duré une semaine (ce que confirme une des pièces du dossier présentées par le Tribunal). Tout comme les prévenus, le DGESS Ousmane Belem a confié que chaque participant a reçu une rétribution de 300 000 FCFA.\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"start\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"root\",\"version\":1,\"textFormat\":1}}",
                    null,
                    null,
                    8,
                    "fr",
                    4
                ],
                [
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    9,
                    "en",
                    5
                ],
                [
                    "Dossier  « Yaké Camille Yé et autres » : Du « mouta mouta »* dans les marchés de livraison des pagnes du 8-mars 2024 ?",
                    null,
                    "{\"root\":{\"children\":[{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"L’audience sur le « dossier Yaké Camille Yé et autres » s’est poursuivie ce mercredi 25 février 2026 devant le Tribunal de grande instance Ouaga I. La journée a quasiment été consacrée aux prestations relatives à la fourniture des pagnes du 8-mars 2024.\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"root\",\"version\":1}}",
                    "{\"root\":{\"children\":[{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"L’audience a été ouverte par la déposition du directeur général des études et des statistiques sectorielles (DGESS) au moment des faits, Ousmane Belem, entendu en qualité de témoin. Son passage visait ainsi à éclairer le Tribunal, par également une confrontation avec des déclarations du prévenu Yaké Camille Yé. L’intérêt du Tribunal a donc porté sur le processus d’élaboration du rapport annuel de performance 2023 et du budget sensible au genre. Ces deux activités ont jusque-là cristallisé les débats, en ce sens que c’est autour de celles-ci également que de l’argent a été défalqué pour \\\"rétributions\\\".\",\"type\":\"text\",\"version\":1},{\"type\":\"linebreak\",\"version\":1},{\"type\":\"linebreak\",\"version\":1}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"type\":\"upload\",\"version\":3,\"format\":\"\",\"id\":\"699f8eb837373664a5da909e\",\"fields\":null,\"relationTo\":\"media\",\"value\":1},{\"children\":[],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":1,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Sur quelles bases ? Explication !\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"start\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"En effet, pendant que les prévenus (Yaké Camille Yé, Lydie Bonkoungou, Issiaka Sangaré et Kouka Dimanche Yaméogo) ont reconnu que ces deux activités ont été exécutées sans des Termes de référence (TDR) et un arrêté portant mise en place de comités comme cela a été procédé, M. Belem affirme que les TDR existent (le Tribunal a demandé à ce qu’il produise lesdits documents pour l’ensemble des parties).\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"start\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Il explique que les TDR sont élaborés par la DGESS, tout en sollicitant la direction de la gestion financière pour la partie liée aux ressources financières (ce qui corrobore la déclaration de Yaké Camille Yé sur ce point).\",\"type\":\"text\",\"version\":1},{\"type\":\"linebreak\",\"version\":1},{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Un autre point de divergence concerne la durée des travaux. Durant leur passage, les prévenus sus-référés ont tous déclaré que la durée impartie était d’un mois. Mais, selon le témoin Belem, les travaux ont duré une semaine (ce que confirme une des pièces du dossier présentées par le Tribunal). Tout comme les prévenus, le DGESS Ousmane Belem a confié que chaque participant a reçu une rétribution de 300 000 FCFA.\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"start\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"root\",\"version\":1,\"textFormat\":1}}",
                    null,
                    null,
                    10,
                    "fr",
                    5
                ],
                [
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    11,
                    "en",
                    6
                ],
                [
                    "Dossier  « Yaké Camille Yé et autres » : Du « mouta mouta »* dans les marchés de livraison des pagnes du 8-mars 2024 ? ds",
                    null,
                    "{\"root\":{\"children\":[{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"L’audience sur le « dossier Yaké Camille Yé et autres » s’est poursuivie ce mercredi 25 février 2026 devant le Tribunal de grande instance Ouaga I. La journée a quasiment été consacrée aux prestations relatives à la fourniture des pagnes du 8-mars 2024.\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"root\",\"version\":1}}",
                    "{\"root\":{\"children\":[{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"L’audience a été ouverte par la déposition du directeur général des études et des statistiques sectorielles (DGESS) au moment des faits, Ousmane Belem, entendu en qualité de témoin. Son passage visait ainsi à éclairer le Tribunal, par également une confrontation avec des déclarations du prévenu Yaké Camille Yé. L’intérêt du Tribunal a donc porté sur le processus d’élaboration du rapport annuel de performance 2023 et du budget sensible au genre. Ces deux activités ont jusque-là cristallisé les débats, en ce sens que c’est autour de celles-ci également que de l’argent a été défalqué pour \\\"rétributions\\\".\",\"type\":\"text\",\"version\":1},{\"type\":\"linebreak\",\"version\":1},{\"type\":\"linebreak\",\"version\":1}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"type\":\"upload\",\"version\":3,\"format\":\"\",\"id\":\"699f8eb837373664a5da909e\",\"fields\":null,\"relationTo\":\"media\",\"value\":1},{\"children\":[],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":1,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Sur quelles bases ? Explication !\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"start\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"En effet, pendant que les prévenus (Yaké Camille Yé, Lydie Bonkoungou, Issiaka Sangaré et Kouka Dimanche Yaméogo) ont reconnu que ces deux activités ont été exécutées sans des Termes de référence (TDR) et un arrêté portant mise en place de comités comme cela a été procédé, M. Belem affirme que les TDR existent (le Tribunal a demandé à ce qu’il produise lesdits documents pour l’ensemble des parties).\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"start\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Il explique que les TDR sont élaborés par la DGESS, tout en sollicitant la direction de la gestion financière pour la partie liée aux ressources financières (ce qui corrobore la déclaration de Yaké Camille Yé sur ce point).\",\"type\":\"text\",\"version\":1},{\"type\":\"linebreak\",\"version\":1},{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Un autre point de divergence concerne la durée des travaux. Durant leur passage, les prévenus sus-référés ont tous déclaré que la durée impartie était d’un mois. Mais, selon le témoin Belem, les travaux ont duré une semaine (ce que confirme une des pièces du dossier présentées par le Tribunal). Tout comme les prévenus, le DGESS Ousmane Belem a confié que chaque participant a reçu une rétribution de 300 000 FCFA.\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"start\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"root\",\"version\":1,\"textFormat\":1}}",
                    null,
                    null,
                    12,
                    "fr",
                    6
                ],
                [
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    13,
                    "en",
                    7
                ],
                [
                    "Dossier  « Yaké Camille Yé et autres » : Du « mouta mouta »* dans les marchés de livraison des pagnes du 8-mars 2024 ? ds",
                    null,
                    "{\"root\":{\"children\":[{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"L’audience sur le « dossier Yaké Camille Yé et autres » s’est poursuivie ce mercredi 25 février 2026 devant le Tribunal de grande instance Ouaga I. La journée a quasiment été consacrée aux prestations relatives à la fourniture des pagnes du 8-mars 2024.\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"root\",\"version\":1}}",
                    "{\"root\":{\"children\":[{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"L’audience a été ouverte par la déposition du directeur général des études et des statistiques sectorielles (DGESS) au moment des faits, Ousmane Belem, entendu en qualité de témoin. Son passage visait ainsi à éclairer le Tribunal, par également une confrontation avec des déclarations du prévenu Yaké Camille Yé. L’intérêt du Tribunal a donc porté sur le processus d’élaboration du rapport annuel de performance 2023 et du budget sensible au genre. Ces deux activités ont jusque-là cristallisé les débats, en ce sens que c’est autour de celles-ci également que de l’argent a été défalqué pour \\\"rétributions\\\".\",\"type\":\"text\",\"version\":1},{\"type\":\"linebreak\",\"version\":1},{\"type\":\"linebreak\",\"version\":1}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"type\":\"upload\",\"version\":3,\"format\":\"\",\"id\":\"699f8eb837373664a5da909e\",\"fields\":null,\"relationTo\":\"media\",\"value\":1},{\"children\":[],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":1,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Sur quelles bases ? Explication !\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"start\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"En effet, pendant que les prévenus (Yaké Camille Yé, Lydie Bonkoungou, Issiaka Sangaré et Kouka Dimanche Yaméogo) ont reconnu que ces deux activités ont été exécutées sans des Termes de référence (TDR) et un arrêté portant mise en place de comités comme cela a été procédé, M. Belem affirme que les TDR existent (le Tribunal a demandé à ce qu’il produise lesdits documents pour l’ensemble des parties).\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"start\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Il explique que les TDR sont élaborés par la DGESS, tout en sollicitant la direction de la gestion financière pour la partie liée aux ressources financières (ce qui corrobore la déclaration de Yaké Camille Yé sur ce point).\",\"type\":\"text\",\"version\":1},{\"type\":\"linebreak\",\"version\":1},{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Un autre point de divergence concerne la durée des travaux. Durant leur passage, les prévenus sus-référés ont tous déclaré que la durée impartie était d’un mois. Mais, selon le témoin Belem, les travaux ont duré une semaine (ce que confirme une des pièces du dossier présentées par le Tribunal). Tout comme les prévenus, le DGESS Ousmane Belem a confié que chaque participant a reçu une rétribution de 300 000 FCFA.\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"start\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"root\",\"version\":1,\"textFormat\":1}}",
                    null,
                    null,
                    14,
                    "fr",
                    7
                ],
                [
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    15,
                    "en",
                    8
                ],
                [
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    16,
                    "fr",
                    8
                ],
                [
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    17,
                    "en",
                    9
                ],
                [
                    "Burkina\/Réajustement du nombre de plats dans les restaurants universitaires : « Aucun étudiant ne sera privé de ses repas quotidiens », clarifie le CENOU",
                    null,
                    "{\"root\":{\"children\":[{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Dans un communiqué sorti le 11 février 2026, le Centre national des œuvres universitaires (CENOU), annonçait la réduction du nombre de plats servis dans les restaurants universitaires. Cette annonce a provoqué une vague d’incompréhensions notamment au sein de la communauté estudiantine.\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"root\",\"version\":1}}",
                    "{\"root\":{\"children\":[{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Face à une pression croissante sur les services de restauration, liée notamment à l’augmentation continue du nombre d’étudiants et aux répercussions de la crise sécuritaire sur les familles, le CENOU a affirmé avoir été confronté à un choix entre accroître davantage l’offre ou réguler la demande. Si des efforts budgétaires et organisationnels sont engagés pour renforcer l’offre, l’institution a également opté pour une mesure de régulation.\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\" Face à cette situation exceptionnelle, nous avons deux leviers : augmenter l’offre et\/ou réguler la demande de manière équitable. Côté offre, l’État a consenti des efforts historiques et croissants dont le remboursement massif des dettes (plus de 2 milliards de FCFA en 2023 pour les deux plus grands restaurants universitaires) ; l’augmentation substantielle des budgets de la restauration : 6,96 milliards de FCFA en 2022, 7,8 milliards en 2023, 8,4 milliards en 2024, 9 milliards en 2025 et 9,6 milliards de FCFA en 2026 (soit 93,6 % de la subvention totale versée par l’Etat) ; des efforts supplémentaires exceptionnels pour la normalisation des années académiques (1,1 milliard en 2024 et 790 millions en 2025 pour la restauration en août et septembre, période de vacances universitaires). Malgré ces investissements considérables, la pression reste très forte : certains restaurants enregistrent des dépassements (230 millions de FCFA de reste à payer en 2025, par exemple), menaçant ainsi la pérennité du service. Côté demande, nous avons opté pour une mesure de rééquilibrage solidaire. En effet, pour qu’aucun nouvel étudiant, aucun frère ou sœur arrivé récemment de zones en crise, ne se retrouve sans ticket, nous avons ajusté le plafond à 65 repas », a expliqué le directeur général, Noël Thiombiano.\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"root\",\"version\":1}}",
                    null,
                    null,
                    18,
                    "fr",
                    9
                ],
                [
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    19,
                    "en",
                    10
                ],
                [
                    "Burkina\/Réajustement du nombre de plats dans les restaurants universitaires : « Aucun étudiant ne sera privé de ses repas quotidiens », clarifie le CENOU",
                    null,
                    "{\"root\":{\"children\":[{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Dans un communiqué sorti le 11 février 2026, le Centre national des œuvres universitaires (CENOU), annonçait la réduction du nombre de plats servis dans les restaurants universitaires. Cette annonce a provoqué une vague d’incompréhensions notamment au sein de la communauté estudiantine.\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"root\",\"version\":1}}",
                    "{\"root\":{\"children\":[{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Face à une pression croissante sur les services de restauration, liée notamment à l’augmentation continue du nombre d’étudiants et aux répercussions de la crise sécuritaire sur les familles, le CENOU a affirmé avoir été confronté à un choix entre accroître davantage l’offre ou réguler la demande. Si des efforts budgétaires et organisationnels sont engagés pour renforcer l’offre, l’institution a également opté pour une mesure de régulation.\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\" Face à cette situation exceptionnelle, nous avons deux leviers : augmenter l’offre et\/ou réguler la demande de manière équitable. Côté offre, l’État a consenti des efforts historiques et croissants dont le remboursement massif des dettes (plus de 2 milliards de FCFA en 2023 pour les deux plus grands restaurants universitaires) ; l’augmentation substantielle des budgets de la restauration : 6,96 milliards de FCFA en 2022, 7,8 milliards en 2023, 8,4 milliards en 2024, 9 milliards en 2025 et 9,6 milliards de FCFA en 2026 (soit 93,6 % de la subvention totale versée par l’Etat) ; des efforts supplémentaires exceptionnels pour la normalisation des années académiques (1,1 milliard en 2024 et 790 millions en 2025 pour la restauration en août et septembre, période de vacances universitaires). Malgré ces investissements considérables, la pression reste très forte : certains restaurants enregistrent des dépassements (230 millions de FCFA de reste à payer en 2025, par exemple), menaçant ainsi la pérennité du service. Côté demande, nous avons opté pour une mesure de rééquilibrage solidaire. En effet, pour qu’aucun nouvel étudiant, aucun frère ou sœur arrivé récemment de zones en crise, ne se retrouve sans ticket, nous avons ajusté le plafond à 65 repas », a expliqué le directeur général, Noël Thiombiano.\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"root\",\"version\":1}}",
                    null,
                    null,
                    20,
                    "fr",
                    10
                ],
                [
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    21,
                    "en",
                    11
                ],
                [
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    22,
                    "fr",
                    11
                ],
                [
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    23,
                    "en",
                    12
                ],
                [
                    "Burkina Faso : Après des scandales de corruption, l’édile de la Capitale sermonne la Police municipale",
                    null,
                    "{\"root\":{\"children\":[{\"children\":[{\"detail\":0,\"format\":1,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Au cours de la traditionnelle montée des couleurs, ce mardi 24 février 2026, à Ouagadougou, le président de la délégation spéciale, Maurice Konaté, s’est adressé aux éléments de la Police municipale après les récents faits de corruption, notamment lors de la sortie terrain du KORAG où deux policiers municipaux ont été pris en flagrant délit de corruption, des faits qui jettent un discrédit sur l’institution. \",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":1,\"textStyle\":\"\"}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"root\",\"version\":1,\"textFormat\":1}}",
                    "{\"root\":{\"children\":[{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Il a poursuivi : “\",\"type\":\"text\",\"version\":1},{\"detail\":0,\"format\":3,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Tout de suite quand le KORAG a fait sa sortie, la Police municipale était encore au premier plan. Je rentre la nuit, je ne dors pas. Je ne sais pas ce qu’il faut faire. On est 975 policiers municipaux, disons 1000. Prenez même seulement le salaire d’un seul policier municipal dans le budget de la commune. Prenez les 1000, prenez leur habillement (…).\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"justify\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":3,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Regardez aujourd’hui ce que l’Etat est en train de faire pour rendre cette institution Police municipale digne de son nom. Ils sont armés, vous avez des véhicules, on vous accorde même un certain nombre de droits que vous n’aviez jamais eus\",\"type\":\"text\",\"version\":1},{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"”.\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"justify\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":3,\"textStyle\":\"\"},{\"children\":[],\"direction\":null,\"format\":\"justify\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"type\":\"upload\",\"version\":3,\"format\":\"\",\"id\":\"699fa2f89f286f0ccb77f531\",\"fields\":null,\"relationTo\":\"media\",\"value\":5},{\"children\":[],\"direction\":null,\"format\":\"justify\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"root\",\"version\":1}}",
                    null,
                    null,
                    24,
                    "fr",
                    12
                ],
                [
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    25,
                    "en",
                    13
                ],
                [
                    "Burkina Faso : Après des scandales de corruption, l’édile de la Capitale sermonne la Police municipale",
                    null,
                    "{\"root\":{\"children\":[{\"children\":[{\"detail\":0,\"format\":1,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Au cours de la traditionnelle montée des couleurs, ce mardi 24 février 2026, à Ouagadougou, le président de la délégation spéciale, Maurice Konaté, s’est adressé aux éléments de la Police municipale après les récents faits de corruption, notamment lors de la sortie terrain du KORAG où deux policiers municipaux ont été pris en flagrant délit de corruption, des faits qui jettent un discrédit sur l’institution. \",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":1,\"textStyle\":\"\"}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"root\",\"version\":1,\"textFormat\":1}}",
                    "{\"root\":{\"children\":[{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Il a poursuivi : “\",\"type\":\"text\",\"version\":1},{\"detail\":0,\"format\":3,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Tout de suite quand le KORAG a fait sa sortie, la Police municipale était encore au premier plan. Je rentre la nuit, je ne dors pas. Je ne sais pas ce qu’il faut faire. On est 975 policiers municipaux, disons 1000. Prenez même seulement le salaire d’un seul policier municipal dans le budget de la commune. Prenez les 1000, prenez leur habillement (…).\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"justify\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":3,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Regardez aujourd’hui ce que l’Etat est en train de faire pour rendre cette institution Police municipale digne de son nom. Ils sont armés, vous avez des véhicules, on vous accorde même un certain nombre de droits que vous n’aviez jamais eus\",\"type\":\"text\",\"version\":1},{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"”.\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"justify\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":3,\"textStyle\":\"\"},{\"children\":[],\"direction\":null,\"format\":\"justify\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"type\":\"upload\",\"version\":3,\"format\":\"\",\"id\":\"699fa2f89f286f0ccb77f531\",\"fields\":null,\"relationTo\":\"media\",\"value\":5},{\"children\":[],\"direction\":null,\"format\":\"justify\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"root\",\"version\":1}}",
                    null,
                    null,
                    26,
                    "fr",
                    13
                ]
            ]
        },
        {
            "type": "table",
            "database": null,
            "name": "_actualites_v_rels",
            "withoutRowId": false,
            "strict": false,
            "ddl": "CREATE TABLE `_actualites_v_rels` (\n\t`id` integer PRIMARY KEY NOT NULL,\n\t`order` integer,\n\t`parent_id` integer NOT NULL,\n\t`path` text NOT NULL,\n\t`categories_id` integer,\n\t`tags_id` integer,\n\tFOREIGN KEY (`parent_id`) REFERENCES `_actualites_v`(`id`) ON UPDATE no action ON DELETE cascade,\n\tFOREIGN KEY (`categories_id`) REFERENCES `categories`(`id`) ON UPDATE no action ON DELETE cascade,\n\tFOREIGN KEY (`tags_id`) REFERENCES `tags`(`id`) ON UPDATE no action ON DELETE cascade\n)",
            "columns": [
                {
                    "name": "id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "PRIMARY KEY",
                            "definition": "PRIMARY KEY "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "order",
                    "type": "integer"
                },
                {
                    "name": "parent_id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "path",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "categories_id",
                    "type": "integer"
                },
                {
                    "name": "tags_id",
                    "type": "integer"
                }
            ],
            "constraints": [
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`parent_id`) REFERENCES `_actualites_v`(`id`) ON UPDATE no action ON DELETE cascade"
                },
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`categories_id`) REFERENCES `categories`(`id`) ON UPDATE no action ON DELETE cascade"
                },
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`tags_id`) REFERENCES `tags`(`id`) ON UPDATE no action ON DELETE cascade\n"
                }
            ],
            "rows": [
            ]
        },
        {
            "type": "table",
            "database": null,
            "name": "_actualites_v_version_carousel",
            "withoutRowId": false,
            "strict": false,
            "ddl": "CREATE TABLE `_actualites_v_version_carousel` (\n\t`_order` integer NOT NULL,\n\t`_parent_id` integer NOT NULL,\n\t`id` integer PRIMARY KEY NOT NULL,\n\t`image_id` integer,\n\t`_uuid` text,\n\tFOREIGN KEY (`image_id`) REFERENCES `media`(`id`) ON UPDATE no action ON DELETE set null,\n\tFOREIGN KEY (`_parent_id`) REFERENCES `_actualites_v`(`id`) ON UPDATE no action ON DELETE cascade\n)",
            "columns": [
                {
                    "name": "_order",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "_parent_id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "PRIMARY KEY",
                            "definition": "PRIMARY KEY "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "image_id",
                    "type": "integer"
                },
                {
                    "name": "_uuid",
                    "type": "text"
                }
            ],
            "constraints": [
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`image_id`) REFERENCES `media`(`id`) ON UPDATE no action ON DELETE set null"
                },
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`_parent_id`) REFERENCES `_actualites_v`(`id`) ON UPDATE no action ON DELETE cascade\n"
                }
            ],
            "rows": [
                [
                    1,
                    9,
                    1,
                    2,
                    "699fa14effd8067f3fa46daa"
                ],
                [
                    2,
                    9,
                    2,
                    3,
                    "699fa17affd8067f3fa46dac"
                ],
                [
                    3,
                    9,
                    3,
                    4,
                    "699fa18cffd8067f3fa46dae"
                ],
                [
                    1,
                    10,
                    4,
                    2,
                    "699fa14effd8067f3fa46daa"
                ],
                [
                    2,
                    10,
                    5,
                    3,
                    "699fa17affd8067f3fa46dac"
                ],
                [
                    3,
                    10,
                    6,
                    4,
                    "699fa18cffd8067f3fa46dae"
                ]
            ]
        },
        {
            "type": "table",
            "database": null,
            "name": "_actualites_v_version_carousel_locales",
            "withoutRowId": false,
            "strict": false,
            "ddl": "CREATE TABLE `_actualites_v_version_carousel_locales` (\n\t`caption` text,\n\t`id` integer PRIMARY KEY NOT NULL,\n\t`_locale` text NOT NULL,\n\t`_parent_id` integer NOT NULL,\n\tFOREIGN KEY (`_parent_id`) REFERENCES `_actualites_v_version_carousel`(`id`) ON UPDATE no action ON DELETE cascade\n)",
            "columns": [
                {
                    "name": "caption",
                    "type": "text"
                },
                {
                    "name": "id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "PRIMARY KEY",
                            "definition": "PRIMARY KEY "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "_locale",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "_parent_id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                }
            ],
            "constraints": [
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`_parent_id`) REFERENCES `_actualites_v_version_carousel`(`id`) ON UPDATE no action ON DELETE cascade\n"
                }
            ],
            "rows": [
                [
                    "",
                    1,
                    "fr",
                    3
                ],
                [
                    null,
                    2,
                    "en",
                    4
                ],
                [
                    null,
                    3,
                    "fr",
                    4
                ],
                [
                    null,
                    4,
                    "en",
                    5
                ],
                [
                    null,
                    5,
                    "fr",
                    5
                ],
                [
                    "",
                    6,
                    "fr",
                    6
                ]
            ]
        },
        {
            "type": "table",
            "database": null,
            "name": "actualites",
            "withoutRowId": false,
            "strict": false,
            "ddl": "CREATE TABLE `actualites` (\n\t`id` integer PRIMARY KEY NOT NULL,\n\t`og_image_id` integer,\n\t`slug` text,\n\t`author_id` integer,\n\t`publish_date` text,\n\t`updated_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,\n\t`created_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,\n\t`_status` text DEFAULT 'draft',\n\tFOREIGN KEY (`og_image_id`) REFERENCES `media`(`id`) ON UPDATE no action ON DELETE set null,\n\tFOREIGN KEY (`author_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE set null\n)",
            "columns": [
                {
                    "name": "id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "PRIMARY KEY",
                            "definition": "PRIMARY KEY "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "og_image_id",
                    "type": "integer"
                },
                {
                    "name": "slug",
                    "type": "text"
                },
                {
                    "name": "author_id",
                    "type": "integer"
                },
                {
                    "name": "publish_date",
                    "type": "text"
                },
                {
                    "name": "updated_at",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "DEFAULT",
                            "definition": "DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "created_at",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "DEFAULT",
                            "definition": "DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "_status",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "DEFAULT",
                            "definition": "DEFAULT 'draft'"
                        }
                    ]
                }
            ],
            "constraints": [
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`og_image_id`) REFERENCES `media`(`id`) ON UPDATE no action ON DELETE set null"
                },
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`author_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE set null\n"
                }
            ],
            "rows": [
                [
                    1,
                    null,
                    "dossier-yake-camille-ye-et-autres-du-mouta-mouta-dans-les-marches-de-livraison-des-pagnes-du-8-mars-2024-ds",
                    1,
                    "2026-02-25T23:52:17.189Z",
                    "2026-02-26T01:18:54.461Z",
                    "2026-02-25T23:52:17.205Z",
                    "published"
                ],
                [
                    2,
                    null,
                    "burkinareajustement-du-nombre-de-plats-dans-les-restaurants-universitaires-aucun-etudiant-ne-sera-prive-de-ses-repas-quotidiens-clarifie-le-cenou",
                    1,
                    "2026-02-26T01:23:03.656Z",
                    "2026-02-26T01:30:08.376Z",
                    "2026-02-26T01:23:03.678Z",
                    "published"
                ],
                [
                    3,
                    null,
                    "burkina-faso-apres-des-scandales-de-corruption-ledile-de-la-capitale-sermonne-la-police-municipale",
                    1,
                    "2026-02-26T01:30:38.874Z",
                    "2026-02-26T01:33:51.662Z",
                    "2026-02-26T01:30:38.889Z",
                    "published"
                ]
            ]
        },
        {
            "type": "table",
            "database": null,
            "name": "actualites_carousel",
            "withoutRowId": false,
            "strict": false,
            "ddl": "CREATE TABLE `actualites_carousel` (\n\t`_order` integer NOT NULL,\n\t`_parent_id` integer NOT NULL,\n\t`id` text PRIMARY KEY NOT NULL,\n\t`image_id` integer,\n\tFOREIGN KEY (`image_id`) REFERENCES `media`(`id`) ON UPDATE no action ON DELETE set null,\n\tFOREIGN KEY (`_parent_id`) REFERENCES `actualites`(`id`) ON UPDATE no action ON DELETE cascade\n)",
            "columns": [
                {
                    "name": "_order",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "_parent_id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "id",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "PRIMARY KEY",
                            "definition": "PRIMARY KEY "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "image_id",
                    "type": "integer"
                }
            ],
            "constraints": [
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`image_id`) REFERENCES `media`(`id`) ON UPDATE no action ON DELETE set null"
                },
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`_parent_id`) REFERENCES `actualites`(`id`) ON UPDATE no action ON DELETE cascade\n"
                }
            ],
            "rows": [
                [
                    1,
                    2,
                    "699fa14effd8067f3fa46daa",
                    2
                ],
                [
                    2,
                    2,
                    "699fa17affd8067f3fa46dac",
                    3
                ],
                [
                    3,
                    2,
                    "699fa18cffd8067f3fa46dae",
                    4
                ]
            ]
        },
        {
            "type": "table",
            "database": null,
            "name": "actualites_carousel_locales",
            "withoutRowId": false,
            "strict": false,
            "ddl": "CREATE TABLE `actualites_carousel_locales` (\n\t`caption` text,\n\t`id` integer PRIMARY KEY NOT NULL,\n\t`_locale` text NOT NULL,\n\t`_parent_id` text NOT NULL,\n\tFOREIGN KEY (`_parent_id`) REFERENCES `actualites_carousel`(`id`) ON UPDATE no action ON DELETE cascade\n)",
            "columns": [
                {
                    "name": "caption",
                    "type": "text"
                },
                {
                    "name": "id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "PRIMARY KEY",
                            "definition": "PRIMARY KEY "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "_locale",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "_parent_id",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                }
            ],
            "constraints": [
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`_parent_id`) REFERENCES `actualites_carousel`(`id`) ON UPDATE no action ON DELETE cascade\n"
                }
            ],
            "rows": [
                [
                    "",
                    1,
                    "fr",
                    "699fa18cffd8067f3fa46dae"
                ]
            ]
        },
        {
            "type": "table",
            "database": null,
            "name": "actualites_locales",
            "withoutRowId": false,
            "strict": false,
            "ddl": "CREATE TABLE `actualites_locales` (\n\t`title` text,\n\t`excerpt` text,\n\t`text_before_carousel` text,\n\t`content` text,\n\t`meta_title` text,\n\t`meta_description` text,\n\t`id` integer PRIMARY KEY NOT NULL,\n\t`_locale` text NOT NULL,\n\t`_parent_id` integer NOT NULL,\n\tFOREIGN KEY (`_parent_id`) REFERENCES `actualites`(`id`) ON UPDATE no action ON DELETE cascade\n)",
            "columns": [
                {
                    "name": "title",
                    "type": "text"
                },
                {
                    "name": "excerpt",
                    "type": "text"
                },
                {
                    "name": "text_before_carousel",
                    "type": "text"
                },
                {
                    "name": "content",
                    "type": "text"
                },
                {
                    "name": "meta_title",
                    "type": "text"
                },
                {
                    "name": "meta_description",
                    "type": "text"
                },
                {
                    "name": "id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "PRIMARY KEY",
                            "definition": "PRIMARY KEY "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "_locale",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "_parent_id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                }
            ],
            "constraints": [
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`_parent_id`) REFERENCES `actualites`(`id`) ON UPDATE no action ON DELETE cascade\n"
                }
            ],
            "rows": [
                [
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    1,
                    "en",
                    1
                ],
                [
                    "Dossier  « Yaké Camille Yé et autres » : Du « mouta mouta »* dans les marchés de livraison des pagnes du 8-mars 2024 ? ds",
                    null,
                    "{\"root\":{\"children\":[{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"L’audience sur le « dossier Yaké Camille Yé et autres » s’est poursuivie ce mercredi 25 février 2026 devant le Tribunal de grande instance Ouaga I. La journée a quasiment été consacrée aux prestations relatives à la fourniture des pagnes du 8-mars 2024.\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"root\",\"version\":1}}",
                    "{\"root\":{\"children\":[{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"L’audience a été ouverte par la déposition du directeur général des études et des statistiques sectorielles (DGESS) au moment des faits, Ousmane Belem, entendu en qualité de témoin. Son passage visait ainsi à éclairer le Tribunal, par également une confrontation avec des déclarations du prévenu Yaké Camille Yé. L’intérêt du Tribunal a donc porté sur le processus d’élaboration du rapport annuel de performance 2023 et du budget sensible au genre. Ces deux activités ont jusque-là cristallisé les débats, en ce sens que c’est autour de celles-ci également que de l’argent a été défalqué pour \\\"rétributions\\\".\",\"type\":\"text\",\"version\":1},{\"type\":\"linebreak\",\"version\":1},{\"type\":\"linebreak\",\"version\":1}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"type\":\"upload\",\"version\":3,\"format\":\"\",\"id\":\"699f8eb837373664a5da909e\",\"fields\":null,\"relationTo\":\"media\",\"value\":1},{\"children\":[],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":1,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Sur quelles bases ? Explication !\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"start\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"En effet, pendant que les prévenus (Yaké Camille Yé, Lydie Bonkoungou, Issiaka Sangaré et Kouka Dimanche Yaméogo) ont reconnu que ces deux activités ont été exécutées sans des Termes de référence (TDR) et un arrêté portant mise en place de comités comme cela a été procédé, M. Belem affirme que les TDR existent (le Tribunal a demandé à ce qu’il produise lesdits documents pour l’ensemble des parties).\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"start\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Il explique que les TDR sont élaborés par la DGESS, tout en sollicitant la direction de la gestion financière pour la partie liée aux ressources financières (ce qui corrobore la déclaration de Yaké Camille Yé sur ce point).\",\"type\":\"text\",\"version\":1},{\"type\":\"linebreak\",\"version\":1},{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Un autre point de divergence concerne la durée des travaux. Durant leur passage, les prévenus sus-référés ont tous déclaré que la durée impartie était d’un mois. Mais, selon le témoin Belem, les travaux ont duré une semaine (ce que confirme une des pièces du dossier présentées par le Tribunal). Tout comme les prévenus, le DGESS Ousmane Belem a confié que chaque participant a reçu une rétribution de 300 000 FCFA.\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"start\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"root\",\"version\":1,\"textFormat\":1}}",
                    null,
                    null,
                    2,
                    "fr",
                    1
                ],
                [
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    3,
                    "en",
                    2
                ],
                [
                    "Burkina\/Réajustement du nombre de plats dans les restaurants universitaires : « Aucun étudiant ne sera privé de ses repas quotidiens », clarifie le CENOU",
                    null,
                    "{\"root\":{\"children\":[{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Dans un communiqué sorti le 11 février 2026, le Centre national des œuvres universitaires (CENOU), annonçait la réduction du nombre de plats servis dans les restaurants universitaires. Cette annonce a provoqué une vague d’incompréhensions notamment au sein de la communauté estudiantine.\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"root\",\"version\":1}}",
                    "{\"root\":{\"children\":[{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Face à une pression croissante sur les services de restauration, liée notamment à l’augmentation continue du nombre d’étudiants et aux répercussions de la crise sécuritaire sur les familles, le CENOU a affirmé avoir été confronté à un choix entre accroître davantage l’offre ou réguler la demande. Si des efforts budgétaires et organisationnels sont engagés pour renforcer l’offre, l’institution a également opté pour une mesure de régulation.\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\" Face à cette situation exceptionnelle, nous avons deux leviers : augmenter l’offre et\/ou réguler la demande de manière équitable. Côté offre, l’État a consenti des efforts historiques et croissants dont le remboursement massif des dettes (plus de 2 milliards de FCFA en 2023 pour les deux plus grands restaurants universitaires) ; l’augmentation substantielle des budgets de la restauration : 6,96 milliards de FCFA en 2022, 7,8 milliards en 2023, 8,4 milliards en 2024, 9 milliards en 2025 et 9,6 milliards de FCFA en 2026 (soit 93,6 % de la subvention totale versée par l’Etat) ; des efforts supplémentaires exceptionnels pour la normalisation des années académiques (1,1 milliard en 2024 et 790 millions en 2025 pour la restauration en août et septembre, période de vacances universitaires). Malgré ces investissements considérables, la pression reste très forte : certains restaurants enregistrent des dépassements (230 millions de FCFA de reste à payer en 2025, par exemple), menaçant ainsi la pérennité du service. Côté demande, nous avons opté pour une mesure de rééquilibrage solidaire. En effet, pour qu’aucun nouvel étudiant, aucun frère ou sœur arrivé récemment de zones en crise, ne se retrouve sans ticket, nous avons ajusté le plafond à 65 repas », a expliqué le directeur général, Noël Thiombiano.\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"root\",\"version\":1}}",
                    null,
                    null,
                    4,
                    "fr",
                    2
                ],
                [
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    5,
                    "en",
                    3
                ],
                [
                    "Burkina Faso : Après des scandales de corruption, l’édile de la Capitale sermonne la Police municipale",
                    null,
                    "{\"root\":{\"children\":[{\"children\":[{\"detail\":0,\"format\":1,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Au cours de la traditionnelle montée des couleurs, ce mardi 24 février 2026, à Ouagadougou, le président de la délégation spéciale, Maurice Konaté, s’est adressé aux éléments de la Police municipale après les récents faits de corruption, notamment lors de la sortie terrain du KORAG où deux policiers municipaux ont été pris en flagrant délit de corruption, des faits qui jettent un discrédit sur l’institution. \",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":1,\"textStyle\":\"\"}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"root\",\"version\":1,\"textFormat\":1}}",
                    "{\"root\":{\"children\":[{\"children\":[{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Il a poursuivi : “\",\"type\":\"text\",\"version\":1},{\"detail\":0,\"format\":3,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Tout de suite quand le KORAG a fait sa sortie, la Police municipale était encore au premier plan. Je rentre la nuit, je ne dors pas. Je ne sais pas ce qu’il faut faire. On est 975 policiers municipaux, disons 1000. Prenez même seulement le salaire d’un seul policier municipal dans le budget de la commune. Prenez les 1000, prenez leur habillement (…).\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"justify\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"children\":[{\"detail\":0,\"format\":3,\"mode\":\"normal\",\"style\":\"\",\"text\":\"Regardez aujourd’hui ce que l’Etat est en train de faire pour rendre cette institution Police municipale digne de son nom. Ils sont armés, vous avez des véhicules, on vous accorde même un certain nombre de droits que vous n’aviez jamais eus\",\"type\":\"text\",\"version\":1},{\"detail\":0,\"format\":0,\"mode\":\"normal\",\"style\":\"\",\"text\":\"”.\",\"type\":\"text\",\"version\":1}],\"direction\":null,\"format\":\"justify\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":3,\"textStyle\":\"\"},{\"children\":[],\"direction\":null,\"format\":\"justify\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"},{\"type\":\"upload\",\"version\":3,\"format\":\"\",\"id\":\"699fa2f89f286f0ccb77f531\",\"fields\":null,\"relationTo\":\"media\",\"value\":5},{\"children\":[],\"direction\":null,\"format\":\"justify\",\"indent\":0,\"type\":\"paragraph\",\"version\":1,\"textFormat\":0,\"textStyle\":\"\"}],\"direction\":null,\"format\":\"\",\"indent\":0,\"type\":\"root\",\"version\":1}}",
                    null,
                    null,
                    6,
                    "fr",
                    3
                ]
            ]
        },
        {
            "type": "table",
            "database": null,
            "name": "actualites_rels",
            "withoutRowId": false,
            "strict": false,
            "ddl": "CREATE TABLE `actualites_rels` (\n\t`id` integer PRIMARY KEY NOT NULL,\n\t`order` integer,\n\t`parent_id` integer NOT NULL,\n\t`path` text NOT NULL,\n\t`categories_id` integer,\n\t`tags_id` integer,\n\tFOREIGN KEY (`parent_id`) REFERENCES `actualites`(`id`) ON UPDATE no action ON DELETE cascade,\n\tFOREIGN KEY (`categories_id`) REFERENCES `categories`(`id`) ON UPDATE no action ON DELETE cascade,\n\tFOREIGN KEY (`tags_id`) REFERENCES `tags`(`id`) ON UPDATE no action ON DELETE cascade\n)",
            "columns": [
                {
                    "name": "id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "PRIMARY KEY",
                            "definition": "PRIMARY KEY "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "order",
                    "type": "integer"
                },
                {
                    "name": "parent_id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "path",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "categories_id",
                    "type": "integer"
                },
                {
                    "name": "tags_id",
                    "type": "integer"
                }
            ],
            "constraints": [
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`parent_id`) REFERENCES `actualites`(`id`) ON UPDATE no action ON DELETE cascade"
                },
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`categories_id`) REFERENCES `categories`(`id`) ON UPDATE no action ON DELETE cascade"
                },
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`tags_id`) REFERENCES `tags`(`id`) ON UPDATE no action ON DELETE cascade\n"
                }
            ],
            "rows": [
            ]
        },
        {
            "type": "table",
            "database": null,
            "name": "categories",
            "withoutRowId": false,
            "strict": false,
            "ddl": "CREATE TABLE `categories` (\n\t`id` integer PRIMARY KEY NOT NULL,\n\t`slug` text NOT NULL,\n\t`updated_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,\n\t`created_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL\n)",
            "columns": [
                {
                    "name": "id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "PRIMARY KEY",
                            "definition": "PRIMARY KEY "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "slug",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "updated_at",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "DEFAULT",
                            "definition": "DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "created_at",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "DEFAULT",
                            "definition": "DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL\n"
                        }
                    ]
                }
            ],
            "rows": [
            ]
        },
        {
            "type": "table",
            "database": null,
            "name": "categories_locales",
            "withoutRowId": false,
            "strict": false,
            "ddl": "CREATE TABLE `categories_locales` (\n\t`name` text NOT NULL,\n\t`description` text,\n\t`id` integer PRIMARY KEY NOT NULL,\n\t`_locale` text NOT NULL,\n\t`_parent_id` integer NOT NULL,\n\tFOREIGN KEY (`_parent_id`) REFERENCES `categories`(`id`) ON UPDATE no action ON DELETE cascade\n)",
            "columns": [
                {
                    "name": "name",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "description",
                    "type": "text"
                },
                {
                    "name": "id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "PRIMARY KEY",
                            "definition": "PRIMARY KEY "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "_locale",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "_parent_id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                }
            ],
            "constraints": [
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`_parent_id`) REFERENCES `categories`(`id`) ON UPDATE no action ON DELETE cascade\n"
                }
            ],
            "rows": [
            ]
        },
        {
            "type": "table",
            "database": null,
            "name": "media",
            "withoutRowId": false,
            "strict": false,
            "ddl": "CREATE TABLE `media` (\n\t`id` integer PRIMARY KEY NOT NULL,\n\t`updated_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,\n\t`created_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,\n\t`url` text,\n\t`thumbnail_u_r_l` text,\n\t`filename` text,\n\t`mime_type` text,\n\t`filesize` numeric,\n\t`width` numeric,\n\t`height` numeric,\n\t`focal_x` numeric,\n\t`focal_y` numeric,\n\t`sizes_thumbnail_url` text,\n\t`sizes_thumbnail_width` numeric,\n\t`sizes_thumbnail_height` numeric,\n\t`sizes_thumbnail_mime_type` text,\n\t`sizes_thumbnail_filesize` numeric,\n\t`sizes_thumbnail_filename` text,\n\t`sizes_card_url` text,\n\t`sizes_card_width` numeric,\n\t`sizes_card_height` numeric,\n\t`sizes_card_mime_type` text,\n\t`sizes_card_filesize` numeric,\n\t`sizes_card_filename` text,\n\t`sizes_hero_url` text,\n\t`sizes_hero_width` numeric,\n\t`sizes_hero_height` numeric,\n\t`sizes_hero_mime_type` text,\n\t`sizes_hero_filesize` numeric,\n\t`sizes_hero_filename` text\n)",
            "columns": [
                {
                    "name": "id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "PRIMARY KEY",
                            "definition": "PRIMARY KEY "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "updated_at",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "DEFAULT",
                            "definition": "DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "created_at",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "DEFAULT",
                            "definition": "DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "url",
                    "type": "text"
                },
                {
                    "name": "thumbnail_u_r_l",
                    "type": "text"
                },
                {
                    "name": "filename",
                    "type": "text"
                },
                {
                    "name": "mime_type",
                    "type": "text"
                },
                {
                    "name": "filesize",
                    "type": "numeric"
                },
                {
                    "name": "width",
                    "type": "numeric"
                },
                {
                    "name": "height",
                    "type": "numeric"
                },
                {
                    "name": "focal_x",
                    "type": "numeric"
                },
                {
                    "name": "focal_y",
                    "type": "numeric"
                },
                {
                    "name": "sizes_thumbnail_url",
                    "type": "text"
                },
                {
                    "name": "sizes_thumbnail_width",
                    "type": "numeric"
                },
                {
                    "name": "sizes_thumbnail_height",
                    "type": "numeric"
                },
                {
                    "name": "sizes_thumbnail_mime_type",
                    "type": "text"
                },
                {
                    "name": "sizes_thumbnail_filesize",
                    "type": "numeric"
                },
                {
                    "name": "sizes_thumbnail_filename",
                    "type": "text"
                },
                {
                    "name": "sizes_card_url",
                    "type": "text"
                },
                {
                    "name": "sizes_card_width",
                    "type": "numeric"
                },
                {
                    "name": "sizes_card_height",
                    "type": "numeric"
                },
                {
                    "name": "sizes_card_mime_type",
                    "type": "text"
                },
                {
                    "name": "sizes_card_filesize",
                    "type": "numeric"
                },
                {
                    "name": "sizes_card_filename",
                    "type": "text"
                },
                {
                    "name": "sizes_hero_url",
                    "type": "text"
                },
                {
                    "name": "sizes_hero_width",
                    "type": "numeric"
                },
                {
                    "name": "sizes_hero_height",
                    "type": "numeric"
                },
                {
                    "name": "sizes_hero_mime_type",
                    "type": "text"
                },
                {
                    "name": "sizes_hero_filesize",
                    "type": "numeric"
                },
                {
                    "name": "sizes_hero_filename",
                    "type": "text"
                }
            ],
            "rows": [
                [
                    1,
                    "2026-02-26T00:07:20.086Z",
                    "2026-02-26T00:07:20.086Z",
                    "\/api\/media\/file\/whatsapp_image_2026-02-25_at_20.45_44-ef801.jpg",
                    null,
                    "whatsapp_image_2026-02-25_at_20.45_44-ef801.jpg",
                    "image\/jpeg",
                    47784,
                    680,
                    401,
                    50,
                    50,
                    "\/api\/media\/file\/whatsapp_image_2026-02-25_at_20.45_44-ef801-400x300.jpg",
                    400,
                    300,
                    "image\/jpeg",
                    22557,
                    "whatsapp_image_2026-02-25_at_20.45_44-ef801-400x300.jpg",
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null
                ],
                [
                    2,
                    "2026-02-26T01:27:17.369Z",
                    "2026-02-26T01:27:17.369Z",
                    "\/api\/media\/file\/490920dc-075d-45de-adf3-de81da86afae-5ff4e.jpg",
                    null,
                    "490920dc-075d-45de-adf3-de81da86afae-5ff4e.jpg",
                    "image\/jpeg",
                    59756,
                    600,
                    400,
                    50,
                    50,
                    "\/api\/media\/file\/490920dc-075d-45de-adf3-de81da86afae-5ff4e-400x300.jpg",
                    400,
                    300,
                    "image\/jpeg",
                    30214,
                    "490920dc-075d-45de-adf3-de81da86afae-5ff4e-400x300.jpg",
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null
                ],
                [
                    3,
                    "2026-02-26T01:27:37.254Z",
                    "2026-02-26T01:27:37.254Z",
                    "\/api\/media\/file\/e3277d7a-347b-4b0d-aebe-f9490767aa7d-30d4d.jpg",
                    null,
                    "e3277d7a-347b-4b0d-aebe-f9490767aa7d-30d4d.jpg",
                    "image\/jpeg",
                    59045,
                    600,
                    400,
                    50,
                    50,
                    "\/api\/media\/file\/e3277d7a-347b-4b0d-aebe-f9490767aa7d-30d4d-400x300.jpg",
                    400,
                    300,
                    "image\/jpeg",
                    30189,
                    "e3277d7a-347b-4b0d-aebe-f9490767aa7d-30d4d-400x300.jpg",
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null
                ],
                [
                    4,
                    "2026-02-26T01:28:07.039Z",
                    "2026-02-26T01:28:07.039Z",
                    "\/api\/media\/file\/e6d61342-9166-450f-89e8-4fa6f0915613-eb4a2.jpg",
                    null,
                    "e6d61342-9166-450f-89e8-4fa6f0915613-eb4a2.jpg",
                    "image\/jpeg",
                    73255,
                    680,
                    453,
                    50,
                    50,
                    "\/api\/media\/file\/e6d61342-9166-450f-89e8-4fa6f0915613-eb4a2-400x300.jpg",
                    400,
                    300,
                    "image\/jpeg",
                    28328,
                    "e6d61342-9166-450f-89e8-4fa6f0915613-eb4a2-400x300.jpg",
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null
                ],
                [
                    5,
                    "2026-02-26T01:33:44.242Z",
                    "2026-02-26T01:33:44.241Z",
                    "\/api\/media\/file\/Police-Municipale.jpg",
                    null,
                    "Police-Municipale.jpg",
                    "image\/jpeg",
                    96760,
                    1016,
                    655,
                    50,
                    50,
                    "\/api\/media\/file\/Police-Municipale-400x300.jpg",
                    400,
                    300,
                    "image\/jpeg",
                    29689,
                    "Police-Municipale-400x300.jpg",
                    "\/api\/media\/file\/Police-Municipale-768x512.jpg",
                    768,
                    512,
                    "image\/jpeg",
                    83659,
                    "Police-Municipale-768x512.jpg",
                    null,
                    null,
                    null,
                    null,
                    null,
                    null
                ]
            ]
        },
        {
            "type": "table",
            "database": null,
            "name": "media_locales",
            "withoutRowId": false,
            "strict": false,
            "ddl": "CREATE TABLE `media_locales` (\n\t`alt` text,\n\t`id` integer PRIMARY KEY NOT NULL,\n\t`_locale` text NOT NULL,\n\t`_parent_id` integer NOT NULL,\n\tFOREIGN KEY (`_parent_id`) REFERENCES `media`(`id`) ON UPDATE no action ON DELETE cascade\n)",
            "columns": [
                {
                    "name": "alt",
                    "type": "text"
                },
                {
                    "name": "id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "PRIMARY KEY",
                            "definition": "PRIMARY KEY "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "_locale",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "_parent_id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                }
            ],
            "constraints": [
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`_parent_id`) REFERENCES `media`(`id`) ON UPDATE no action ON DELETE cascade\n"
                }
            ],
            "rows": [
            ]
        },
        {
            "type": "table",
            "database": null,
            "name": "payload_kv",
            "withoutRowId": false,
            "strict": false,
            "ddl": "CREATE TABLE `payload_kv` (\n\t`id` integer PRIMARY KEY NOT NULL,\n\t`key` text NOT NULL,\n\t`data` text NOT NULL\n)",
            "columns": [
                {
                    "name": "id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "PRIMARY KEY",
                            "definition": "PRIMARY KEY "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "key",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "data",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL\n"
                        }
                    ]
                }
            ],
            "rows": [
            ]
        },
        {
            "type": "table",
            "database": null,
            "name": "payload_locked_documents",
            "withoutRowId": false,
            "strict": false,
            "ddl": "CREATE TABLE `payload_locked_documents` (\n\t`id` integer PRIMARY KEY NOT NULL,\n\t`global_slug` text,\n\t`updated_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,\n\t`created_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL\n)",
            "columns": [
                {
                    "name": "id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "PRIMARY KEY",
                            "definition": "PRIMARY KEY "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "global_slug",
                    "type": "text"
                },
                {
                    "name": "updated_at",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "DEFAULT",
                            "definition": "DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "created_at",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "DEFAULT",
                            "definition": "DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL\n"
                        }
                    ]
                }
            ],
            "rows": [
            ]
        },
        {
            "type": "table",
            "database": null,
            "name": "payload_locked_documents_rels",
            "withoutRowId": false,
            "strict": false,
            "ddl": "CREATE TABLE `payload_locked_documents_rels` (\n\t`id` integer PRIMARY KEY NOT NULL,\n\t`order` integer,\n\t`parent_id` integer NOT NULL,\n\t`path` text NOT NULL,\n\t`users_id` integer,\n\t`media_id` integer,\n\t`categories_id` integer,\n\t`tags_id` integer,\n\t`actualites_id` integer,\n\tFOREIGN KEY (`parent_id`) REFERENCES `payload_locked_documents`(`id`) ON UPDATE no action ON DELETE cascade,\n\tFOREIGN KEY (`users_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade,\n\tFOREIGN KEY (`media_id`) REFERENCES `media`(`id`) ON UPDATE no action ON DELETE cascade,\n\tFOREIGN KEY (`categories_id`) REFERENCES `categories`(`id`) ON UPDATE no action ON DELETE cascade,\n\tFOREIGN KEY (`tags_id`) REFERENCES `tags`(`id`) ON UPDATE no action ON DELETE cascade,\n\tFOREIGN KEY (`actualites_id`) REFERENCES `actualites`(`id`) ON UPDATE no action ON DELETE cascade\n)",
            "columns": [
                {
                    "name": "id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "PRIMARY KEY",
                            "definition": "PRIMARY KEY "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "order",
                    "type": "integer"
                },
                {
                    "name": "parent_id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "path",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "users_id",
                    "type": "integer"
                },
                {
                    "name": "media_id",
                    "type": "integer"
                },
                {
                    "name": "categories_id",
                    "type": "integer"
                },
                {
                    "name": "tags_id",
                    "type": "integer"
                },
                {
                    "name": "actualites_id",
                    "type": "integer"
                }
            ],
            "constraints": [
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`parent_id`) REFERENCES `payload_locked_documents`(`id`) ON UPDATE no action ON DELETE cascade"
                },
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`users_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade"
                },
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`media_id`) REFERENCES `media`(`id`) ON UPDATE no action ON DELETE cascade"
                },
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`categories_id`) REFERENCES `categories`(`id`) ON UPDATE no action ON DELETE cascade"
                },
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`tags_id`) REFERENCES `tags`(`id`) ON UPDATE no action ON DELETE cascade"
                },
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`actualites_id`) REFERENCES `actualites`(`id`) ON UPDATE no action ON DELETE cascade\n"
                }
            ],
            "rows": [
            ]
        },
        {
            "type": "table",
            "database": null,
            "name": "payload_migrations",
            "withoutRowId": false,
            "strict": false,
            "ddl": "CREATE TABLE `payload_migrations` (\n\t`id` integer PRIMARY KEY NOT NULL,\n\t`name` text,\n\t`batch` numeric,\n\t`updated_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,\n\t`created_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL\n)",
            "columns": [
                {
                    "name": "id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "PRIMARY KEY",
                            "definition": "PRIMARY KEY "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "name",
                    "type": "text"
                },
                {
                    "name": "batch",
                    "type": "numeric"
                },
                {
                    "name": "updated_at",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "DEFAULT",
                            "definition": "DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "created_at",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "DEFAULT",
                            "definition": "DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL\n"
                        }
                    ]
                }
            ],
            "rows": [
                [
                    1,
                    "dev",
                    -1,
                    "2026-02-28 23:55:40",
                    "2026-02-25T23:47:33.958Z"
                ]
            ]
        },
        {
            "type": "table",
            "database": null,
            "name": "payload_preferences",
            "withoutRowId": false,
            "strict": false,
            "ddl": "CREATE TABLE `payload_preferences` (\n\t`id` integer PRIMARY KEY NOT NULL,\n\t`key` text,\n\t`value` text,\n\t`updated_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,\n\t`created_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL\n)",
            "columns": [
                {
                    "name": "id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "PRIMARY KEY",
                            "definition": "PRIMARY KEY "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "key",
                    "type": "text"
                },
                {
                    "name": "value",
                    "type": "text"
                },
                {
                    "name": "updated_at",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "DEFAULT",
                            "definition": "DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "created_at",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "DEFAULT",
                            "definition": "DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL\n"
                        }
                    ]
                }
            ],
            "rows": [
                [
                    1,
                    "collection-users",
                    "{}",
                    "2026-02-25T23:51:36.551Z",
                    "2026-02-25T23:51:36.547Z"
                ],
                [
                    2,
                    "collection-media",
                    "{\"editViewType\":\"default\"}",
                    "2026-02-26T00:06:53.959Z",
                    "2026-02-25T23:51:40.711Z"
                ],
                [
                    3,
                    "collection-categories",
                    "{}",
                    "2026-02-25T23:51:49.005Z",
                    "2026-02-25T23:51:49.004Z"
                ],
                [
                    4,
                    "collection-tags",
                    "{}",
                    "2026-02-25T23:51:55.254Z",
                    "2026-02-25T23:51:55.253Z"
                ],
                [
                    5,
                    "collection-actualites",
                    "{\"editViewType\":\"default\",\"limit\":10,\"sort\":\"-publishDate\"}",
                    "2026-02-26T00:07:50.418Z",
                    "2026-02-25T23:51:59.677Z"
                ],
                [
                    6,
                    "nav",
                    "{\"open\":true}",
                    "2026-02-28T15:23:53.800Z",
                    "2026-02-26T00:59:00.058Z"
                ]
            ]
        },
        {
            "type": "table",
            "database": null,
            "name": "payload_preferences_rels",
            "withoutRowId": false,
            "strict": false,
            "ddl": "CREATE TABLE `payload_preferences_rels` (\n\t`id` integer PRIMARY KEY NOT NULL,\n\t`order` integer,\n\t`parent_id` integer NOT NULL,\n\t`path` text NOT NULL,\n\t`users_id` integer,\n\tFOREIGN KEY (`parent_id`) REFERENCES `payload_preferences`(`id`) ON UPDATE no action ON DELETE cascade,\n\tFOREIGN KEY (`users_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade\n)",
            "columns": [
                {
                    "name": "id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "PRIMARY KEY",
                            "definition": "PRIMARY KEY "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "order",
                    "type": "integer"
                },
                {
                    "name": "parent_id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "path",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "users_id",
                    "type": "integer"
                }
            ],
            "constraints": [
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`parent_id`) REFERENCES `payload_preferences`(`id`) ON UPDATE no action ON DELETE cascade"
                },
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`users_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade\n"
                }
            ],
            "rows": [
                [
                    1,
                    null,
                    1,
                    "user",
                    1
                ],
                [
                    3,
                    null,
                    3,
                    "user",
                    1
                ],
                [
                    4,
                    null,
                    4,
                    "user",
                    1
                ],
                [
                    6,
                    null,
                    2,
                    "user",
                    1
                ],
                [
                    7,
                    null,
                    5,
                    "user",
                    1
                ],
                [
                    8,
                    null,
                    6,
                    "user",
                    1
                ]
            ]
        },
        {
            "type": "table",
            "database": null,
            "name": "tags",
            "withoutRowId": false,
            "strict": false,
            "ddl": "CREATE TABLE `tags` (\n\t`id` integer PRIMARY KEY NOT NULL,\n\t`slug` text NOT NULL,\n\t`updated_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,\n\t`created_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL\n)",
            "columns": [
                {
                    "name": "id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "PRIMARY KEY",
                            "definition": "PRIMARY KEY "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "slug",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "updated_at",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "DEFAULT",
                            "definition": "DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "created_at",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "DEFAULT",
                            "definition": "DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL\n"
                        }
                    ]
                }
            ],
            "rows": [
            ]
        },
        {
            "type": "table",
            "database": null,
            "name": "tags_locales",
            "withoutRowId": false,
            "strict": false,
            "ddl": "CREATE TABLE `tags_locales` (\n\t`name` text NOT NULL,\n\t`id` integer PRIMARY KEY NOT NULL,\n\t`_locale` text NOT NULL,\n\t`_parent_id` integer NOT NULL,\n\tFOREIGN KEY (`_parent_id`) REFERENCES `tags`(`id`) ON UPDATE no action ON DELETE cascade\n)",
            "columns": [
                {
                    "name": "name",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "PRIMARY KEY",
                            "definition": "PRIMARY KEY "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "_locale",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "_parent_id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                }
            ],
            "constraints": [
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`_parent_id`) REFERENCES `tags`(`id`) ON UPDATE no action ON DELETE cascade\n"
                }
            ],
            "rows": [
            ]
        },
        {
            "type": "table",
            "database": null,
            "name": "users",
            "withoutRowId": false,
            "strict": false,
            "ddl": "CREATE TABLE `users` (\n\t`id` integer PRIMARY KEY NOT NULL,\n\t`name` text NOT NULL,\n\t`role` text DEFAULT 'author' NOT NULL,\n\t`avatar_id` integer,\n\t`updated_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,\n\t`created_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,\n\t`email` text NOT NULL,\n\t`reset_password_token` text,\n\t`reset_password_expiration` text,\n\t`salt` text,\n\t`hash` text,\n\t`login_attempts` numeric DEFAULT 0,\n\t`lock_until` text,\n\tFOREIGN KEY (`avatar_id`) REFERENCES `media`(`id`) ON UPDATE no action ON DELETE set null\n)",
            "columns": [
                {
                    "name": "id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "PRIMARY KEY",
                            "definition": "PRIMARY KEY "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "name",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "role",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "DEFAULT",
                            "definition": "DEFAULT 'author' "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "avatar_id",
                    "type": "integer"
                },
                {
                    "name": "updated_at",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "DEFAULT",
                            "definition": "DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "created_at",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "DEFAULT",
                            "definition": "DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "email",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "reset_password_token",
                    "type": "text"
                },
                {
                    "name": "reset_password_expiration",
                    "type": "text"
                },
                {
                    "name": "salt",
                    "type": "text"
                },
                {
                    "name": "hash",
                    "type": "text"
                },
                {
                    "name": "login_attempts",
                    "type": "numeric",
                    "constraints": [
                        {
                            "type": "DEFAULT",
                            "definition": "DEFAULT 0"
                        }
                    ]
                },
                {
                    "name": "lock_until",
                    "type": "text"
                }
            ],
            "constraints": [
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`avatar_id`) REFERENCES `media`(`id`) ON UPDATE no action ON DELETE set null\n"
                }
            ],
            "rows": [
                [
                    1,
                    "KABORE Landry",
                    "admin",
                    null,
                    "2026-02-25T23:51:20.933Z",
                    "2026-02-25T23:51:20.931Z",
                    "usertest@gmail.com",
                    null,
                    null,
                    "01fe202cce3f05dde040e1f32d93c1c60354daf7cb4db38776a664b322119f0f",
                    "12c0a9caab20676875d009f1f8338f5c8e9c107f2f27c9f44d17c05ec006d9b10329155b8b644958adfaa4fa50198575b2ad930788a19b6f7565ff9c0728f5f52d3a67cda8caddd9edf5cc1774545ee1a9c25bef074eb0aee34ccfc4f651071211f4c7fe55494e3a734842b42e68e460d9a9f04bd007c698902f2264a21591e571902fb90f82240a895c31823824e8c195f5b1288d8abbd1509ed6ca828095944e1a6526883244add33185385a1565b784412162e431a06429b30b528ee470b293c149939219043fca20af9ebdafc78333bc7490701f5b84746d85de3c9c421b509c7ce41f0100b27ec5ab7ea144cec15f206bb98c9faf5b59cb82081c3b0abfe90bdb21095d85529a932e40537bcfd2d9f60eea8792395a8eef42a4974c4662f80d2dea17268beabc72bd9580218d10a6170ecad5aa2175bd8864e6227aa0bdb18e908239b633dd440181b32ceaae7de45dbb701c522c3e088f206eab79ddf553082e862fae3d3df09e55d8ac800aa9c8fe9dbf674a423c51ac000e705581fc58f35c67661d642f3f34e9ccde4966af49901f04c7b0de7456e5fd99001f86bb8c7b2db9d39fab2ed12b0f4c7060a962572fb0368089c4bcf5dc7cf1f9dc8db96893fc7b4df20e54c30675b58ea17a0e2f63fb72eaf67a2a1e19fc6b8c7ae4700e3d3dabba8fa56c252f170e771953c38ae00fb82fe475e9ca508047887fa160",
                    0,
                    null
                ]
            ]
        },
        {
            "type": "table",
            "database": null,
            "name": "users_sessions",
            "withoutRowId": false,
            "strict": false,
            "ddl": "CREATE TABLE `users_sessions` (\n\t`_order` integer NOT NULL,\n\t`_parent_id` integer NOT NULL,\n\t`id` text PRIMARY KEY NOT NULL,\n\t`created_at` text,\n\t`expires_at` text NOT NULL,\n\tFOREIGN KEY (`_parent_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade\n)",
            "columns": [
                {
                    "name": "_order",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "_parent_id",
                    "type": "integer",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "id",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "PRIMARY KEY",
                            "definition": "PRIMARY KEY "
                        },
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                },
                {
                    "name": "created_at",
                    "type": "text"
                },
                {
                    "name": "expires_at",
                    "type": "text",
                    "constraints": [
                        {
                            "type": "NOT NULL",
                            "definition": "NOT NULL"
                        }
                    ]
                }
            ],
            "constraints": [
                {
                    "type": "FOREIGN KEY",
                    "definition": "FOREIGN KEY (`_parent_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade\n"
                }
            ],
            "rows": [
                [
                    1,
                    1,
                    "538e0eee-67da-4a89-acaf-d1d1e0c1b2be",
                    "2026-02-28T14:55:29.422Z",
                    "2026-02-28T16:55:29.422Z"
                ]
            ]
        },
        {
            "type": "index",
            "database": null,
            "name": "_actualites_v_autosave_idx",
            "unique": false,
            "ddl": "CREATE INDEX `_actualites_v_autosave_idx` ON `_actualites_v` (`autosave`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "_actualites_v_created_at_idx",
            "unique": false,
            "ddl": "CREATE INDEX `_actualites_v_created_at_idx` ON `_actualites_v` (`created_at`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "_actualites_v_latest_idx",
            "unique": false,
            "ddl": "CREATE INDEX `_actualites_v_latest_idx` ON `_actualites_v` (`latest`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "_actualites_v_locales_locale_parent_id_unique",
            "unique": true,
            "ddl": "CREATE UNIQUE INDEX `_actualites_v_locales_locale_parent_id_unique` ON `_actualites_v_locales` (`_locale`,`_parent_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "_actualites_v_parent_idx",
            "unique": false,
            "ddl": "CREATE INDEX `_actualites_v_parent_idx` ON `_actualites_v` (`parent_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "_actualites_v_published_locale_idx",
            "unique": false,
            "ddl": "CREATE INDEX `_actualites_v_published_locale_idx` ON `_actualites_v` (`published_locale`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "_actualites_v_rels_categories_id_idx",
            "unique": false,
            "ddl": "CREATE INDEX `_actualites_v_rels_categories_id_idx` ON `_actualites_v_rels` (`categories_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "_actualites_v_rels_order_idx",
            "unique": false,
            "ddl": "CREATE INDEX `_actualites_v_rels_order_idx` ON `_actualites_v_rels` (`order`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "_actualites_v_rels_parent_idx",
            "unique": false,
            "ddl": "CREATE INDEX `_actualites_v_rels_parent_idx` ON `_actualites_v_rels` (`parent_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "_actualites_v_rels_path_idx",
            "unique": false,
            "ddl": "CREATE INDEX `_actualites_v_rels_path_idx` ON `_actualites_v_rels` (`path`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "_actualites_v_rels_tags_id_idx",
            "unique": false,
            "ddl": "CREATE INDEX `_actualites_v_rels_tags_id_idx` ON `_actualites_v_rels` (`tags_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "_actualites_v_snapshot_idx",
            "unique": false,
            "ddl": "CREATE INDEX `_actualites_v_snapshot_idx` ON `_actualites_v` (`snapshot`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "_actualites_v_updated_at_idx",
            "unique": false,
            "ddl": "CREATE INDEX `_actualites_v_updated_at_idx` ON `_actualites_v` (`updated_at`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "_actualites_v_version_carousel_image_idx",
            "unique": false,
            "ddl": "CREATE INDEX `_actualites_v_version_carousel_image_idx` ON `_actualites_v_version_carousel` (`image_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "_actualites_v_version_carousel_locales_locale_parent_id_uniq",
            "unique": true,
            "ddl": "CREATE UNIQUE INDEX `_actualites_v_version_carousel_locales_locale_parent_id_uniq` ON `_actualites_v_version_carousel_locales` (`_locale`,`_parent_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "_actualites_v_version_carousel_order_idx",
            "unique": false,
            "ddl": "CREATE INDEX `_actualites_v_version_carousel_order_idx` ON `_actualites_v_version_carousel` (`_order`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "_actualites_v_version_carousel_parent_id_idx",
            "unique": false,
            "ddl": "CREATE INDEX `_actualites_v_version_carousel_parent_id_idx` ON `_actualites_v_version_carousel` (`_parent_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "_actualites_v_version_version__status_idx",
            "unique": false,
            "ddl": "CREATE INDEX `_actualites_v_version_version__status_idx` ON `_actualites_v` (`version__status`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "_actualites_v_version_version_author_idx",
            "unique": false,
            "ddl": "CREATE INDEX `_actualites_v_version_version_author_idx` ON `_actualites_v` (`version_author_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "_actualites_v_version_version_created_at_idx",
            "unique": false,
            "ddl": "CREATE INDEX `_actualites_v_version_version_created_at_idx` ON `_actualites_v` (`version_created_at`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "_actualites_v_version_version_og_image_idx",
            "unique": false,
            "ddl": "CREATE INDEX `_actualites_v_version_version_og_image_idx` ON `_actualites_v` (`version_og_image_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "_actualites_v_version_version_slug_idx",
            "unique": false,
            "ddl": "CREATE INDEX `_actualites_v_version_version_slug_idx` ON `_actualites_v` (`version_slug`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "_actualites_v_version_version_updated_at_idx",
            "unique": false,
            "ddl": "CREATE INDEX `_actualites_v_version_version_updated_at_idx` ON `_actualites_v` (`version_updated_at`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "actualites__status_idx",
            "unique": false,
            "ddl": "CREATE INDEX `actualites__status_idx` ON `actualites` (`_status`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "actualites_author_idx",
            "unique": false,
            "ddl": "CREATE INDEX `actualites_author_idx` ON `actualites` (`author_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "actualites_carousel_image_idx",
            "unique": false,
            "ddl": "CREATE INDEX `actualites_carousel_image_idx` ON `actualites_carousel` (`image_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "actualites_carousel_locales_locale_parent_id_unique",
            "unique": true,
            "ddl": "CREATE UNIQUE INDEX `actualites_carousel_locales_locale_parent_id_unique` ON `actualites_carousel_locales` (`_locale`,`_parent_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "actualites_carousel_order_idx",
            "unique": false,
            "ddl": "CREATE INDEX `actualites_carousel_order_idx` ON `actualites_carousel` (`_order`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "actualites_carousel_parent_id_idx",
            "unique": false,
            "ddl": "CREATE INDEX `actualites_carousel_parent_id_idx` ON `actualites_carousel` (`_parent_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "actualites_created_at_idx",
            "unique": false,
            "ddl": "CREATE INDEX `actualites_created_at_idx` ON `actualites` (`created_at`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "actualites_locales_locale_parent_id_unique",
            "unique": true,
            "ddl": "CREATE UNIQUE INDEX `actualites_locales_locale_parent_id_unique` ON `actualites_locales` (`_locale`,`_parent_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "actualites_og_image_idx",
            "unique": false,
            "ddl": "CREATE INDEX `actualites_og_image_idx` ON `actualites` (`og_image_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "actualites_rels_categories_id_idx",
            "unique": false,
            "ddl": "CREATE INDEX `actualites_rels_categories_id_idx` ON `actualites_rels` (`categories_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "actualites_rels_order_idx",
            "unique": false,
            "ddl": "CREATE INDEX `actualites_rels_order_idx` ON `actualites_rels` (`order`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "actualites_rels_parent_idx",
            "unique": false,
            "ddl": "CREATE INDEX `actualites_rels_parent_idx` ON `actualites_rels` (`parent_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "actualites_rels_path_idx",
            "unique": false,
            "ddl": "CREATE INDEX `actualites_rels_path_idx` ON `actualites_rels` (`path`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "actualites_rels_tags_id_idx",
            "unique": false,
            "ddl": "CREATE INDEX `actualites_rels_tags_id_idx` ON `actualites_rels` (`tags_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "actualites_slug_idx",
            "unique": true,
            "ddl": "CREATE UNIQUE INDEX `actualites_slug_idx` ON `actualites` (`slug`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "actualites_updated_at_idx",
            "unique": false,
            "ddl": "CREATE INDEX `actualites_updated_at_idx` ON `actualites` (`updated_at`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "categories_created_at_idx",
            "unique": false,
            "ddl": "CREATE INDEX `categories_created_at_idx` ON `categories` (`created_at`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "categories_locales_locale_parent_id_unique",
            "unique": true,
            "ddl": "CREATE UNIQUE INDEX `categories_locales_locale_parent_id_unique` ON `categories_locales` (`_locale`,`_parent_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "categories_slug_idx",
            "unique": true,
            "ddl": "CREATE UNIQUE INDEX `categories_slug_idx` ON `categories` (`slug`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "categories_updated_at_idx",
            "unique": false,
            "ddl": "CREATE INDEX `categories_updated_at_idx` ON `categories` (`updated_at`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "media_created_at_idx",
            "unique": false,
            "ddl": "CREATE INDEX `media_created_at_idx` ON `media` (`created_at`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "media_filename_idx",
            "unique": true,
            "ddl": "CREATE UNIQUE INDEX `media_filename_idx` ON `media` (`filename`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "media_locales_locale_parent_id_unique",
            "unique": true,
            "ddl": "CREATE UNIQUE INDEX `media_locales_locale_parent_id_unique` ON `media_locales` (`_locale`,`_parent_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "media_sizes_card_sizes_card_filename_idx",
            "unique": false,
            "ddl": "CREATE INDEX `media_sizes_card_sizes_card_filename_idx` ON `media` (`sizes_card_filename`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "media_sizes_hero_sizes_hero_filename_idx",
            "unique": false,
            "ddl": "CREATE INDEX `media_sizes_hero_sizes_hero_filename_idx` ON `media` (`sizes_hero_filename`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "media_sizes_thumbnail_sizes_thumbnail_filename_idx",
            "unique": false,
            "ddl": "CREATE INDEX `media_sizes_thumbnail_sizes_thumbnail_filename_idx` ON `media` (`sizes_thumbnail_filename`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "media_updated_at_idx",
            "unique": false,
            "ddl": "CREATE INDEX `media_updated_at_idx` ON `media` (`updated_at`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "payload_kv_key_idx",
            "unique": true,
            "ddl": "CREATE UNIQUE INDEX `payload_kv_key_idx` ON `payload_kv` (`key`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "payload_locked_documents_created_at_idx",
            "unique": false,
            "ddl": "CREATE INDEX `payload_locked_documents_created_at_idx` ON `payload_locked_documents` (`created_at`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "payload_locked_documents_global_slug_idx",
            "unique": false,
            "ddl": "CREATE INDEX `payload_locked_documents_global_slug_idx` ON `payload_locked_documents` (`global_slug`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "payload_locked_documents_rels_actualites_id_idx",
            "unique": false,
            "ddl": "CREATE INDEX `payload_locked_documents_rels_actualites_id_idx` ON `payload_locked_documents_rels` (`actualites_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "payload_locked_documents_rels_categories_id_idx",
            "unique": false,
            "ddl": "CREATE INDEX `payload_locked_documents_rels_categories_id_idx` ON `payload_locked_documents_rels` (`categories_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "payload_locked_documents_rels_media_id_idx",
            "unique": false,
            "ddl": "CREATE INDEX `payload_locked_documents_rels_media_id_idx` ON `payload_locked_documents_rels` (`media_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "payload_locked_documents_rels_order_idx",
            "unique": false,
            "ddl": "CREATE INDEX `payload_locked_documents_rels_order_idx` ON `payload_locked_documents_rels` (`order`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "payload_locked_documents_rels_parent_idx",
            "unique": false,
            "ddl": "CREATE INDEX `payload_locked_documents_rels_parent_idx` ON `payload_locked_documents_rels` (`parent_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "payload_locked_documents_rels_path_idx",
            "unique": false,
            "ddl": "CREATE INDEX `payload_locked_documents_rels_path_idx` ON `payload_locked_documents_rels` (`path`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "payload_locked_documents_rels_tags_id_idx",
            "unique": false,
            "ddl": "CREATE INDEX `payload_locked_documents_rels_tags_id_idx` ON `payload_locked_documents_rels` (`tags_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "payload_locked_documents_rels_users_id_idx",
            "unique": false,
            "ddl": "CREATE INDEX `payload_locked_documents_rels_users_id_idx` ON `payload_locked_documents_rels` (`users_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "payload_locked_documents_updated_at_idx",
            "unique": false,
            "ddl": "CREATE INDEX `payload_locked_documents_updated_at_idx` ON `payload_locked_documents` (`updated_at`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "payload_migrations_created_at_idx",
            "unique": false,
            "ddl": "CREATE INDEX `payload_migrations_created_at_idx` ON `payload_migrations` (`created_at`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "payload_migrations_updated_at_idx",
            "unique": false,
            "ddl": "CREATE INDEX `payload_migrations_updated_at_idx` ON `payload_migrations` (`updated_at`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "payload_preferences_created_at_idx",
            "unique": false,
            "ddl": "CREATE INDEX `payload_preferences_created_at_idx` ON `payload_preferences` (`created_at`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "payload_preferences_key_idx",
            "unique": false,
            "ddl": "CREATE INDEX `payload_preferences_key_idx` ON `payload_preferences` (`key`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "payload_preferences_rels_order_idx",
            "unique": false,
            "ddl": "CREATE INDEX `payload_preferences_rels_order_idx` ON `payload_preferences_rels` (`order`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "payload_preferences_rels_parent_idx",
            "unique": false,
            "ddl": "CREATE INDEX `payload_preferences_rels_parent_idx` ON `payload_preferences_rels` (`parent_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "payload_preferences_rels_path_idx",
            "unique": false,
            "ddl": "CREATE INDEX `payload_preferences_rels_path_idx` ON `payload_preferences_rels` (`path`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "payload_preferences_rels_users_id_idx",
            "unique": false,
            "ddl": "CREATE INDEX `payload_preferences_rels_users_id_idx` ON `payload_preferences_rels` (`users_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "payload_preferences_updated_at_idx",
            "unique": false,
            "ddl": "CREATE INDEX `payload_preferences_updated_at_idx` ON `payload_preferences` (`updated_at`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "tags_created_at_idx",
            "unique": false,
            "ddl": "CREATE INDEX `tags_created_at_idx` ON `tags` (`created_at`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "tags_locales_locale_parent_id_unique",
            "unique": true,
            "ddl": "CREATE UNIQUE INDEX `tags_locales_locale_parent_id_unique` ON `tags_locales` (`_locale`,`_parent_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "tags_slug_idx",
            "unique": true,
            "ddl": "CREATE UNIQUE INDEX `tags_slug_idx` ON `tags` (`slug`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "tags_updated_at_idx",
            "unique": false,
            "ddl": "CREATE INDEX `tags_updated_at_idx` ON `tags` (`updated_at`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "users_avatar_idx",
            "unique": false,
            "ddl": "CREATE INDEX `users_avatar_idx` ON `users` (`avatar_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "users_created_at_idx",
            "unique": false,
            "ddl": "CREATE INDEX `users_created_at_idx` ON `users` (`created_at`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "users_email_idx",
            "unique": true,
            "ddl": "CREATE UNIQUE INDEX `users_email_idx` ON `users` (`email`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "users_sessions_order_idx",
            "unique": false,
            "ddl": "CREATE INDEX `users_sessions_order_idx` ON `users_sessions` (`_order`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "users_sessions_parent_id_idx",
            "unique": false,
            "ddl": "CREATE INDEX `users_sessions_parent_id_idx` ON `users_sessions` (`_parent_id`)"
        },
        {
            "type": "index",
            "database": null,
            "name": "users_updated_at_idx",
            "unique": false,
            "ddl": "CREATE INDEX `users_updated_at_idx` ON `users` (`updated_at`)"
        }
    ]
}