"use client";
import React from "react";

import { Accordion, AccordionTab } from "primereact/accordion";

const data = [
  {
    id: 1,
    question: "Pourquoi dois-je m’inscrire au consulat?",
    answer_question: [
      {
        id: 1,
        response:
          "La grande majorité des Burkinabés qui voyagent quotidiennement à l’étranger ne rencontrent aucune difficulté. Cependant, du fait de nos missions, nous sommes en mesure d’assister les Burkinabés victimes d’actes criminels, d’accidents, de maladies, de décès, de catastrophes naturelles ou d’origine humaine, de troubles civils, ou dont la famille ou les proches ont besoin de les contacter en une situation d’urgence.",
      },
      {
        id: 2,
        response:
          " Si vous demandez un service auprès de l’ambassade ou du consulat à l’étranger, le personnel vous demandera de fournir une preuve de citoyenneté burkinabé, comme un passeport ou une carte d’identité.",
      },
      {
        id: 3,
        response:
          "En enregistrant votre voyage en ligne, vous assistez les services de localisation en cas d’urgence, en vérifiant votre statut et en assurant la liaison avec votre famille ou vos proches.",
      },
      {
        id: 4,
        response:
          "L’inscription est volontaire et gratuite. Nous vous encourageons à considérer l’enregistrement comme faisant partie intégrante de la planification et de la sécurité de votre voyage.",
      },
    ],
  },
  {
    id: 2,
    question: "Comment m’inscrire ?",
    answer_question: [
      {
        id: 1,
        response:
          "La Carte Consulaire est une pièce d’identité délivrée par l’Ambassade aux citoyens burkinabé immatriculés dans sa juridiction. Tous les citoyens du Burkina Faso ont le droit de recevoir une carte consulaire. Pour obtenir une Carte Consulaire, inscrivez-vous auprès de l’Ambassade sur présentation de tout document prouvant la citoyenneté burkinabé (passeport, carte d’identité, etc.).",
      },
      { id: 2, response: "" },
      { id: 3, response: "" },
    ],
  },
  {
    id: 3,
    question:
      "Comment l’Ambassade ou le Consulat peut-il m’aider pendant que je suis à l’étranger ?",
    answer_question: [
      {
        id: 1,
        response:
          "Les services consulaires sont fournis aux Burkinabés qui travaillent, vivent et voyagent à l’étranger. Les services consulaires fonctionnent 24 heures sur 24, 7 jours sur 7. Une liste détaillée des services est disponible ici.",
      },
    ],
  },
  {
    id: 4,
    question: "Comment mes informations seront-elles utilisées ?",
    answer_question: [
      {
        id: 1,
        response:
          "Le Consulat dans les missions du Burkina Faso à l’étranger utilisera vos informations protégées si nécessaire en cas de catastrophe, d’urgence ou de toute autre crise",
      },
      {
        id: 2,
        response:
          "Seuls les agents autorisés du Consulat ont accès aux informations qui ne seront utilisées qu’en cas de catastrophe, d’urgence ou autre crise. Cela permettra aux responsables autorisés de réagir, par exemple, de contacter la famille ou les proches pour vérifier le statut des Burkinabés voyageant à l’étranger qui pourraient avoir été touchés par l’urgence.",
      },
    ],
  },
  {
    id: 5,
    question: "Inscription et confidentialité ?",
    answer_question: [
      {
        id: 1,
        response:
          "Le Consulat s’engage à veiller à ce que toute information personnelle reçue via le processus d’inscription en ligne soit protégée contre toute divulgation non autorisée.",
      },
      {
        id: 2,
        response:
          "Le Consulat ne divulguera pas les informations que vous fournissez lors du processus d’inscription à des tiers (y compris les membres de votre famille) à moins que vous n’ayez préalablement donné une autorisation écrite pour le faire. Dans le cas où des membres de votre famille se renseigneraient sur votre localisation, ces demandes vous seront transmises. Vous pouvez choisir d’informer le Consulat de votre décision de répondre ou de ne pas répondre.",
      },
    ],
  },
  {
    id: 6,
    question: "Qu’est-ce qu’un Visa ?",
    answer_question: [
      {
        id: 1,
        response:
          "Un citoyen d’un pays étranger qui cherche à entrer aux États-Unis doit généralement d’abord obtenir un visa américain, qui est placé dans le passeport du voyageur, un document de voyage délivré par le pays de citoyenneté du voyageur.",
      },
      {
        id: 2,
        response:
          "Certains voyageurs internationaux peuvent être éligibles pour voyager au Burkina Faso sans visa s’ils remplissent les conditions requises pour voyager sans visa. La section visa de ce site Web est destinée aux citoyens américains souhaitant se rendre au Burkina Faso.",
      },
    ],
  },
];

function Faq_questions_and_answers() {
  return (
    <div style={{ backgroundColor: "#a99985" }} className="mx-10 my-10 ">
      <p className="text-center text-5xl my-10 font-bold">
        Questions et réponses Frequentes
      </p>

      <Accordion className="p-10">
        {data.map((item) => (
          <AccordionTab key={item.id} header={item.question}>
            <div className="indent-10">
              {item.answer_question.map((x) => (
                <p key={x.id}>{x.response}</p>
              ))}
            </div>
          </AccordionTab>
        ))}
      </Accordion>
    </div>
  );
}

export default Faq_questions_and_answers;
