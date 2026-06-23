model Exp1_VelocidadAlta
  "Escenario 1: conduccion a 110 km/h"
  extends ConsumoCombustible(
    v_base_kmh = 110,
    masa       = 1400
  );
  annotation(
    experiment(StopTime = 1145, Interval = 1),
    Documentation(info="110 km/h: evalua consumo a velocidad alta.")
  );
end Exp1_VelocidadAlta;
