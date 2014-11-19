within Noise;
model dodo
  model dodo1
    dodo3 d3;
  end dodo1;

  model dodo2
    outer dodo1 d1;
    parameter Integer a = d1.d3.a;
  end dodo2;

  model dodo3
    parameter Integer a = 5;
    replaceable function seed = Modelica.Math.atan2 constrainedby
      Modelica.Math.atan2;
  end dodo3;

  model dodo3b
    extends dodo3(redeclare function seed = Modelica.Math.atan2);

  end dodo3b;

  dodo2 d2;
  inner dodo1 d1(redeclare dodo3b d3);

  parameter Integer a = d1.d3.a;
  Real b[a] = fill(0.12,a);

  Real r = d1.d3.seed(3.2,1.2);
end dodo;
