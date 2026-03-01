import React from 'react'
import Image from 'next/image'

function DividerOfComponents() {

  return (
  <span className="flex items-center">
  <span className="h-px flex-1 bg-gray-300 ml-20 bg-red-500 w-[20vw] border-dashed"> </span>

  <span className="shrink-0 px-4 text-gray-900"><Image src="/mapBurkinaFaso.png" className='w-25 h-25' width={1000} height={1000} alt='map of burkina faso'/></span>

  <span className="h-px flex-1 bg-gray-300 mr-20 bg-green-500 w-[20vw] border-dashed"> </span>
</span>
  )
}

export default DividerOfComponents