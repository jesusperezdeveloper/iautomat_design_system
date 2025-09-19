=== INVENTARIO PRE-MIGRACIÓN ===

## Resumen inicial
- **Total archivos con símbolos App***: 393
- **Total ocurrencias de símbolos App***: 25,614
- **Total archivos app_*.dart**: 315
- **Carpetas con prefijo app**: 1 (lib/src/components/app_bars)

## Plan de migración
Migración completa del prefijo App* → DS* sin compatibilidad temporal.

### Fases:
1. Renombrado de símbolos (código)
2. Renombrado de archivos y carpetas
3. Migración de Tokens y ThemeExtension
4. Ajuste de tests, stories y goldens
5. Regeneración de barrels y exports
6. Rebuild y quality gates
7. Actualización de metadata y documentación
8. Reporte final y validación

---

## Progreso de migración

### Fase 0 - Preparación ✓
- Rama creada: refactor/ds-prefix-migration
- Inventario inicial completado