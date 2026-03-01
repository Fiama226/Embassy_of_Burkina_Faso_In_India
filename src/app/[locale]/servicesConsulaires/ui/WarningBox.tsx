import { FaExclamationTriangle } from "react-icons/fa";

interface WarningBoxProps {
  title: string;
  message: string;
}

export function WarningBox({ title, message }: WarningBoxProps) {
  return (
    <div
      role="alert"
      className="bg-amber-50 rounded-xl p-6 border border-amber-200"
    >
      <div className="flex items-start gap-4">
        <div className="w-10 h-10 bg-amber-500 rounded-lg flex items-center justify-center flex-shrink-0">
          <FaExclamationTriangle className="text-white" aria-hidden="true" />
        </div>
        <div>
          <h4 className="font-bold text-amber-900 mb-2">{title}</h4>
          <p className="text-amber-800 text-sm leading-relaxed">{message}</p>
        </div>
      </div>
    </div>
  );
}