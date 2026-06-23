model Exp4_CargaExtra
  "Escenario 4: vehiculo con 300 kg de carga extra a 90 km/h"
  extends ConsumoCombustible(
    v_base_kmh = 90,
    masa       = 1700
  );
  annotation(
    experiment(StopTime = 1400, Interval = 1),
    Documentation(info="90 km/h + 300 kg extra: evalua impacto de la carga.")
  );
end Exp4_CargaExtra;
