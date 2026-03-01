"use client";

import { useState, useTransition } from "react";

interface NewsletterFormProps {
  title: string;
}

type FormStatus = "idle" | "loading" | "success" | "error";

export function NewsletterForm({ title }: NewsletterFormProps) {
  const [email, setEmail] = useState("");
  const [status, setStatus] = useState<FormStatus>("idle");
  const [isPending, startTransition] = useTransition();

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    
    // Basic email validation
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      setStatus("error");
      return;
    }

    startTransition(async () => {
      setStatus("loading");
      
      try {
        // Replace with actual API call
        await new Promise((resolve) => setTimeout(resolve, 1000));
        
        // Simulated success
        setStatus("success");
        setEmail("");
        
        // Reset after 3 seconds
        setTimeout(() => setStatus("idle"), 3000);
      } catch {
        setStatus("error");
      }
    });
  };

  return (
    <div>
      <p 
        id="newsletter-label"
        className="text-xs text-gray-400 mb-2 uppercase font-bold tracking-wide"
      >
        {title}
      </p>
      
      <form 
        onSubmit={handleSubmit} 
        className="flex gap-2"
        aria-labelledby="newsletter-label"
        aria-describedby="newsletter-status"
      >
        <label htmlFor="newsletter-email" className="sr-only">
          Email address
        </label>
        <input
          id="newsletter-email"
          type="email"
          inputMode="email"
          autoComplete="email"
          value={email}
          onChange={(e) => {
            setEmail(e.target.value);
            if (status === "error") setStatus("idle");
          }}
          placeholder="Email"
          disabled={isPending}
          className={`
            bg-gray-800 text-white text-sm px-3 py-2 rounded flex-1 
            outline-none transition-all duration-200
            placeholder:text-gray-500
            focus:ring-2 focus:ring-[#FCD116] focus:ring-offset-1 focus:ring-offset-gray-900
            disabled:opacity-50 disabled:cursor-not-allowed
            ${status === "error" ? "ring-2 ring-red-500" : "border-none"}
          `}
          required
          aria-invalid={status === "error"}
        />
        <button
          type="submit"
          disabled={isPending || !email}
          className="
            bg-gray-700 hover:bg-gray-600 
            focus:ring-2 focus:ring-[#FCD116] focus:ring-offset-1 focus:ring-offset-gray-900
            text-white px-4 py-2 rounded transition-colors text-sm font-medium
            disabled:opacity-50 disabled:cursor-not-allowed
            min-w-[48px]
          "
          aria-label={isPending ? "Subscribing..." : "Subscribe to newsletter"}
        >
          {isPending ? (
            <svg 
              className="animate-spin h-4 w-4 mx-auto" 
              fill="none" 
              viewBox="0 0 24 24"
              aria-hidden="true"
            >
              <circle 
                className="opacity-25" 
                cx="12" 
                cy="12" 
                r="10" 
                stroke="currentColor" 
                strokeWidth="4"
              />
              <path 
                className="opacity-75" 
                fill="currentColor" 
                d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
              />
            </svg>
          ) : (
            "OK"
          )}
        </button>
      </form>
      
      {/* Status Messages */}
      <div 
        id="newsletter-status"
        role="status"
        aria-live="polite"
        className="mt-2 text-xs min-h-[1rem]"
      >
        {status === "success" && (
          <span className="text-green-400">
            ✓ Successfully subscribed!
          </span>
        )}
        {status === "error" && (
          <span className="text-red-400">
            Please enter a valid email address.
          </span>
        )}
      </div>
    </div>
  );
}