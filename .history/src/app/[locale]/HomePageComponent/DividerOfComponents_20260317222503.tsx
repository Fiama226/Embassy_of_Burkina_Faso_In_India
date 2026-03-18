import React from 'react'
import Image from 'next/image'


function DividerOfComponents() {
  return (
    <span className="flex flex-col sm:flex-row items-center w-full py-4">
      <span className="h-px flex-1 bg-red-500 border-dashed w-full sm:w-[20vw] ml-0 sm:ml-8" />
      <span className="shrink-0 px-2 sm:px-4 text-gray-900 flex justify-center">
        <Image 
          src="/mapBurkinaFaso.png" 
          className="w-24 h-24 sm:w-32 sm:h-32 object-contain"
          width={128} 
          height={128} 
          alt="map of burkina faso" 
          sizes="(max-width: 640px) 96px, 128px"
        />
      </span>
      <span className="h-px flex-1 bg-green-500 border-dashed w-full sm:w-[20vw] mr-0 sm:mr-8" />
    </span>
  );
}

export default DividerOfComponents