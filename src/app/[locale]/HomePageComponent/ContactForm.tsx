"use client";

import { useState, useRef, useCallback, useId } from "react";
import axios from "axios";
import { useTranslations } from "next-intl";

// ── Types ───────────────────────────────────────────────
type FormStatus = "idle" | "loading" | "success" | "error";

interface FormErrors {
  fullName?: string;
  email?: string;
  subject?: string;
  message?: string;
  general?: string;
}

// ── Inline Icons ────────────────────────────────────────
function Spinner() {
  return (
    <svg
      className="animate-spin -ml-1 h-5 w-5 text-white"
      fill="none"
      viewBox="0 0 24 24"
      aria-hidden="true"
    >
      <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
      <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z" />
    </svg>
  );
}

function SendIcon() {
  return (
    <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" aria-hidden="true">
      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 12L3.269 3.126A59.768 59.768 0 0121.485 12 59.77 59.77 0 013.27 20.876L5.999 12zm0 0h7.5" />
    </svg>
  );
}

function ErrorIcon() {
  return (
    <svg className="w-4 h-4 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20" aria-hidden="true">
      <path fillRule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clipRule="evenodd" />
    </svg>
  );
}

function SuccessIcon() {
  return (
    <svg className="w-5 h-5 text-green-600 flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20" aria-hidden="true">
      <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd" />
    </svg>
  );
}

// ── Reusable Form Field ─────────────────────────────────
interface FieldProps {
  label: string;
  name: string;
  type?: "text" | "email" | "textarea" | "select";
  placeholder?: string;
  required?: boolean;
  autoComplete?: string;
  inputMode?: "text" | "email";
  minLength?: number;
  maxLength?: number;
  rows?: number;
  error?: string;
  hint?: string;
  disabled?: boolean;
  options?: { value: string; label: string }[];
}

function Field({
  label,
  name,
  type = "text",
  placeholder,
  required = false,
  autoComplete,
  inputMode,
  minLength,
  maxLength,
  rows = 5,
  error,
  hint,
  disabled = false,
  options,
}: FieldProps) {
  const uid = useId();
  const inputId = `${uid}-${name}`;
  const errorId = `${inputId}-err`;
  const hintId = `${inputId}-hint`;
  const [charCount, setCharCount] = useState(0);

  const baseClasses = `
    w-full px-4 py-3.5
    text-stone-900 placeholder:text-stone-400
    bg-white border-2 rounded-xl
    transition-all duration-200
    disabled:opacity-50 disabled:cursor-not-allowed
    focus:outline-none focus:ring-4
    ${
      error
        ? "border-red-400 focus:border-red-500 focus:ring-red-500/20"
        : "border-stone-200 focus:border-stone-900 focus:ring-stone-900/10 hover:border-stone-300"
    }
  `;

  const describedBy = [error ? errorId : null, hint || (type === "textarea" && maxLength) ? hintId : null]
    .filter(Boolean)
    .join(" ");

  return (
    <div>
      <label htmlFor={inputId} className="block text-sm font-semibold text-stone-700 mb-1.5">
        {label}
        {required && (
          <>
            <span className="text-red-500 ml-0.5" aria-hidden="true">*</span>
            <span className="sr-only"> (required)</span>
          </>
        )}
      </label>

      {type === "textarea" ? (
        <textarea
          id={inputId}
          name={name}
          required={required}
          minLength={minLength}
          maxLength={maxLength}
          rows={rows}
          disabled={disabled}
          placeholder={placeholder}
          aria-invalid={!!error}
          aria-describedby={describedBy || undefined}
          onChange={(e) => setCharCount(e.target.value.length)}
          className={`${baseClasses} resize-y min-h-[140px]`}
        />
      ) : type === "select" ? (
        <select
          id={inputId}
          name={name}
          required={required}
          disabled={disabled}
          aria-invalid={!!error}
          aria-describedby={describedBy || undefined}
          defaultValue=""
          className={`${baseClasses} appearance-none bg-[url('data:image/svg+xml;charset=UTF-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2224%22%20height%3D%2224%22%20viewBox%3D%220%200%2024%2024%22%20fill%3D%22none%22%20stroke%3D%22%2378716c%22%20stroke-width%3D%222%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%3E%3Cpolyline%20points%3D%226%209%2012%2015%2018%209%22%3E%3C%2Fpolyline%3E%3C%2Fsvg%3E')] bg-no-repeat bg-[right_1rem_center] bg-[length:1.25rem]`}
        >
          <option value="" disabled>{placeholder}</option>
          {options?.map((opt) => (
            <option key={opt.value} value={opt.value}>{opt.label}</option>
          ))}
        </select>
      ) : (
        <input
          type={type}
          id={inputId}
          name={name}
          autoComplete={autoComplete}
          inputMode={inputMode}
          required={required}
          minLength={minLength}
          maxLength={maxLength}
          disabled={disabled}
          placeholder={placeholder}
          aria-invalid={!!error}
          aria-describedby={describedBy || undefined}
          className={baseClasses}
        />
      )}

      {/* Error */}
      {error && (
        <p id={errorId} role="alert" className="mt-1.5 text-sm text-red-600 flex items-center gap-1.5">
          <ErrorIcon />
          {error}
        </p>
      )}

      {/* Hint + Character counter */}
      {!error && (hint || (type === "textarea" && maxLength)) && (
        <div id={hintId} className="mt-1.5 flex items-center justify-between text-xs text-stone-400">
          <span>{hint}</span>
          {type === "textarea" && maxLength && (
            <span className="tabular-nums">{charCount} / {maxLength}</span>
          )}
        </div>
      )}
    </div>
  );
}

// ── Main Form Component ─────────────────────────────────
export function ContactForm() {
  const t = useTranslations("Homepage.ContactSection.form");
  const [status, setStatus] = useState<FormStatus>("idle");
  const [errors, setErrors] = useState<FormErrors>({});
  const formRef = useRef<HTMLFormElement>(null);

  const subjectOptions = [
    { value: "visa", label: t("subjects.visa") },
    { value: "passport", label: t("subjects.passport") },
    { value: "consular", label: t("subjects.consular") },
    { value: "trade", label: t("subjects.trade") },
    { value: "appointment", label: t("subjects.appointment") },
    { value: "other", label: t("subjects.other") },
  ];

  // ── Validation ────────────────────────────────────────
  const validate = useCallback(
    (data: FormData): FormErrors => {
      const errs: FormErrors = {};
      const fullName = (data.get("fullName") as string)?.trim();
      const email = (data.get("email") as string)?.trim();
      const subject = (data.get("subject") as string)?.trim();
      const message = (data.get("message") as string)?.trim();

      if (!fullName || fullName.length < 2) errs.fullName = t("errors.name_required");
      if (!email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) errs.email = t("errors.email_invalid");
      if (!subject) errs.subject = t("errors.subject_required");
      if (!message || message.length < 10) errs.message = t("errors.message_min");

      return errs;
    },
    [t]
  );

  // ── Submit ────────────────────────────────────────────
  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    const formData = new FormData(e.currentTarget);

    // Honeypot
    if (formData.get("website")) return;

    // Validate
    const validationErrors = validate(formData);
    if (Object.keys(validationErrors).length > 0) {
      setErrors(validationErrors);
      setStatus("error");
      // Focus first errored field
      const firstField = Object.keys(validationErrors)[0];
      formRef.current?.querySelector<HTMLElement>(`[name="${firstField}"]`)?.focus();
      return;
    }

    setErrors({});
    setStatus("loading");

    try {
      await axios.post("/api/sendEmail", {
        name: formData.get("fullName"),
        email: formData.get("email"),
        subject: formData.get("subject"),
        message: formData.get("message"),
      });

      setStatus("success");
      formRef.current?.reset();
      setTimeout(() => setStatus("idle"), 8000);
    } catch {
      setStatus("error");
      setErrors({ general: t("errors.submission_failed") });
    }
  };

  const isDisabled = status === "loading";

  return (
    <form ref={formRef} onSubmit={handleSubmit} className="space-y-5" noValidate>
      {/* Honeypot */}
      <div className="absolute -left-[9999px]" aria-hidden="true">
        <label>
          Website
          <input type="text" name="website" tabIndex={-1} autoComplete="off" />
        </label>
      </div>

      {/* Name + Email */}
      <div className="grid sm:grid-cols-2 gap-5">
        <Field
          label={t("labels.full_name")}
          name="fullName"
          placeholder={t("placeholders.full_name")}
          required
          autoComplete="name"
          minLength={2}
          maxLength={100}
          error={errors.fullName}
          disabled={isDisabled}
        />
        <Field
          label={t("labels.email")}
          name="email"
          type="email"
          placeholder={t("placeholders.email")}
          required
          autoComplete="email"
          inputMode="email"
          error={errors.email}
          disabled={isDisabled}
        />
      </div>

      {/* Subject */}
      <Field
        label={t("labels.subject")}
        name="subject"
        type="select"
        placeholder={t("placeholders.subject")}
        required
        options={subjectOptions}
        error={errors.subject}
        disabled={isDisabled}
      />

      {/* Message */}
      <Field
        label={t("labels.message")}
        name="message"
        type="textarea"
        placeholder={t("placeholders.message")}
        required
        minLength={10}
        maxLength={1000}
        rows={5}
        error={errors.message}
        hint={t("hints.message_min")}
        disabled={isDisabled}
      />

      {/* Submit */}
      <div className="pt-2">
        <button
          type="submit"
          disabled={isDisabled}
          className="
            relative w-full sm:w-auto
            inline-flex items-center justify-center gap-2
            px-8 py-4 text-base font-semibold
            text-white bg-stone-900 rounded-xl
            transition-all duration-200
            hover:bg-stone-800 active:scale-[0.98]
            disabled:opacity-50 disabled:cursor-not-allowed
            disabled:hover:bg-stone-900 disabled:active:scale-100
            focus-visible:outline-none focus-visible:ring-2
            focus-visible:ring-stone-900 focus-visible:ring-offset-2
          "
        >
          {isDisabled ? (
            <>
              <Spinner />
              {t("button.sending")}
            </>
          ) : (
            <>
              {t("button.send")}
              <SendIcon />
            </>
          )}
        </button>
      </div>

      {/* Success */}
      {status === "success" && (
        <div
          role="status"
          aria-live="polite"
          className="p-5 rounded-xl bg-green-50 border border-green-200 flex items-start gap-3"
        >
          <SuccessIcon />
          <div>
            <h3 className="font-semibold text-green-800">{t("alerts.success_title")}</h3>
            <p className="text-sm text-green-700 mt-0.5">{t("alerts.success_message")}</p>
          </div>
        </div>
      )}

      {/* General Error */}
      {status === "error" && errors.general && (
        <div
          role="alert"
          className="p-5 rounded-xl bg-red-50 border border-red-200 flex items-start gap-3"
        >
          <ErrorIcon />
          <div>
            <h3 className="font-semibold text-red-800">{t("alerts.error_title")}</h3>
            <p className="text-sm text-red-700 mt-0.5">{errors.general}</p>
          </div>
        </div>
      )}
    </form>
  );
}