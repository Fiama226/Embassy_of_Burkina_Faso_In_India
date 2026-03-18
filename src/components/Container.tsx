import { ReactNode } from 'react';

interface ContainerProps {
  children: ReactNode;
  className?: string;
  as?: keyof JSX.IntrinsicElements;
}

/**
 * Container Component
 * 
 * Provides consistent horizontal padding and max-width constraints
 * across the application. Uses the same breakpoints as Tailwind's
 * default container.
 * 
 * @param children - Content to wrap
 * @param className - Additional CSS classes
 * @param as - HTML element to render as (default: 'div')
 * 
 * @example
 * // Basic usage
 * <Container>
 *   <h1>Hello World</h1>
 * </Container>
 * 
 * @example
 * // Custom element and classes
 * <Container as="section" className="py-12">
 *   <Content />
 * </Container>
 */
export function Container({ 
  children, 
  className = '', 
  as: Component = 'div' 
}: ContainerProps) {
  return (
    <Component 
      className={`max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 ${className}`}
    >
      {children}
    </Component>
  );
}

/**
 * FluidContainer Component
 * 
 * A variant that uses percentage-based max-widths for smoother
 * responsive behavior across all screen sizes.
 */
export function FluidContainer({ 
  children, 
  className = '',
  as: Component = 'div'
}: ContainerProps) {
  return (
    <Component 
      className={`w-full max-w-[1920px] mx-auto px-4 sm:px-6 lg:px-8 xl:px-12 ${className}`}
    >
      {children}
    </Component>
  );
}

/**
 * NarrowContainer Component
 * 
 * A narrower variant for content like articles, forms, and modals.
 * Max width of 3xl (78rem / 1248px).
 */
export function NarrowContainer({ 
  children, 
  className = '',
  as: Component = 'div'
}: ContainerProps) {
  return (
    <Component 
      className={`max-w-3xl mx-auto px-4 sm:px-6 lg:px-8 ${className}`}
    >
      {children}
    </Component>
  );
}
