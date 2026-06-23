model Exp2_VelocidadModerada
  "Escenario 2 (BASE): conduccion a 90 km/h"
  extends ConsumoCombustible(
    v_base_kmh = 90,
    masa       = 1400
  );
  annotation(
    experiment(StopTime = 1400, Interval = 1),
    Documentation(info="90 km/h: escenario base de comparacion.")
  );
end Exp2_VelocidadModerada;
