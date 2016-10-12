within AdvancedNoise.Applications.Examples.CompareInterpolators;
package FixedGridRoadClassD_891Pt "Demo only: fixed grid step response, No. of points = 891"

  extends AdvancedNoise.Interpolators.FixedGridStepResponse(
    T = {-89.1, -88.9, -88.7, -88.5, -88.3, -88.1, -87.9, -87.7, -87.5, -87.3, -87.1, -86.9, -86.7, -86.5, -86.3, -86.1, -85.9, -85.7, -85.5, -85.3, -85.1, -84.9, -84.7, -84.5, -84.3, -84.1, -83.9, -83.7, -83.5, -83.3, -83.1, -82.9, -82.7, -82.5, -82.3, -82.1, -81.9, -81.7, -81.5, -81.3, -81.1, -80.9, -80.7, -80.5, -80.3, -80.1, -79.9, -79.7, -79.5, -79.3, -79.1, -78.9, -78.7, -78.5, -78.3, -78.1, -77.9, -77.7, -77.5, -77.3, -77.1, -76.9, -76.7, -76.5, -76.3, -76.1, -75.9, -75.7, -75.5, -75.3, -75.1, -74.9, -74.7, -74.5, -74.3, -74.1, -73.9, -73.7, -73.5, -73.3, -73.1, -72.9, -72.7, -72.5, -72.3, -72.1, -71.9, -71.7, -71.5, -71.3, -71.1, -70.9, -70.7, -70.5, -70.3, -70.1, -69.9, -69.7, -69.5, -69.3, -69.1, -68.9, -68.7, -68.5, -68.3, -68.1, -67.9, -67.7, -67.5, -67.3, -67.1, -66.9, -66.7, -66.5, -66.3, -66.1, -65.9, -65.7, -65.5, -65.3, -65.1, -64.9, -64.7, -64.5, -64.3, -64.1, -63.9, -63.7, -63.5, -63.3, -63.1, -62.9, -62.7, -62.5, -62.3, -62.1, -61.9, -61.7, -61.5, -61.3, -61.1, -60.9, -60.7, -60.5, -60.3, -60.1, -59.9, -59.7, -59.5, -59.3, -59.1, -58.9, -58.7, -58.5, -58.3, -58.1, -57.9, -57.7, -57.5, -57.3, -57.1, -56.9, -56.7, -56.5, -56.3, -56.1, -55.9, -55.7, -55.5, -55.3, -55.1, -54.9, -54.7, -54.5, -54.3, -54.1, -53.9, -53.7, -53.5, -53.3, -53.1, -52.9, -52.7, -52.5, -52.3, -52.1, -51.9, -51.7, -51.5, -51.3, -51.1, -50.9, -50.7, -50.5, -50.3, -50.1, -49.9, -49.7, -49.5, -49.3, -49.1, -48.9, -48.7, -48.5, -48.3, -48.1, -47.9, -47.7, -47.5, -47.3, -47.1, -46.9, -46.7, -46.5, -46.3, -46.1, -45.9, -45.7, -45.5, -45.3, -45.1, -44.9, -44.7, -44.5, -44.3, -44.1, -43.9, -43.7, -43.5, -43.3, -43.1, -42.9, -42.7, -42.5, -42.3, -42.1, -41.9, -41.7, -41.5, -41.3, -41.1, -40.9, -40.7, -40.5, -40.3, -40.1, -39.9, -39.7, -39.5, -39.3, -39.1, -38.9, -38.7, -38.5, -38.3, -38.1, -37.9, -37.7, -37.5, -37.3, -37.1, -36.9, -36.7, -36.5, -36.3, -36.1, -35.9, -35.7, -35.5, -35.3, -35.1, -34.9, -34.7, -34.5, -34.3, -34.1, -33.9, -33.7, -33.5, -33.3, -33.1, -32.9, -32.7, -32.5, -32.3, -32.1, -31.9, -31.7, -31.5, -31.3, -31.1, -30.9, -30.7, -30.5, -30.3, -30.1, -29.9, -29.7, -29.5, -29.3, -29.1, -28.9, -28.7, -28.5, -28.3, -28.1, -27.9, -27.7, -27.5, -27.3, -27.1, -26.9, -26.7, -26.5, -26.3, -26.1, -25.9, -25.7, -25.5, -25.3, -25.1, -24.9, -24.7, -24.5, -24.3, -24.1, -23.9, -23.7, -23.5, -23.3, -23.1, -22.9, -22.7, -22.5, -22.3, -22.1, -21.9, -21.7, -21.5, -21.3, -21.1, -20.9, -20.7, -20.5, -20.3, -20.1, -19.9, -19.7, -19.5, -19.3, -19.1, -18.9, -18.7, -18.5, -18.3, -18.1, -17.9, -17.7, -17.5, -17.3, -17.1, -16.9, -16.7, -16.5, -16.3, -16.1, -15.9, -15.7, -15.5, -15.3, -15.1, -14.9, -14.7, -14.5, -14.3, -14.1, -13.9, -13.7, -13.5, -13.3, -13.1, -12.9, -12.7, -12.5, -12.3, -12.1, -11.9, -11.7, -11.5, -11.3, -11.1, -10.9, -10.7, -10.5, -10.3, -10.1, -9.9, -9.7, -9.5, -9.3, -9.1, -8.9, -8.7, -8.5, -8.3, -8.1, -7.9, -7.7, -7.5, -7.3, -7.1, -6.9, -6.7, -6.5, -6.3, -6.1, -5.9, -5.7, -5.5, -5.3, -5.1, -4.9, -4.7, -4.5, -4.3, -4.1, -3.9, -3.7, -3.5, -3.3, -3.1, -2.9, -2.7, -2.5, -2.3, -2.1, -1.9, -1.7, -1.5, -1.3, -1.1, -0.9, -0.7, -0.5, -0.3, -0.1, 0.1, 0.3, 0.5, 0.7, 0.9, 1.1, 1.3, 1.5, 1.7, 1.9, 2.1, 2.3, 2.5, 2.7, 2.9, 3.1, 3.3, 3.5, 3.7, 3.9, 4.1, 4.3, 4.5, 4.7, 4.9, 5.1, 5.3, 5.5, 5.7, 5.9, 6.1, 6.3, 6.5, 6.7, 6.9, 7.1, 7.3, 7.5, 7.7, 7.9, 8.1, 8.3, 8.5, 8.7, 8.9, 9.1, 9.3, 9.5, 9.7, 9.9, 10.1, 10.3, 10.5, 10.7, 10.9, 11.1, 11.3, 11.5, 11.7, 11.9, 12.1, 12.3, 12.5, 12.7, 12.9, 13.1, 13.3, 13.5, 13.7, 13.9, 14.1, 14.3, 14.5, 14.7, 14.9, 15.1, 15.3, 15.5, 15.7, 15.9, 16.1, 16.3, 16.5, 16.7, 16.9, 17.1, 17.3, 17.5, 17.7, 17.9, 18.1, 18.3, 18.5, 18.7, 18.9, 19.1, 19.3, 19.5, 19.7, 19.9, 20.1, 20.3, 20.5, 20.7, 20.9, 21.1, 21.3, 21.5, 21.7, 21.9, 22.1, 22.3, 22.5, 22.7, 22.9, 23.1, 23.3, 23.5, 23.7, 23.9, 24.1, 24.3, 24.5, 24.7, 24.9, 25.1, 25.3, 25.5, 25.7, 25.9, 26.1, 26.3, 26.5, 26.7, 26.9, 27.1, 27.3, 27.5, 27.7, 27.9, 28.1, 28.3, 28.5, 28.7, 28.9, 29.1, 29.3, 29.5, 29.7, 29.9, 30.1, 30.3, 30.5, 30.7, 30.9, 31.1, 31.3, 31.5, 31.7, 31.9, 32.1, 32.3, 32.5, 32.7, 32.9, 33.1, 33.3, 33.5, 33.7, 33.9, 34.1, 34.3, 34.5, 34.7, 34.9, 35.1, 35.3, 35.5, 35.7, 35.9, 36.1, 36.3, 36.5, 36.7, 36.9, 37.1, 37.3, 37.5, 37.7, 37.9, 38.1, 38.3, 38.5, 38.7, 38.9, 39.1, 39.3, 39.5, 39.7, 39.9, 40.1, 40.3, 40.5, 40.7, 40.9, 41.1, 41.3, 41.5, 41.7, 41.9, 42.1, 42.3, 42.5, 42.7, 42.9, 43.1, 43.3, 43.5, 43.7, 43.9, 44.1, 44.3, 44.5, 44.7, 44.9, 45.1, 45.3, 45.5, 45.7, 45.9, 46.1, 46.3, 46.5, 46.7, 46.9, 47.1, 47.3, 47.5, 47.7, 47.9, 48.1, 48.3, 48.5, 48.7, 48.9, 49.1, 49.3, 49.5, 49.7, 49.9, 50.1, 50.3, 50.5, 50.7, 50.9, 51.1, 51.3, 51.5, 51.7, 51.9, 52.1, 52.3, 52.5, 52.7, 52.9, 53.1, 53.3, 53.5, 53.7, 53.9, 54.1, 54.3, 54.5, 54.7, 54.9, 55.1, 55.3, 55.5, 55.7, 55.9, 56.1, 56.3, 56.5, 56.7, 56.9, 57.1, 57.3, 57.5, 57.7, 57.9, 58.1, 58.3, 58.5, 58.7, 58.9, 59.1, 59.3, 59.5, 59.7, 59.9, 60.1, 60.3, 60.5, 60.7, 60.9, 61.1, 61.3, 61.5, 61.7, 61.9, 62.1, 62.3, 62.5, 62.7, 62.9, 63.1, 63.3, 63.5, 63.7, 63.9, 64.1, 64.3, 64.5, 64.7, 64.9, 65.1, 65.3, 65.5, 65.7, 65.9, 66.1, 66.3, 66.5, 66.7, 66.9, 67.1, 67.3, 67.5, 67.7, 67.9, 68.1, 68.3, 68.5, 68.7, 68.9, 69.1, 69.3, 69.5, 69.7, 69.9, 70.1, 70.3, 70.5, 70.7, 70.9, 71.1, 71.3, 71.5, 71.7, 71.9, 72.1, 72.3, 72.5, 72.7, 72.9, 73.1, 73.3, 73.5, 73.7, 73.9, 74.1, 74.3, 74.5, 74.7, 74.9, 75.1, 75.3, 75.5, 75.7, 75.9, 76.1, 76.3, 76.5, 76.7, 76.9, 77.1, 77.3, 77.5, 77.7, 77.9, 78.1, 78.3, 78.5, 78.7, 78.9, 79.1, 79.3, 79.5, 79.7, 79.9, 80.1, 80.3, 80.5, 80.7, 80.9, 81.1, 81.3, 81.5, 81.7, 81.9, 82.1, 82.3, 82.5, 82.7, 82.9, 83.1, 83.3, 83.5, 83.7, 83.9, 84.1, 84.3, 84.5, 84.7, 84.9, 85.1, 85.3, 85.5, 85.7, 85.9, 86.1, 86.3, 86.5, 86.7, 86.9, 87.1, 87.3, 87.5, 87.7, 87.9, 88.1, 88.3, 88.5, 88.7, 88.9},
    step = {0.0, 4.5655763e-06, 9.3070673e-06, 1.4227942e-05, 1.9331653e-05, 2.4621637e-05, 3.0101314e-05, 3.5774072e-05, 4.1643274e-05, 4.7712258e-05, 5.3984359e-05, 6.0462918e-05, 6.7151286e-05, 7.405282e-05, 8.1170881e-05, 8.850882e-05, 9.6069971e-05, 0.00010385765, 0.00011187516, 0.00012012581, 0.00012861288, 0.00013733966, 0.00014630945, 0.00015552555, 0.00016499131, 0.00017471007, 0.0001846852, 0.00019492014, 0.00020541835, 0.00021618335, 0.0002272187, 0.00023852792, 0.00025011454, 0.00026198209, 0.00027413406, 0.00028657392, 0.00029930513, 0.00031233111, 0.00032565528, 0.00033928107, 0.00035321192, 0.00036745129, 0.00038200264, 0.00039686947, 0.00041205525, 0.00042756349, 0.00044339773, 0.00045956157, 0.00047605862, 0.00049289253, 0.000510067, 0.00052758577, 0.00054545263, 0.00056367143, 0.00058224607, 0.00060118048, 0.00062047865, 0.00064014459, 0.00066018238, 0.00068059607, 0.00070138977, 0.00072256765, 0.00074413395, 0.00076609294, 0.00078844897, 0.00081120639, 0.00083436956, 0.00085794289, 0.00088193077, 0.00090633765, 0.00093116802, 0.00095642638, 0.00098211725, 0.0010082452, 0.0010348147, 0.0010618304, 0.001089297, 0.0011172189, 0.0011456007, 0.0011744471, 0.0012037626, 0.0012335517, 0.0012638191, 0.0012945693, 0.0013258067, 0.0013575358, 0.0013897612, 0.0014224872, 0.0014557184, 0.0014894593, 0.0015237144, 0.0015584882, 0.0015937853, 0.0016296103, 0.0016659677, 0.001702862, 0.0017402979, 0.0017782799, 0.0018168126, 0.0018559008, 0.0018955492, 0.0019357625, 0.0019765456, 0.0020179036, 0.0020598415, 0.0021023644, 0.0021454776, 0.0021891863, 0.0022334956, 0.0022784108, 0.002323937, 0.0023700794, 0.0024168432, 0.0024642338, 0.0025122563, 0.0025609163, 0.002610219, 0.0026601699, 0.0027107746, 0.0027620387, 0.0028139679, 0.0028665678, 0.0029198445, 0.0029738038, 0.0030284518, 0.0030837946, 0.0031398385, 0.0031965898, 0.0032540547, 0.0033122397, 0.0033711511, 0.0034307955, 0.0034911796, 0.0035523099, 0.0036141934, 0.0036768366, 0.0037402465, 0.0038044301, 0.0038693943, 0.0039351461, 0.0040016929, 0.0040690416, 0.0041371996, 0.004206174, 0.004275972, 0.0043466008, 0.0044180675, 0.0044903794, 0.0045635436, 0.004637567, 0.0047124567, 0.0047882199, 0.0048648634, 0.0049423942, 0.0050208196, 0.0051001467, 0.0051803824, 0.005261534, 0.0053436087, 0.0054266134, 0.0055105555, 0.0055954422, 0.0056812809, 0.005768079, 0.0058558441, 0.0059445839, 0.0060343064, 0.0061250196, 0.0062167314, 0.0063094497, 0.0064031826, 0.0064979379, 0.0065937237, 0.0066905479, 0.0067884187, 0.0068873443, 0.006987333, 0.0070883933, 0.0071905337, 0.0072937628, 0.0073980896, 0.0075035232, 0.0076100727, 0.0077177475, 0.0078265572, 0.0079365114, 0.0080476197, 0.008159892, 0.0082733383, 0.0083879689, 0.008503794, 0.0086208241, 0.0087390696, 0.0088585412, 0.0089792498, 0.0091012063, 0.0092244217, 0.009348907, 0.0094746734, 0.0096017318, 0.0097300934, 0.0098597692, 0.00999077, 0.010123107, 0.01025679, 0.010391832, 0.010528241, 0.010666031, 0.01080521, 0.010945791, 0.011087785, 0.011231202, 0.011376053, 0.011522351, 0.011670106, 0.011819331, 0.011970037, 0.012122237, 0.012275943, 0.012431168, 0.012587923, 0.012746222, 0.012906076, 0.013067498, 0.013230501, 0.013395098, 0.013561302, 0.013729127, 0.013898586, 0.014069693, 0.014242464, 0.014416912, 0.014593052, 0.0147709, 0.01495047, 0.015131779, 0.015314842, 0.015499675, 0.015686295, 0.015874717, 0.01606496, 0.016257038, 0.01645097, 0.016646773, 0.016844462, 0.017044056, 0.01724557, 0.017449022, 0.017654428, 0.017861804, 0.018071168, 0.018282537, 0.018495927, 0.018711355, 0.018928838, 0.019148395, 0.019370042, 0.019593799, 0.019819683, 0.020047715, 0.020277912, 0.020510293, 0.020744878, 0.020981686, 0.021220736, 0.021462048, 0.021705642, 0.02195154, 0.022199763, 0.022450333, 0.022703271, 0.022958602, 0.023216347, 0.023476531, 0.023739178, 0.024004312, 0.024271958, 0.02454214, 0.024814886, 0.025090219, 0.025368167, 0.025648753, 0.025932003, 0.026217943, 0.026506598, 0.026797992, 0.027092151, 0.027389101, 0.027688866, 0.027991474, 0.028296951, 0.028605323, 0.028916621, 0.029230871, 0.029548102, 0.029868342, 0.03019162, 0.030517966, 0.030847409, 0.031179981, 0.031515712, 0.031854638, 0.032196789, 0.032542202, 0.032890911, 0.033242952, 0.033598362, 0.033957177, 0.034319436, 0.034685176, 0.035054436, 0.035427254, 0.035803666, 0.03618371, 0.036567424, 0.036954845, 0.037346012, 0.037740962, 0.038139735, 0.038542373, 0.038948917, 0.039359408, 0.03977389, 0.040192404, 0.040614995, 0.041041708, 0.041472588, 0.041907686, 0.042347051, 0.042790733, 0.043238786, 0.043691263, 0.044148219, 0.044609711, 0.045075795, 0.045546526, 0.046021961, 0.046502154, 0.046987161, 0.047477039, 0.047971843, 0.048471632, 0.048976467, 0.04948641, 0.050001522, 0.050521866, 0.051047508, 0.051578513, 0.052114953, 0.0526569, 0.05320443, 0.053757619, 0.054316549, 0.0548813, 0.055451957, 0.056028602, 0.056611316, 0.057200182, 0.057795282, 0.0583967, 0.05900452, 0.059618833, 0.06023973, 0.060867305, 0.061501651, 0.062142868, 0.06279106, 0.063446338, 0.064108815, 0.064778607, 0.065455838, 0.06614063, 0.066833102, 0.067533375, 0.068241572, 0.068957815, 0.069682233, 0.070414961, 0.071156136, 0.071905896, 0.072664393, 0.073431783, 0.074208234, 0.074993919, 0.075789017, 0.076593707, 0.077408167, 0.078232575, 0.079067113, 0.079911976, 0.080767362, 0.081633477, 0.08251054, 0.083398786, 0.084298467, 0.085209844, 0.086133178, 0.087068733, 0.088016773, 0.088977576, 0.089951432, 0.090938643, 0.09193954, 0.092954478, 0.093983834, 0.095027997, 0.096087355, 0.097162302, 0.098253256, 0.099360658, 0.10048499, 0.10162679, 0.10278661, 0.10396502, 0.10516261, 0.10638, 0.10761785, 0.1088769, 0.11015797, 0.11146191, 0.11278958, 0.11414191, 0.11551996, 0.1169249, 0.11835798, 0.11982048, 0.12131388, 0.12283986, 0.12440021, 0.12599689, 0.12763217, 0.12930865, 0.13102914, 0.13279692, 0.13461597, 0.13649075, 0.13842655, 0.14042985, 0.14250895, 0.14467406, 0.14693808, 0.14931929, 0.15184592, 0.15456079, 0.1575325, 0.1610387, 0.16541189, 0.16891809, 0.1718898, 0.17460468, 0.1771313, 0.17951251, 0.18177653, 0.18394164, 0.18602074, 0.18802404, 0.18995984, 0.19183462, 0.19365367, 0.19542145, 0.19714194, 0.19881843, 0.2004537, 0.20205038, 0.20361074, 0.20513671, 0.20663011, 0.20809261, 0.20952569, 0.21093063, 0.21230868, 0.21366101, 0.21498868, 0.21629262, 0.21757369, 0.21883274, 0.22007059, 0.22128798, 0.22248557, 0.22366399, 0.2248238, 0.2259656, 0.22708993, 0.22819733, 0.22928829, 0.23036324, 0.23142259, 0.23246676, 0.23349611, 0.23451105, 0.23551195, 0.23649916, 0.23747301, 0.23843382, 0.23938186, 0.24031741, 0.24124075, 0.24215212, 0.2430518, 0.24394005, 0.24481711, 0.24568323, 0.24653861, 0.24738348, 0.24821802, 0.24904242, 0.24985688, 0.25066157, 0.25145667, 0.25224236, 0.25301881, 0.2537862, 0.25454469, 0.25529445, 0.25603563, 0.25676836, 0.25749278, 0.25820902, 0.25891722, 0.25961749, 0.26030996, 0.26099475, 0.26167198, 0.26234178, 0.26300425, 0.26365953, 0.26430772, 0.26494894, 0.26558329, 0.26621086, 0.26683176, 0.26744607, 0.26805389, 0.26865531, 0.26925041, 0.26983927, 0.27042199, 0.27099863, 0.27156929, 0.27213404, 0.27269297, 0.27324616, 0.27379369, 0.27433564, 0.27487208, 0.27540308, 0.27592872, 0.27644907, 0.27696418, 0.27747412, 0.27797896, 0.27847875, 0.27897355, 0.27946343, 0.27994844, 0.28042863, 0.28090406, 0.2813748, 0.28184088, 0.28230237, 0.28275933, 0.2832118, 0.28365986, 0.28410354, 0.2845429, 0.284978, 0.28540888, 0.2858356, 0.28625819, 0.2866767, 0.28709118, 0.28750167, 0.28790822, 0.28831086, 0.28870963, 0.28910458, 0.28949575, 0.28988317, 0.29026688, 0.29064692, 0.29102334, 0.29139615, 0.29176541, 0.29213115, 0.29249341, 0.29285223, 0.29320764, 0.29355968, 0.29390839, 0.2942538, 0.29459595, 0.29493488, 0.29527061, 0.29560318, 0.29593262, 0.29625897, 0.29658225, 0.29690249, 0.29721972, 0.29753397, 0.29784527, 0.29815364, 0.29845912, 0.29876172, 0.29906149, 0.29935844, 0.2996526, 0.29994399, 0.30023265, 0.30051859, 0.30080184, 0.30108242, 0.30136037, 0.3016357, 0.30190845, 0.30217863, 0.30244628, 0.30271141, 0.30297406, 0.30323424, 0.30349199, 0.30374732, 0.30400026, 0.30425083, 0.30449905, 0.30474495, 0.30498854, 0.30522985, 0.3054689, 0.30570571, 0.3059403, 0.30617268, 0.30640288, 0.30663091, 0.30685679, 0.30708055, 0.3073022, 0.30752175, 0.30773924, 0.30795466, 0.30816805, 0.30837942, 0.30858879, 0.30879616, 0.30900157, 0.30920502, 0.30940653, 0.30960613, 0.30980382, 0.30999962, 0.31019355, 0.31038563, 0.31057587, 0.3107643, 0.31095092, 0.31113575, 0.31131881, 0.31150012, 0.31167969, 0.31185754, 0.31203368, 0.31220813, 0.3123809, 0.312552, 0.31272146, 0.31288929, 0.31305549, 0.31322009, 0.31338309, 0.31354451, 0.31370437, 0.31386267, 0.31401942, 0.31417465, 0.31432835, 0.31448055, 0.31463126, 0.31478048, 0.31492824, 0.31507454, 0.31521939, 0.31536281, 0.3155048, 0.31564538, 0.31578456, 0.31592235, 0.31605876, 0.3161938, 0.31632748, 0.31645982, 0.31659082, 0.3167205, 0.31684886, 0.31697592, 0.31710168, 0.31722617, 0.31734938, 0.31747134, 0.31759205, 0.31771152, 0.31782977, 0.3179468, 0.31806262, 0.31817725, 0.3182907, 0.31840297, 0.31851408, 0.31862403, 0.31873284, 0.31884052, 0.31894707, 0.3190525, 0.31915683, 0.31926006, 0.3193622, 0.31946326, 0.31956325, 0.31966217, 0.31976004, 0.31985687, 0.31995265, 0.32004741, 0.32014114, 0.32023386, 0.32032557, 0.32041628, 0.32050601, 0.32059475, 0.32068251, 0.32076931, 0.32085515, 0.32094003, 0.32102398, 0.32110698, 0.32118906, 0.32127021, 0.32135044, 0.32142977, 0.3215082, 0.32158573, 0.32166237, 0.32173813, 0.32181302, 0.32188705, 0.32196021, 0.32203252, 0.32210399, 0.32217462, 0.32224442, 0.32231339, 0.32238155, 0.3224489, 0.32251544, 0.3225812, 0.32264616, 0.32271034, 0.32277375, 0.3228364, 0.32289828, 0.32295941, 0.32301979, 0.32307944, 0.32313835, 0.32319654, 0.323254, 0.32331075, 0.3233668, 0.32342214, 0.32347679, 0.32353075, 0.32358402, 0.32363662, 0.32368855, 0.32373982, 0.32379042, 0.32384037, 0.32388967, 0.32393833, 0.32398636, 0.32403375, 0.32408051, 0.32412665, 0.32417218, 0.32421709, 0.3242614, 0.32430511, 0.32434823, 0.32439075, 0.32443269, 0.32447404, 0.32451483, 0.32455504, 0.32459469, 0.32463378, 0.32467231, 0.32471029, 0.32474773, 0.32478462, 0.32482098, 0.32485681, 0.3248921, 0.32492688, 0.32496113, 0.32499487, 0.3250281, 0.32506083, 0.32509305, 0.32512478, 0.32515602, 0.32518677, 0.32521704, 0.32524683, 0.32527614, 0.32530499, 0.32533337, 0.32536129, 0.32538876, 0.32541578, 0.32544235, 0.32546847, 0.32549416, 0.32551942, 0.32554425, 0.32556866, 0.32559265, 0.32561622, 0.32563938, 0.32566214, 0.3256845, 0.32570646, 0.32572802, 0.3257492, 0.32576999, 0.32579041, 0.32581045, 0.32583011, 0.32584941, 0.32586834, 0.32588692, 0.32590514, 0.325923, 0.32594052, 0.3259577, 0.32597453, 0.32599103, 0.32600719, 0.32602303, 0.32603854, 0.32605372, 0.32606859, 0.32608314, 0.32609738, 0.32611131, 0.32612494, 0.32613826, 0.32615129, 0.32616402, 0.32617646, 0.32618861, 0.32620048, 0.32621206, 0.32622337, 0.32623441, 0.32624517, 0.32625567, 0.32626591, 0.32627588, 0.3262856, 0.32629506, 0.32630428, 0.32631325, 0.32632198, 0.32633046, 0.32633872, 0.32634673, 0.32635452, 0.32636208, 0.32636942, 0.32637654, 0.32638344, 0.32639013, 0.32639661, 0.32640288, 0.32640895, 0.32641482, 0.32642049, 0.32642597, 0.32643126, 0.32643636, 0.32644128, 0.32644602},
    continuous = true);

  annotation (Icon(graphics={Text(
          extent={{-100,90},{100,60}},
          lineColor={0,0,0},
          textString="Bad pavement")}), Documentation(info="<html>
<p>Filter to smooth the data just as a first order filter, based on a <a href=\"modelica://AdvancedNoise.Interpolators.FixedGridStepResponse\">fixed grid step response interpolation</a>. The filter is parameterized according to ISO&nbsp;8608 for road class&nbsp;D (bad road), i.e. Phi_h&nbsp;=&nbsp;64&nbsp;cm^3 and w&nbsp;=&nbsp;2, thus leading</p>
<blockquote><pre>
              0.008
Phi_filt = ------------ .
            s + 0.0245
</pre></blockquote>
<p>
Number of table points is <b>891</b>.
</p>
</html>"));
end FixedGridRoadClassD_891Pt;