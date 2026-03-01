import React from "react";
import Image from "next/image";

const Reseau_consulaire = () => {
  return (
    <div
      style={{
        backgroundColor: "#a99985",
      }}
      className="mx-10 my-10 p-10 h-full"
    >
      <h1 className="text-center text-5xl my-10 font-bold">
        Le Reseau consulaire
      </h1>

      <p>
        La juridiction de l’Ambassade dispose de trois consulats honoraires à
        savoir celui de Mumbai dans l’Etat de Maharashtra en Inde, celui de
        Bangkok en Thailand et récemment celui de Jakarta en Indonésie. Seuls
        les consulats honoraires de Bangkok et de Jakarta ont des consuls
        honoraires et sont fonctionnels.
      </p>
      <div className="w-full flex flex-row justify-center gap-10 pb-10 mt-10">
        <div className="flex flex-col h-80 w-100 ">
          <Image
            src={"/flags/Flag_of_Thailand.svg"}
            width={1000}
            height={1000}
            className="w-90 h-90 justify-center mb-5"
            alt=""
          />
          <p className="text-4xl font-bold text-center mb-1">
            Consulat de Bangkok
          </p>
          <div className="flex flex-row ">
            <Image
              src={"/icons/location.svg"}
              width={1000}
              height={1000}
              alt=""
              className="w-4 h-4 mt-1 mr-2"
            />
            BHIRABHOL ISRAPRASARAT CT, TOWER, 31st FLOOR 191/2-5 RATCHADAPISEK
            ROAD KLONGTOEY BANGKOK 10110, TEL: 6622580060, THAILAND
          </div>
          <div className="flex flex-row ">
            <Image
              src={"/icons/user.svg"}
              width={1000}
              height={1000}
              alt=""
              className="w-4 h-4 mt-1 mr-2"
            />
            MR. ANUSAK INTHRAPHUVASAK
          </div>
        </div>
        <div className="flex flex-col h-80 w-100 ">
          <Image
            src={"/flags/Flag_of_Indonesia.svg"}
            width={1000}
            height={1000}
            className="w-90 h-90 justify-center mb-5"
            alt=""
          />
          <p className="text-4xl font-bold text-center mb-1">
            Consulat de Jakarta
          </p>
          <div className="flex flex-row ">
            <Image
              src={"/icons/location.svg"}
              width={1000}
              height={1000}
              alt=""
              className="w-4 h-4 mt-1 mr-2"
            />
            MELAWAI RAYA GD. PANIN BANK LT.4 JALAN SUNGAI SAMBAS VI NO. 189 A-B
            KRAMAT PELA, KEBAYORAN BARU, KOTA JAKARTA SELATAN, DKI JAKARTA
            12160, TEL: 02-2708345 , INDONESIE
          </div>
          <div className="flex flex-row ">
            <Image
              src={"/icons/user.svg"}
              width={1000}
              height={1000}
              alt=""
              className="w-4 h-4 mt-1 mr-2"
            />
            MR. EDDIE GUNADIRDJA
          </div>
        </div>
      </div>
    </div>
  );
};

export default Reseau_consulaire;
