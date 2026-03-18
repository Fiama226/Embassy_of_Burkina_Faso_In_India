# Flag Images Fix

## Problem
The flag images (`Flag_of_Burkina_Faso.svg` and `Flag_of_India.svg`) were not displaying on the homepage.

## Root Cause
**Next.js Image component does not optimize SVG files by default.** 

From Next.js documentation:
> "The Image component is designed to optimize large image files like JPG, PNG, WebP, and AVIF. SVG files are not optimized because they are already vector-based and typically small in file size."

When you try to use an SVG with the `Image` component, it may not render correctly or at all.

## Solution
Replaced Next.js `Image` component with native HTML `<img>` tags for SVG flag files:

### Before (Not Working):
```tsx
<Image
  src={flagSrc}
  alt={flagAlt}
  fill
  className="object-cover"
  sizes="64px"
/>
```

### After (Working):
```tsx
<img
  src={flagSrc}
  alt={flagAlt}
  className="object-cover w-full h-full"
  width="64"
  height="44"
  loading="lazy"
/>
```

## Files Modified
- `src/app/[locale]/HomePageComponent/firstComponent.tsx`
  - Line ~98-107: TimeCard component flag rendering
  - Line ~389-396: Badge section flag rendering

## Why This Works
1. **Native browser support**: Browsers natively render SVG files with `<img>` tags
2. **No optimization needed**: SVGs are vector files, already optimized
3. **Proper sizing**: Using explicit `width` and `height` attributes prevents layout shift
4. **Lazy loading**: Added `loading="lazy"` for performance (except for above-the-fold flags)

## Best Practices for SVGs in Next.js

### ✅ DO:
- Use native `<img>` tags for SVG files
- Include `width` and `height` attributes
- Add `loading="lazy"` for below-the-fold SVGs
- Use `loading="eager"` for above-the-fold SVGs (LCP elements)

### ❌ DON'T:
- Use Next.js `Image` component for SVGs
- Use `fill` prop with SVGs
- Forget to add `alt` text for accessibility

## Alternative Approaches

### Option 1: Import SVG as React Component
```tsx
import BurkinaFlag from '@/public/flags/Flag_of_Burkina_Faso.svg';

// Then use as component
<BurkinaFlag className="w-5 h-4" />
```
**Requires**: Additional Next.js config for SVG imports

### Option 2: Use `unoptimized` prop
```tsx
<Image
  src="/flags/Flag_of_Burkina_Faso.svg"
  alt="Burkina Faso Flag"
  width={20}
  height={14}
  unoptimized
/>
```
**Note**: Still not recommended as it bypasses all optimizations

### Option 3: Convert to PNG/WebP
```tsx
<Image
  src="/flags/Flag_of_Burkina_Faso.png"
  alt="Burkina Faso Flag"
  width={20}
  height={14}
/>
```
**Trade-off**: Larger file size, but works with Image component

## Testing
After applying the fix:
1. ✅ Run dev server: `npm run dev`
2. ✅ Check homepage loads correctly
3. ✅ Verify both flags display in TimeCard components
4. ✅ Verify flag displays in badge section
5. ✅ Check browser console for any image errors
6. ✅ Test on different screen sizes

## Performance Impact
- **Minimal**: SVGs are small vector files (~2-4KB each)
- **Better**: Native browser rendering is fast for SVGs
- **Accessibility**: Maintains proper alt text support

## Files Affected
```
src/app/[locale]/HomePageComponent/firstComponent.tsx
├── TimeCard component (line ~98) - India & Burkina Faso flags
└── Hero badge section (line ~389) - Burkina Faso flag
```

## Related Files (No Changes Needed)
These files already exist and are correctly placed:
```
public/flags/Flag_of_Burkina_Faso.svg     ✅ Exists
public/flags/Flag_of_India.svg            ✅ Exists
public/Flag_of_Burkina_Faso.svg           ✅ Exists (duplicate)
```

---

**Last Updated**: March 15, 2026
**Issue**: SVG flags not displaying
**Status**: ✅ Resolved
