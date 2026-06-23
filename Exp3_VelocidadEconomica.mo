model Exp3_VelocidadEconomica
  "Escenario 3: conduccion a 70 km/h"
  extends ConsumoCombustible(
    v_base_kmh = 70,
    masa       = 1400
  );
  annotation(
    experiment(StopTime = 1800, Interval = 1),
    Documentation(info="70 km/h: velocidad economica para menor consumo.")
  );
end Exp3_VelocidadEconomica;
