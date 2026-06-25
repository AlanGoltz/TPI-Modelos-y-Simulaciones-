# Simulación del consumo de combustible de un vehículo en ruta

**Trabajo Práctico Integrador — Modelos y Simulaciones 2026**  
Universidad Adventista del Plata  
Integrantes: Mayco Chavez — Alan Benner

---

## Descripción del proyecto

Este proyecto simula el consumo de combustible de un automóvil en el recorrido **Crespo → Paraná (Entre Ríos, ~35 km)**, modelando las fuerzas físicas que actúan sobre el vehículo en movimiento.

**Pregunta de estudio:** ¿En qué medida afectan la velocidad de conducción y la carga del vehículo al consumo de nafta? ¿Es estadísticamente significativo el ahorro al reducir la velocidad de 90 a 70 km/h?

---

## Estructura del repositorio

```
/modelica        → Modelos en Modelica (.mo)
/analisis        → Script Python de análisis estadístico
/resultados      → Gráficos y datos de salida
/informe         → Informe final en PDF
README.md        → Este archivo
```

---

## Requisitos para ejecutar el modelo

### Modelica
- [OpenModelica](https://openmodelica.org/) versión 1.21 o superior (gratuito)

### Python (análisis estadístico)
```bash
pip install numpy scipy matplotlib
```

---

## Cómo ejecutar el modelo en OpenModelica

1. Abrir **OMEdit** (interfaz gráfica de OpenModelica)
2. Ir a `File → Open Model/Library File`
3. Abrir el archivo `/modelica/ConsumoCombustible.mo`
4. Luego abrir `/modelica/Experimentos.mo`
5. En el panel izquierdo, hacer doble clic sobre el modelo a simular (ej. `Exp2_VelocidadModerada`)
6. Ir a `Simulation → Simulate`
7. Los resultados se visualizan en la pestaña **Plot**

Variables de salida recomendadas para graficar:
- `consumo_inst` — consumo instantáneo en L/100km
- `consumo_acum` — combustible acumulado en litros
- `distancia_rec` — distancia recorrida en metros
- `v_kmh` — velocidad instantánea

---

## Cómo ejecutar el análisis estadístico

```bash
cd analisis
python analisis_estadistico.py
```

El script genera las estadísticas descriptivas y los resultados del test t de Student para comparar los 4 experimentos.

---

## Experimentos disponibles

| Modelo | Velocidad | Masa | Descripción |
|--------|-----------|------|-------------|
| `Exp1_VelocidadAlta` | 110 km/h | 1400 kg | Conducción rápida |
| `Exp2_VelocidadModerada` | 90 km/h | 1400 kg | **Escenario base** |
| `Exp3_VelocidadEconomica` | 70 km/h | 1400 kg | Conducción económica |
| `Exp4_CargaExtra` | 90 km/h | 1700 kg | Vehículo con carga extra |

---

## Resultados principales

| Experimento | Consumo medio | vs Base |
|-------------|---------------|---------|
| 110 km/h | 6.32 L/100km | +24.6% |
| 90 km/h (base) | 5.07 L/100km | — |
| 70 km/h | 3.80 L/100km | −24.9% |
| 90 km/h + carga | 5.48 L/100km | +8.4% |

Todas las diferencias son estadísticamente significativas (p < 0.001, test t de Student, n=30 corridas).

---

## Parámetros del modelo

| Parámetro | Valor | Descripción |
|-----------|-------|-------------|
| Cd | 0.30 | Coeficiente aerodinámico |
| A | 2.2 m² | Área frontal del vehículo |
| Cr | 0.013 | Coeficiente de rodadura |
| η_motor | 30% | Eficiencia térmica del motor |
| PCI nafta | 34.2 MJ/L | Poder calorífico inferior |
| ρ_aire | 1.20 kg/m³ | Densidad del aire |
