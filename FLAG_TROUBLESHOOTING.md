# Flag Images Troubleshooting Guide

## Issue
Flags of India and Burkina Faso are not visible in the TimeCard components.

## Current Status
✅ Files exist in correct location:
- `/public/flags/Flag_of_India.svg`
- `/public/flags/Flag_of_Burkina_Faso.svg`

✅ Code uses correct paths:
- `/flags/Flag_of_India.svg`
- `/flags/Flag_of_Burkina_Faso.svg`

✅ Using native `<img>` tags (not Next.js Image component)

## Possible Causes & Solutions

### 1. Dev Server Cache
**Problem**: Next.js dev server may be caching old files

**Solution**:
```bash
# Stop dev server (Ctrl+C)
# Delete .next folder
rm -rf .next
# Restart dev server
npm run dev
```

### 2. Browser Cache
**Problem**: Browser caching old version

**Solution**:
- Hard refresh: `Ctrl+Shift+R` (Windows) or `Cmd+Shift+R` (Mac)
- Or open in incognito mode: `Ctrl+Shift+N` / `Cmd+Shift+N`
- Or clear browser cache completely

### 3. Check Browser Console
**Open DevTools** (F12) and check for errors:
```javascript
// Look for errors like:
// GET http://localhost:3000/flags/Flag_of_India.svg 404 (Not Found)
// Failed to load resource
```

### 4. Verify Image URL
**Test directly in browser**:
- Open: `http://localhost:3000/flags/Flag_of_India.svg`
- Open: `http://localhost:3000/flags/Flag_of_Burkina_Faso.svg`

If these don't show the flag, there's a path issue.

### 5. Check CSS Visibility
**In DevTools, inspect the flag element** and verify:
- Container has width/height (64px × 44px)
- Image is not hidden by CSS
- No parent has `display: none` or `visibility: hidden`
- Opacity is not 0

### 6. SVG File Issues
**Problem**: SVG files might be corrupted

**Solution**: Download fresh copies:
```bash
# Backup current files
mv public/flags/Flag_of_India.svg public/flags/Flag_of_India.svg.bak
mv public/flags/Flag_of_Burkina_Faso.svg public/flags/Flag_of_Burkina_Faso.svg.bak

# Download new copies (or copy from backup)
# Then restart dev server
```

## Debug Steps

### Step 1: Check Console Logs
The code now includes error logging. Open browser console and look for:
```
Failed to load flag: /flags/Flag_of_India.svg
```

### Step 2: Check Network Tab
1. Open DevTools (F12)
2. Go to Network tab
3. Refresh page
4. Look for flag files
5. Check status code (should be 200, not 404)

### Step 3: Inspect Element
1. Right-click on the empty flag area
2. Select "Inspect"
3. Check if `<img>` tag exists
4. Check `src` attribute value
5. Check computed styles for visibility

### Step 4: Test with Absolute URL
Temporarily modify the code to use absolute URL:
```tsx
<img
  src="http://localhost:3000/flags/Flag_of_India.svg"
  alt="India Flag"
  // ... other props
/>
```

## Quick Fix Test

Create a test page at `src/app/[locale]/test-flags/page.tsx`:

```tsx
export default function TestFlags() {
  return (
    <div className="p-10">
      <h1>Flag Test Page</h1>
      
      <div className="flex gap-4">
        <div>
          <h2>India Flag</h2>
          <img 
            src="/flags/Flag_of_India.svg" 
            alt="India" 
            width="200" 
            height="133"
          />
        </div>
        
        <div>
          <h2>Burkina Faso Flag</h2>
          <img 
            src="/flags/Flag_of_Burkina_Faso.svg" 
            alt="Burkina Faso" 
            width="200" 
            height="133"
          />
        </div>
      </div>
      
      <h2>Direct URLs:</h2>
      <ul>
        <li><a href="/flags/Flag_of_India.svg" target="_blank">/flags/Flag_of_India.svg</a></li>
        <li><a href="/flags/Flag_of_Burkina_Faso.svg" target="_blank">/flags/Flag_of_Burkina_Faso.svg</a></li>
      </ul>
    </div>
  );
}
```

Then visit: `http://localhost:3000/[your-locale]/test-flags`

## Common Mistakes

### ❌ Wrong Path (includes /public)
```tsx
src="/public/flags/Flag_of_India.svg"  // WRONG!
```

### ✅ Correct Path (relative to public folder)
```tsx
src="/flags/Flag_of_India.svg"  // CORRECT!
```

## Files Modified

1. `src/app/[locale]/HomePageComponent/firstComponent.tsx`
   - Added error handler with fallback
   - Added inline styles for visibility
   - Added console logging for debugging

## Next Steps

1. **Stop dev server**
2. **Delete `.next` folder**
3. **Restart dev server**: `npm run dev`
4. **Hard refresh browser**: `Ctrl+Shift+R`
5. **Check browser console** for any errors
6. **Check network tab** for 404 errors
7. **Test direct URLs** in browser

## Contact Info

If flags still don't show after trying all steps:
1. Check browser console errors
2. Check network tab for 404s
3. Verify files exist in `public/flags/` folder
4. Try copying flag SVGs to root public folder as backup

---

**Last Updated**: March 15, 2026
**Status**: Debugging in progress
