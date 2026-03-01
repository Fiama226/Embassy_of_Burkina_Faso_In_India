import React from "react";
import { Card } from "@mantine/core";
import Image from "next/image";

function Ambassador() {
  return (
    <div className="bg-white mx-20 p-10 my-10">
      <p
        style={{
          fontWeight: "bold",
          fontSize: "50px",
          textAlign: "center",
          wordBreak: "break-all",
        }}
      >
        L'ambassadeur
      </p>
      <div className=" mt-3 space-x-4 indent-10">
        <Image
          src={"/burkina_ambassador.jpeg"}
          alt=""
          width={1000}
          height={1000}
          className="w-100 h-100 object-cover float-left mr-10 mb-4 rounded-lg"
        />
        <p>
         H.E. Dr. Désiré Boniface Somé assumed his role as Head of Mission in New Delhi on August 29, 2023. A distinguished academic and Associate Professor of Sociology from the University Joseph Ki-Zerbo, Dr. Somé combines high-level research expertise with a strategic vision for South-South cooperation.

His mission focuses on three strategic pillars:

Economic Partnership: Strengthening trade and investment in the mining, textile, and pharmaceutical sectors.

Technological Transfer: Adapting Indian innovations to enhance Burkina Faso’s agriculture and industry.

Educational Exchange: Fostering academic mobility and professional training for Burkinabè youth.

In addition to India, Dr. Somé oversees diplomatic relations with Indonesia, Thailand, and Nepal, working to position Burkina Faso as a key partner for development and cultural exchange across the region.
        </p>
      </div>
    </div>
  );
}

export default Ambassador;
