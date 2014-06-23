within Noise.Examples.Parts.Modelica_LinearSystems2.Controller.Types;
type Window = enumeration(
    Rectangle "Rectangle",
    Bartlett "Bartlett",
    Hann "Hann",
    Hamming "Hamming",
    Blackman "Blackman",
    Kaiser "Kaiser") "Enumeration of window type for FIR filter"
    annotation (Evaluate=true, Documentation(info="<html>
</html>"));
