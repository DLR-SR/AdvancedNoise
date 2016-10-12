within AdvancedNoise.Applications.Roads;
package ConreteAsphaltGood "Road: good asphalt concrete (zero phase)"

  extends AdvancedNoise.Interpolators.TabulatedStepResponse(
    T = { -6.1400000e+01, -6.1300000e+01, -6.1200000e+01, -6.1100000e+01, -6.1000000e+01, -6.0900000e+01, -6.0800000e+01, -6.0700000e+01, -6.0600000e+01, -6.0500000e+01, -6.0400000e+01, -6.0300000e+01, -6.0200000e+01, -6.0100000e+01, -6.0000000e+01, -5.9900000e+01, -5.9800000e+01, -5.9700000e+01, -5.9600000e+01, -5.9500000e+01, -5.9400000e+01, -5.9300000e+01, -5.9200000e+01, -5.9100000e+01, -5.9000000e+01, -5.8900000e+01, -5.8800000e+01, -5.8700000e+01, -5.8600000e+01, -5.8500000e+01, -5.8400000e+01, -5.8300000e+01, -5.8200000e+01, -5.8100000e+01, -5.8000000e+01, -5.7900000e+01, -5.7800000e+01, -5.7700000e+01, -5.7600000e+01, -5.7500000e+01, -5.7400000e+01, -5.7300000e+01, -5.7200000e+01, -5.7100000e+01, -5.7000000e+01, -5.6900000e+01, -5.6800000e+01, -5.6700000e+01, -5.6600000e+01, -5.6500000e+01, -5.6400000e+01, -5.6300000e+01, -5.6200000e+01, -5.6100000e+01, -5.6000000e+01, -5.5900000e+01, -5.5800000e+01, -5.5700000e+01, -5.5600000e+01, -5.5500000e+01, -5.5400000e+01, -5.5300000e+01, -5.5200000e+01, -5.5100000e+01, -5.5000000e+01, -5.4900000e+01, -5.4800000e+01, -5.4700000e+01, -5.4600000e+01, -5.4500000e+01, -5.4400000e+01, -5.4300000e+01, -5.4200000e+01, -5.4100000e+01, -5.4000000e+01, -5.3900000e+01, -5.3800000e+01, -5.3700000e+01, -5.3600000e+01, -5.3500000e+01, -5.3400000e+01, -5.3300000e+01, -5.3200000e+01, -5.3100000e+01, -5.3000000e+01, -5.2900000e+01, -5.2800000e+01, -5.2700000e+01, -5.2600000e+01, -5.2500000e+01, -5.2400000e+01, -5.2300000e+01, -5.2200000e+01, -5.2100000e+01, -5.2000000e+01, -5.1900000e+01, -5.1800000e+01, -5.1700000e+01, -5.1600000e+01, -5.1500000e+01, -5.1400000e+01, -5.1300000e+01, -5.1200000e+01, -5.1100000e+01, -5.1000000e+01, -5.0900000e+01, -5.0800000e+01, -5.0700000e+01, -5.0600000e+01, -5.0500000e+01, -5.0400000e+01, -5.0300000e+01, -5.0200000e+01, -5.0100000e+01, -5.0000000e+01, -4.9900000e+01, -4.9800000e+01, -4.9700000e+01, -4.9600000e+01, -4.9500000e+01, -4.9400000e+01, -4.9300000e+01, -4.9200000e+01, -4.9100000e+01, -4.9000000e+01, -4.8900000e+01, -4.8800000e+01, -4.8700000e+01, -4.8600000e+01, -4.8500000e+01, -4.8400000e+01, -4.8300000e+01, -4.8200000e+01, -4.8100000e+01, -4.8000000e+01, -4.7900000e+01, -4.7800000e+01, -4.7700000e+01, -4.7600000e+01, -4.7500000e+01, -4.7400000e+01, -4.7300000e+01, -4.7200000e+01, -4.7100000e+01, -4.7000000e+01, -4.6900000e+01, -4.6800000e+01, -4.6700000e+01, -4.6600000e+01, -4.6500000e+01, -4.6400000e+01, -4.6300000e+01, -4.6200000e+01, -4.6100000e+01, -4.6000000e+01, -4.5900000e+01, -4.5800000e+01, -4.5700000e+01, -4.5600000e+01, -4.5500000e+01, -4.5400000e+01, -4.5300000e+01, -4.5200000e+01, -4.5100000e+01, -4.5000000e+01, -4.4900000e+01, -4.4800000e+01, -4.4700000e+01, -4.4600000e+01, -4.4500000e+01, -4.4400000e+01, -4.4300000e+01, -4.4200000e+01, -4.4100000e+01, -4.4000000e+01, -4.3900000e+01, -4.3800000e+01, -4.3700000e+01, -4.3600000e+01, -4.3500000e+01, -4.3400000e+01, -4.3300000e+01, -4.3200000e+01, -4.3100000e+01, -4.3000000e+01, -4.2900000e+01, -4.2800000e+01, -4.2700000e+01, -4.2600000e+01, -4.2500000e+01, -4.2400000e+01, -4.2300000e+01, -4.2200000e+01, -4.2100000e+01, -4.2000000e+01, -4.1900000e+01, -4.1800000e+01, -4.1700000e+01, -4.1600000e+01, -4.1500000e+01, -4.1400000e+01, -4.1300000e+01, -4.1200000e+01, -4.1100000e+01, -4.1000000e+01, -4.0900000e+01, -4.0800000e+01, -4.0700000e+01, -4.0600000e+01, -4.0500000e+01, -4.0400000e+01, -4.0300000e+01, -4.0200000e+01, -4.0100000e+01, -4.0000000e+01, -3.9900000e+01, -3.9800000e+01, -3.9700000e+01, -3.9600000e+01, -3.9500000e+01, -3.9400000e+01, -3.9300000e+01, -3.9200000e+01, -3.9100000e+01, -3.9000000e+01, -3.8900000e+01, -3.8800000e+01, -3.8700000e+01, -3.8600000e+01, -3.8500000e+01, -3.8400000e+01, -3.8300000e+01, -3.8200000e+01, -3.8100000e+01, -3.8000000e+01, -3.7900000e+01, -3.7800000e+01, -3.7700000e+01, -3.7600000e+01, -3.7500000e+01, -3.7400000e+01, -3.7300000e+01, -3.7200000e+01, -3.7100000e+01, -3.7000000e+01, -3.6900000e+01, -3.6800000e+01, -3.6700000e+01, -3.6600000e+01, -3.6500000e+01, -3.6400000e+01, -3.6300000e+01, -3.6200000e+01, -3.6100000e+01, -3.6000000e+01, -3.5900000e+01, -3.5800000e+01, -3.5700000e+01, -3.5600000e+01, -3.5500000e+01, -3.5400000e+01, -3.5300000e+01, -3.5200000e+01, -3.5100000e+01, -3.5000000e+01, -3.4900000e+01, -3.4800000e+01, -3.4700000e+01, -3.4600000e+01, -3.4500000e+01, -3.4400000e+01, -3.4300000e+01, -3.4200000e+01, -3.4100000e+01, -3.4000000e+01, -3.3900000e+01, -3.3800000e+01, -3.3700000e+01, -3.3600000e+01, -3.3500000e+01, -3.3400000e+01, -3.3300000e+01, -3.3200000e+01, -3.3100000e+01, -3.3000000e+01, -3.2900000e+01, -3.2800000e+01, -3.2700000e+01, -3.2600000e+01, -3.2500000e+01, -3.2400000e+01, -3.2300000e+01, -3.2200000e+01, -3.2100000e+01, -3.2000000e+01, -3.1900000e+01, -3.1800000e+01, -3.1700000e+01, -3.1600000e+01, -3.1500000e+01, -3.1400000e+01, -3.1300000e+01, -3.1200000e+01, -3.1100000e+01, -3.1000000e+01, -3.0900000e+01, -3.0800000e+01, -3.0700000e+01, -3.0600000e+01, -3.0500000e+01, -3.0400000e+01, -3.0300000e+01, -3.0200000e+01, -3.0100000e+01, -3.0000000e+01, -2.9900000e+01, -2.9800000e+01, -2.9700000e+01, -2.9600000e+01, -2.9500000e+01, -2.9400000e+01, -2.9300000e+01, -2.9200000e+01, -2.9100000e+01, -2.9000000e+01, -2.8900000e+01, -2.8800000e+01, -2.8700000e+01, -2.8600000e+01, -2.8500000e+01, -2.8400000e+01, -2.8300000e+01, -2.8200000e+01, -2.8100000e+01, -2.8000000e+01, -2.7900000e+01, -2.7800000e+01, -2.7700000e+01, -2.7600000e+01, -2.7500000e+01, -2.7400000e+01, -2.7300000e+01, -2.7200000e+01, -2.7100000e+01, -2.7000000e+01, -2.6900000e+01, -2.6800000e+01, -2.6700000e+01, -2.6600000e+01, -2.6500000e+01, -2.6400000e+01, -2.6300000e+01, -2.6200000e+01, -2.6100000e+01, -2.6000000e+01, -2.5900000e+01, -2.5800000e+01, -2.5700000e+01, -2.5600000e+01, -2.5500000e+01, -2.5400000e+01, -2.5300000e+01, -2.5200000e+01, -2.5100000e+01, -2.5000000e+01, -2.4900000e+01, -2.4800000e+01, -2.4700000e+01, -2.4600000e+01, -2.4500000e+01, -2.4400000e+01, -2.4300000e+01, -2.4200000e+01, -2.4100000e+01, -2.4000000e+01, -2.3900000e+01, -2.3800000e+01, -2.3700000e+01, -2.3600000e+01, -2.3500000e+01, -2.3400000e+01, -2.3300000e+01, -2.3200000e+01, -2.3100000e+01, -2.3000000e+01, -2.2900000e+01, -2.2800000e+01, -2.2700000e+01, -2.2600000e+01, -2.2500000e+01, -2.2400000e+01, -2.2300000e+01, -2.2200000e+01, -2.2100000e+01, -2.2000000e+01, -2.1900000e+01, -2.1800000e+01, -2.1700000e+01, -2.1600000e+01, -2.1500000e+01, -2.1400000e+01, -2.1300000e+01, -2.1200000e+01, -2.1100000e+01, -2.1000000e+01, -2.0900000e+01, -2.0800000e+01, -2.0700000e+01, -2.0600000e+01, -2.0500000e+01, -2.0400000e+01, -2.0300000e+01, -2.0200000e+01, -2.0100000e+01, -2.0000000e+01, -1.9900000e+01, -1.9800000e+01, -1.9700000e+01, -1.9600000e+01, -1.9500000e+01, -1.9400000e+01, -1.9300000e+01, -1.9200000e+01, -1.9100000e+01, -1.9000000e+01, -1.8900000e+01, -1.8800000e+01, -1.8700000e+01, -1.8600000e+01, -1.8500000e+01, -1.8400000e+01, -1.8300000e+01, -1.8200000e+01, -1.8100000e+01, -1.8000000e+01, -1.7900000e+01, -1.7800000e+01, -1.7700000e+01, -1.7600000e+01, -1.7500000e+01, -1.7400000e+01, -1.7300000e+01, -1.7200000e+01, -1.7100000e+01, -1.7000000e+01, -1.6900000e+01, -1.6800000e+01, -1.6700000e+01, -1.6600000e+01, -1.6500000e+01, -1.6400000e+01, -1.6300000e+01, -1.6200000e+01, -1.6100000e+01, -1.6000000e+01, -1.5900000e+01, -1.5800000e+01, -1.5700000e+01, -1.5600000e+01, -1.5500000e+01, -1.5400000e+01, -1.5300000e+01, -1.5200000e+01, -1.5100000e+01, -1.5000000e+01, -1.4900000e+01, -1.4800000e+01, -1.4700000e+01, -1.4600000e+01, -1.4500000e+01, -1.4400000e+01, -1.4300000e+01, -1.4200000e+01, -1.4100000e+01, -1.4000000e+01, -1.3900000e+01, -1.3800000e+01, -1.3700000e+01, -1.3600000e+01, -1.3500000e+01, -1.3400000e+01, -1.3300000e+01, -1.3200000e+01, -1.3100000e+01, -1.3000000e+01, -1.2900000e+01, -1.2800000e+01, -1.2700000e+01, -1.2600000e+01, -1.2500000e+01, -1.2400000e+01, -1.2300000e+01, -1.2200000e+01, -1.2100000e+01, -1.2000000e+01, -1.1900000e+01, -1.1800000e+01, -1.1700000e+01, -1.1600000e+01, -1.1500000e+01, -1.1400000e+01, -1.1300000e+01, -1.1200000e+01, -1.1100000e+01, -1.1000000e+01, -1.0900000e+01, -1.0800000e+01, -1.0700000e+01, -1.0600000e+01, -1.0500000e+01, -1.0400000e+01, -1.0300000e+01, -1.0200000e+01, -1.0100000e+01, -1.0000000e+01, -9.9000000e+00, -9.8000000e+00, -9.7000000e+00, -9.6000000e+00, -9.5000000e+00, -9.4000000e+00, -9.3000000e+00, -9.2000000e+00, -9.1000000e+00, -9.0000000e+00, -8.9000000e+00, -8.8000000e+00, -8.7000000e+00, -8.6000000e+00, -8.5000000e+00, -8.4000000e+00, -8.3000000e+00, -8.2000000e+00, -8.1000000e+00, -8.0000000e+00, -7.9000000e+00, -7.8000000e+00, -7.7000000e+00, -7.6000000e+00, -7.5000000e+00, -7.4000000e+00, -7.3000000e+00, -7.2000000e+00, -7.1000000e+00, -7.0000000e+00, -6.9000000e+00, -6.8000000e+00, -6.7000000e+00, -6.6000000e+00, -6.5000000e+00, -6.4000000e+00, -6.3000000e+00, -6.2000000e+00, -6.1000000e+00, -6.0000000e+00, -5.9000000e+00, -5.8000000e+00, -5.7000000e+00, -5.6000000e+00, -5.5000000e+00, -5.4000000e+00, -5.3000000e+00, -5.2000000e+00, -5.1000000e+00, -5.0000000e+00, -4.9000000e+00, -4.8000000e+00, -4.7000000e+00, -4.6000000e+00, -4.5000000e+00, -4.4000000e+00, -4.3000000e+00, -4.2000000e+00, -4.1000000e+00, -4.0000000e+00, -3.9000000e+00, -3.8000000e+00, -3.7000000e+00, -3.6000000e+00, -3.5000000e+00, -3.4000000e+00, -3.3000000e+00, -3.2000000e+00, -3.1000000e+00, -3.0000000e+00, -2.9000000e+00, -2.8000000e+00, -2.7000000e+00, -2.6000000e+00, -2.5000000e+00, -2.4000000e+00, -2.3000000e+00, -2.2000000e+00, -2.1000000e+00, -2.0000000e+00, -1.9000000e+00, -1.8000000e+00, -1.7000000e+00, -1.6000000e+00, -1.5000000e+00, -1.4000000e+00, -1.3000000e+00, -1.2000000e+00, -1.1000000e+00, -1.0000000e+00, -9.0000000e-01, -8.0000000e-01, -7.0000000e-01, -6.0000000e-01, -5.0000000e-01, -4.0000000e-01, -3.0000000e-01, -2.0000000e-01, -1.0000000e-01,  0.0000000e+00,  1.0000000e-01,  2.0000000e-01,  3.0000000e-01,  4.0000000e-01,  5.0000000e-01,  6.0000000e-01,  7.0000000e-01,  8.0000000e-01,  9.0000000e-01,  1.0000000e+00,  1.1000000e+00,  1.2000000e+00,  1.3000000e+00,  1.4000000e+00,  1.5000000e+00,  1.6000000e+00,  1.7000000e+00,  1.8000000e+00,  1.9000000e+00,  2.0000000e+00,  2.1000000e+00,  2.2000000e+00,  2.3000000e+00,  2.4000000e+00,  2.5000000e+00,  2.6000000e+00,  2.7000000e+00,  2.8000000e+00,  2.9000000e+00,  3.0000000e+00,  3.1000000e+00,  3.2000000e+00,  3.3000000e+00,  3.4000000e+00,  3.5000000e+00,  3.6000000e+00,  3.7000000e+00,  3.8000000e+00,  3.9000000e+00,  4.0000000e+00,  4.1000000e+00,  4.2000000e+00,  4.3000000e+00,  4.4000000e+00,  4.5000000e+00,  4.6000000e+00,  4.7000000e+00,  4.8000000e+00,  4.9000000e+00,  5.0000000e+00,  5.1000000e+00,  5.2000000e+00,  5.3000000e+00,  5.4000000e+00,  5.5000000e+00,  5.6000000e+00,  5.7000000e+00,  5.8000000e+00,  5.9000000e+00,  6.0000000e+00,  6.1000000e+00,  6.2000000e+00,  6.3000000e+00,  6.4000000e+00,  6.5000000e+00,  6.6000000e+00,  6.7000000e+00,  6.8000000e+00,  6.9000000e+00,  7.0000000e+00,  7.1000000e+00,  7.2000000e+00,  7.3000000e+00,  7.4000000e+00,  7.5000000e+00,  7.6000000e+00,  7.7000000e+00,  7.8000000e+00,  7.9000000e+00,  8.0000000e+00,  8.1000000e+00,  8.2000000e+00,  8.3000000e+00,  8.4000000e+00,  8.5000000e+00,  8.6000000e+00,  8.7000000e+00,  8.8000000e+00,  8.9000000e+00,  9.0000000e+00,  9.1000000e+00,  9.2000000e+00,  9.3000000e+00,  9.4000000e+00,  9.5000000e+00,  9.6000000e+00,  9.7000000e+00,  9.8000000e+00,  9.9000000e+00,  1.0000000e+01,  1.0100000e+01,  1.0200000e+01,  1.0300000e+01,  1.0400000e+01,  1.0500000e+01,  1.0600000e+01,  1.0700000e+01,  1.0800000e+01,  1.0900000e+01,  1.1000000e+01,  1.1100000e+01,  1.1200000e+01,  1.1300000e+01,  1.1400000e+01,  1.1500000e+01,  1.1600000e+01,  1.1700000e+01,  1.1800000e+01,  1.1900000e+01,  1.2000000e+01,  1.2100000e+01,  1.2200000e+01,  1.2300000e+01,  1.2400000e+01,  1.2500000e+01,  1.2600000e+01,  1.2700000e+01,  1.2800000e+01,  1.2900000e+01,  1.3000000e+01,  1.3100000e+01,  1.3200000e+01,  1.3300000e+01,  1.3400000e+01,  1.3500000e+01,  1.3600000e+01,  1.3700000e+01,  1.3800000e+01,  1.3900000e+01,  1.4000000e+01,  1.4100000e+01,  1.4200000e+01,  1.4300000e+01,  1.4400000e+01,  1.4500000e+01,  1.4600000e+01,  1.4700000e+01,  1.4800000e+01,  1.4900000e+01,  1.5000000e+01,  1.5100000e+01,  1.5200000e+01,  1.5300000e+01,  1.5400000e+01,  1.5500000e+01,  1.5600000e+01,  1.5700000e+01,  1.5800000e+01,  1.5900000e+01,  1.6000000e+01,  1.6100000e+01,  1.6200000e+01,  1.6300000e+01,  1.6400000e+01,  1.6500000e+01,  1.6600000e+01,  1.6700000e+01,  1.6800000e+01,  1.6900000e+01,  1.7000000e+01,  1.7100000e+01,  1.7200000e+01,  1.7300000e+01,  1.7400000e+01,  1.7500000e+01,  1.7600000e+01,  1.7700000e+01,  1.7800000e+01,  1.7900000e+01,  1.8000000e+01,  1.8100000e+01,  1.8200000e+01,  1.8300000e+01,  1.8400000e+01,  1.8500000e+01,  1.8600000e+01,  1.8700000e+01,  1.8800000e+01,  1.8900000e+01,  1.9000000e+01,  1.9100000e+01,  1.9200000e+01,  1.9300000e+01,  1.9400000e+01,  1.9500000e+01,  1.9600000e+01,  1.9700000e+01,  1.9800000e+01,  1.9900000e+01,  2.0000000e+01,  2.0100000e+01,  2.0200000e+01,  2.0300000e+01,  2.0400000e+01,  2.0500000e+01,  2.0600000e+01,  2.0700000e+01,  2.0800000e+01,  2.0900000e+01,  2.1000000e+01,  2.1100000e+01,  2.1200000e+01,  2.1300000e+01,  2.1400000e+01,  2.1500000e+01,  2.1600000e+01,  2.1700000e+01,  2.1800000e+01,  2.1900000e+01,  2.2000000e+01,  2.2100000e+01,  2.2200000e+01,  2.2300000e+01,  2.2400000e+01,  2.2500000e+01,  2.2600000e+01,  2.2700000e+01,  2.2800000e+01,  2.2900000e+01,  2.3000000e+01,  2.3100000e+01,  2.3200000e+01,  2.3300000e+01,  2.3400000e+01,  2.3500000e+01,  2.3600000e+01,  2.3700000e+01,  2.3800000e+01,  2.3900000e+01,  2.4000000e+01,  2.4100000e+01,  2.4200000e+01,  2.4300000e+01,  2.4400000e+01,  2.4500000e+01,  2.4600000e+01,  2.4700000e+01,  2.4800000e+01,  2.4900000e+01,  2.5000000e+01,  2.5100000e+01,  2.5200000e+01,  2.5300000e+01,  2.5400000e+01,  2.5500000e+01,  2.5600000e+01,  2.5700000e+01,  2.5800000e+01,  2.5900000e+01,  2.6000000e+01,  2.6100000e+01,  2.6200000e+01,  2.6300000e+01,  2.6400000e+01,  2.6500000e+01,  2.6600000e+01,  2.6700000e+01,  2.6800000e+01,  2.6900000e+01,  2.7000000e+01,  2.7100000e+01,  2.7200000e+01,  2.7300000e+01,  2.7400000e+01,  2.7500000e+01,  2.7600000e+01,  2.7700000e+01,  2.7800000e+01,  2.7900000e+01,  2.8000000e+01,  2.8100000e+01,  2.8200000e+01,  2.8300000e+01,  2.8400000e+01,  2.8500000e+01,  2.8600000e+01,  2.8700000e+01,  2.8800000e+01,  2.8900000e+01,  2.9000000e+01,  2.9100000e+01,  2.9200000e+01,  2.9300000e+01,  2.9400000e+01,  2.9500000e+01,  2.9600000e+01,  2.9700000e+01,  2.9800000e+01,  2.9900000e+01,  3.0000000e+01,  3.0100000e+01,  3.0200000e+01,  3.0300000e+01,  3.0400000e+01,  3.0500000e+01,  3.0600000e+01,  3.0700000e+01,  3.0800000e+01,  3.0900000e+01,  3.1000000e+01,  3.1100000e+01,  3.1200000e+01,  3.1300000e+01,  3.1400000e+01,  3.1500000e+01,  3.1600000e+01,  3.1700000e+01,  3.1800000e+01,  3.1900000e+01,  3.2000000e+01,  3.2100000e+01,  3.2200000e+01,  3.2300000e+01,  3.2400000e+01,  3.2500000e+01,  3.2600000e+01,  3.2700000e+01,  3.2800000e+01,  3.2900000e+01,  3.3000000e+01,  3.3100000e+01,  3.3200000e+01,  3.3300000e+01,  3.3400000e+01,  3.3500000e+01,  3.3600000e+01,  3.3700000e+01,  3.3800000e+01,  3.3900000e+01,  3.4000000e+01,  3.4100000e+01,  3.4200000e+01,  3.4300000e+01,  3.4400000e+01,  3.4500000e+01,  3.4600000e+01,  3.4700000e+01,  3.4800000e+01,  3.4900000e+01,  3.5000000e+01,  3.5100000e+01,  3.5200000e+01,  3.5300000e+01,  3.5400000e+01,  3.5500000e+01,  3.5600000e+01,  3.5700000e+01,  3.5800000e+01,  3.5900000e+01,  3.6000000e+01,  3.6100000e+01,  3.6200000e+01,  3.6300000e+01,  3.6400000e+01,  3.6500000e+01,  3.6600000e+01,  3.6700000e+01,  3.6800000e+01,  3.6900000e+01,  3.7000000e+01,  3.7100000e+01,  3.7200000e+01,  3.7300000e+01,  3.7400000e+01,  3.7500000e+01,  3.7600000e+01,  3.7700000e+01,  3.7800000e+01,  3.7900000e+01,  3.8000000e+01,  3.8100000e+01,  3.8200000e+01,  3.8300000e+01,  3.8400000e+01,  3.8500000e+01,  3.8600000e+01,  3.8700000e+01,  3.8800000e+01,  3.8900000e+01,  3.9000000e+01,  3.9100000e+01,  3.9200000e+01,  3.9300000e+01,  3.9400000e+01,  3.9500000e+01,  3.9600000e+01,  3.9700000e+01,  3.9800000e+01,  3.9900000e+01,  4.0000000e+01,  4.0100000e+01,  4.0200000e+01,  4.0300000e+01,  4.0400000e+01,  4.0500000e+01,  4.0600000e+01,  4.0700000e+01,  4.0800000e+01,  4.0900000e+01,  4.1000000e+01,  4.1100000e+01,  4.1200000e+01,  4.1300000e+01,  4.1400000e+01,  4.1500000e+01,  4.1600000e+01,  4.1700000e+01,  4.1800000e+01,  4.1900000e+01,  4.2000000e+01,  4.2100000e+01,  4.2200000e+01,  4.2300000e+01,  4.2400000e+01,  4.2500000e+01,  4.2600000e+01,  4.2700000e+01,  4.2800000e+01,  4.2900000e+01,  4.3000000e+01,  4.3100000e+01,  4.3200000e+01,  4.3300000e+01,  4.3400000e+01,  4.3500000e+01,  4.3600000e+01,  4.3700000e+01,  4.3800000e+01,  4.3900000e+01,  4.4000000e+01,  4.4100000e+01,  4.4200000e+01,  4.4300000e+01,  4.4400000e+01,  4.4500000e+01,  4.4600000e+01,  4.4700000e+01,  4.4800000e+01,  4.4900000e+01,  4.5000000e+01,  4.5100000e+01,  4.5200000e+01,  4.5300000e+01,  4.5400000e+01,  4.5500000e+01,  4.5600000e+01,  4.5700000e+01,  4.5800000e+01,  4.5900000e+01,  4.6000000e+01,  4.6100000e+01,  4.6200000e+01,  4.6300000e+01,  4.6400000e+01,  4.6500000e+01,  4.6600000e+01,  4.6700000e+01,  4.6800000e+01,  4.6900000e+01,  4.7000000e+01,  4.7100000e+01,  4.7200000e+01,  4.7300000e+01,  4.7400000e+01,  4.7500000e+01,  4.7600000e+01,  4.7700000e+01,  4.7800000e+01,  4.7900000e+01,  4.8000000e+01,  4.8100000e+01,  4.8200000e+01,  4.8300000e+01,  4.8400000e+01,  4.8500000e+01,  4.8600000e+01,  4.8700000e+01,  4.8800000e+01,  4.8900000e+01,  4.9000000e+01,  4.9100000e+01,  4.9200000e+01,  4.9300000e+01,  4.9400000e+01,  4.9500000e+01,  4.9600000e+01,  4.9700000e+01,  4.9800000e+01,  4.9900000e+01,  5.0000000e+01,  5.0100000e+01,  5.0200000e+01,  5.0300000e+01,  5.0400000e+01,  5.0500000e+01,  5.0600000e+01,  5.0700000e+01,  5.0800000e+01,  5.0900000e+01,  5.1000000e+01,  5.1100000e+01,  5.1200000e+01,  5.1300000e+01,  5.1400000e+01,  5.1500000e+01,  5.1600000e+01,  5.1700000e+01,  5.1800000e+01,  5.1900000e+01,  5.2000000e+01,  5.2100000e+01,  5.2200000e+01,  5.2300000e+01,  5.2400000e+01,  5.2500000e+01,  5.2600000e+01,  5.2700000e+01,  5.2800000e+01,  5.2900000e+01,  5.3000000e+01,  5.3100000e+01,  5.3200000e+01,  5.3300000e+01,  5.3400000e+01,  5.3500000e+01,  5.3600000e+01,  5.3700000e+01,  5.3800000e+01,  5.3900000e+01,  5.4000000e+01,  5.4100000e+01,  5.4200000e+01,  5.4300000e+01,  5.4400000e+01,  5.4500000e+01,  5.4600000e+01,  5.4700000e+01,  5.4800000e+01,  5.4900000e+01,  5.5000000e+01,  5.5100000e+01,  5.5200000e+01,  5.5300000e+01,  5.5400000e+01,  5.5500000e+01,  5.5600000e+01,  5.5700000e+01,  5.5800000e+01,  5.5900000e+01,  5.6000000e+01,  5.6100000e+01,  5.6200000e+01,  5.6300000e+01,  5.6400000e+01,  5.6500000e+01,  5.6600000e+01,  5.6700000e+01,  5.6800000e+01,  5.6900000e+01,  5.7000000e+01,  5.7100000e+01,  5.7200000e+01,  5.7300000e+01,  5.7400000e+01,  5.7500000e+01,  5.7600000e+01,  5.7700000e+01,  5.7800000e+01,  5.7900000e+01,  5.8000000e+01,  5.8100000e+01,  5.8200000e+01,  5.8300000e+01,  5.8400000e+01,  5.8500000e+01,  5.8600000e+01,  5.8700000e+01,  5.8800000e+01,  5.8900000e+01,  5.9000000e+01,  5.9100000e+01,  5.9200000e+01,  5.9300000e+01,  5.9400000e+01,  5.9500000e+01,  5.9600000e+01,  5.9700000e+01,  5.9800000e+01,  5.9900000e+01,  6.0000000e+01,  6.0100000e+01,  6.0200000e+01,  6.0300000e+01,  6.0400000e+01,  6.0500000e+01,  6.0600000e+01,  6.0700000e+01,  6.0800000e+01,  6.0900000e+01,  6.1000000e+01,  6.1100000e+01,  6.1200000e+01,  6.1300000e+01},
    step = {  0.0000000e+00,  4.3563739e-07,  8.7487692e-07,  1.3177623e-06,  1.7643374e-06,  2.2146458e-06,  2.6687313e-06,  3.1266374e-06,  3.5884070e-06,  4.0540819e-06,  4.5237031e-06,  4.9973112e-06,  5.4749463e-06,  5.9566489e-06,  6.4424590e-06,  6.9324156e-06,  7.4265561e-06,  7.9249164e-06,  8.4275316e-06,  8.9344360e-06,  9.4456637e-06,  9.9612478e-06,  1.0481221e-05,  1.1005614e-05,  1.1534458e-05,  1.2067782e-05,  1.2605616e-05,  1.3147989e-05,  1.3694930e-05,  1.4246471e-05,  1.4802642e-05,  1.5363473e-05,  1.5928994e-05,  1.6499236e-05,  1.7074225e-05,  1.7653992e-05,  1.8238564e-05,  1.8827968e-05,  1.9422231e-05,  2.0021381e-05,  2.0625445e-05,  2.1234452e-05,  2.1848428e-05,  2.2467402e-05,  2.3091403e-05,  2.3720461e-05,  2.4354606e-05,  2.4993868e-05,  2.5638279e-05,  2.6287872e-05,  2.6942682e-05,  2.7602749e-05,  2.8268111e-05,  2.8938810e-05,  2.9614890e-05,  3.0296392e-05,  3.0983358e-05,  3.1675828e-05,  3.2373843e-05,  3.3077444e-05,  3.3786671e-05,  3.4501563e-05,  3.5222157e-05,  3.5948491e-05,  3.6680602e-05,  3.7418527e-05,  3.8162303e-05,  3.8911969e-05,  3.9667563e-05,  4.0429125e-05,  4.1196696e-05,  4.1970316e-05,  4.2750028e-05,  4.3535873e-05,  4.4327892e-05,  4.5126131e-05,  4.5930634e-05,  4.6741450e-05,  4.7558627e-05,  4.8382214e-05,  4.9212264e-05,  5.0048830e-05,  5.0891966e-05,  5.1741730e-05,  5.2598183e-05,  5.3461385e-05,  5.4331400e-05,  5.5208293e-05,  5.6092131e-05,  5.6982981e-05,  5.7880911e-05,  5.8785992e-05,  5.9698294e-05,  6.0617887e-05,  6.1544843e-05,  6.2479235e-05,  6.3421140e-05,  6.4370636e-05,  6.5327803e-05,  6.6292724e-05,  6.7265480e-05,  6.8246156e-05,  6.9234837e-05,  7.0231607e-05,  7.1236552e-05,  7.2249760e-05,  7.3271319e-05,  7.4301322e-05,  7.5339860e-05,  7.6387030e-05,  7.7442926e-05,  7.8507645e-05,  7.9581282e-05,  8.0663937e-05,  8.1755705e-05,  8.2856686e-05,  8.3966977e-05,  8.5086677e-05,  8.6215882e-05,  8.7354688e-05,  8.8503190e-05,  8.9661484e-05,  9.0829665e-05,  9.2007827e-05,  9.3196060e-05,  9.4394457e-05,  9.5603104e-05,  9.6822091e-05,  9.8051503e-05,  9.9291424e-05,  1.0054194e-04,  1.0180313e-04,  1.0307507e-04,  1.0435785e-04,  1.0565156e-04,  1.0695628e-04,  1.0827209e-04,  1.0959908e-04,  1.1093733e-04,  1.1228692e-04,  1.1364794e-04,  1.1502046e-04,  1.1640457e-04,  1.1780035e-04,  1.1920789e-04,  1.2062726e-04,  1.2205856e-04,  1.2350187e-04,  1.2495728e-04,  1.2642488e-04,  1.2790477e-04,  1.2939704e-04,  1.3090179e-04,  1.3241913e-04,  1.3394916e-04,  1.3549200e-04,  1.3704776e-04,  1.3861654e-04,  1.4019845e-04,  1.4179361e-04,  1.4340211e-04,  1.4502407e-04,  1.4665959e-04,  1.4830878e-04,  1.4997173e-04,  1.5164856e-04,  1.5333938e-04,  1.5504430e-04,  1.5676343e-04,  1.5849688e-04,  1.6024477e-04,  1.6200722e-04,  1.6378434e-04,  1.6557625e-04,  1.6738310e-04,  1.6920499e-04,  1.7104207e-04,  1.7289447e-04,  1.7476233e-04,  1.7664579e-04,  1.7854501e-04,  1.8046013e-04,  1.8239131e-04,  1.8433870e-04,  1.8630247e-04,  1.8828279e-04,  1.9027980e-04,  1.9229367e-04,  1.9432458e-04,  1.9637269e-04,  1.9843819e-04,  2.0052125e-04,  2.0262206e-04,  2.0474079e-04,  2.0687764e-04,  2.0903280e-04,  2.1120644e-04,  2.1339877e-04,  2.1560998e-04,  2.1784027e-04,  2.2008985e-04,  2.2235892e-04,  2.2464767e-04,  2.2695633e-04,  2.2928510e-04,  2.3163418e-04,  2.3400380e-04,  2.3639414e-04,  2.3880543e-04,  2.4123787e-04,  2.4369166e-04,  2.4616701e-04,  2.4866413e-04,  2.5118320e-04,  2.5372444e-04,  2.5628803e-04,  2.5887418e-04,  2.6148306e-04,  2.6411488e-04,  2.6676983e-04,  2.6944811e-04,  2.7214990e-04,  2.7487541e-04,  2.7762483e-04,  2.8039837e-04,  2.8319621e-04,  2.8601855e-04,  2.8886559e-04,  2.9173753e-04,  2.9463456e-04,  2.9755690e-04,  3.0050475e-04,  3.0347831e-04,  3.0647781e-04,  3.0950346e-04,  3.1255549e-04,  3.1563413e-04,  3.1873963e-04,  3.2187224e-04,  3.2503218e-04,  3.2821971e-04,  3.3143506e-04,  3.3467848e-04,  3.3795019e-04,  3.4125045e-04,  3.4457948e-04,  3.4793755e-04,  3.5132488e-04,  3.5474174e-04,  3.5818837e-04,  3.6166503e-04,  3.6517199e-04,  3.6870950e-04,  3.7227784e-04,  3.7587729e-04,  3.7950814e-04,  3.8317068e-04,  3.8686520e-04,  3.9059201e-04,  3.9435143e-04,  3.9814377e-04,  4.0196937e-04,  4.0582855e-04,  4.0972164e-04,  4.1364899e-04,  4.1761093e-04,  4.2160781e-04,  4.2564000e-04,  4.2970785e-04,  4.3381174e-04,  4.3795204e-04,  4.4212911e-04,  4.4634335e-04,  4.5059513e-04,  4.5488486e-04,  4.5921292e-04,  4.6357972e-04,  4.6798567e-04,  4.7243117e-04,  4.7691662e-04,  4.8144245e-04,  4.8600904e-04,  4.9061680e-04,  4.9526614e-04,  4.9995745e-04,  5.0469114e-04,  5.0946760e-04,  5.1428722e-04,  5.1915039e-04,  5.2405749e-04,  5.2900891e-04,  5.3400505e-04,  5.3904629e-04,  5.4413304e-04,  5.4926569e-04,  5.5444463e-04,  5.5967027e-04,  5.6494300e-04,  5.7026321e-04,  5.7563133e-04,  5.8104776e-04,  5.8651293e-04,  5.9202726e-04,  5.9759121e-04,  6.0320523e-04,  6.0886979e-04,  6.1458536e-04,  6.2035240e-04,  6.2617139e-04,  6.3204279e-04,  6.3796707e-04,  6.4394470e-04,  6.4997615e-04,  6.5606191e-04,  6.6220246e-04,  6.6839829e-04,  6.7464991e-04,  6.8095782e-04,  6.8732254e-04,  6.9374462e-04,  7.0022460e-04,  7.0676303e-04,  7.1336050e-04,  7.2001758e-04,  7.2673488e-04,  7.3351301e-04,  7.4035258e-04,  7.4725422e-04,  7.5421855e-04,  7.6124624e-04,  7.6833794e-04,  7.7549432e-04,  7.8271606e-04,  7.9000385e-04,  7.9735839e-04,  8.0478038e-04,  8.1227055e-04,  8.1982961e-04,  8.2745831e-04,  8.3515737e-04,  8.4292753e-04,  8.5076952e-04,  8.5868407e-04,  8.6667193e-04,  8.7473381e-04,  8.8287044e-04,  8.9108251e-04,  8.9937076e-04,  9.0773589e-04,  9.1617861e-04,  9.2469967e-04,  9.3329978e-04,  9.4197967e-04,  9.5074007e-04,  9.5958171e-04,  9.6850533e-04,  9.7751169e-04,  9.8660155e-04,  9.9577569e-04,  1.0050349e-03,  1.0143801e-03,  1.0238120e-03,  1.0333315e-03,  1.0429395e-03,  1.0526368e-03,  1.0624242e-03,  1.0723025e-03,  1.0822728e-03,  1.0923357e-03,  1.1024923e-03,  1.1127434e-03,  1.1230900e-03,  1.1335329e-03,  1.1440732e-03,  1.1547118e-03,  1.1654498e-03,  1.1762883e-03,  1.1872282e-03,  1.1982706e-03,  1.2094168e-03,  1.2206676e-03,  1.2320244e-03,  1.2434882e-03,  1.2550603e-03,  1.2667418e-03,  1.2785340e-03,  1.2904380e-03,  1.3024551e-03,  1.3145866e-03,  1.3268337e-03,  1.3391977e-03,  1.3516798e-03,  1.3642813e-03,  1.3770034e-03,  1.3898474e-03,  1.4028145e-03,  1.4159059e-03,  1.4291229e-03,  1.4424666e-03,  1.4559385e-03,  1.4695397e-03,  1.4832715e-03,  1.4971351e-03,  1.5111320e-03,  1.5252633e-03,  1.5395306e-03,  1.5539351e-03,  1.5684784e-03,  1.5831619e-03,  1.5979870e-03,  1.6129552e-03,  1.6280678e-03,  1.6433264e-03,  1.6587324e-03,  1.6742875e-03,  1.6899931e-03,  1.7058509e-03,  1.7218625e-03,  1.7380296e-03,  1.7543539e-03,  1.7708373e-03,  1.7874815e-03,  1.8042883e-03,  1.8212596e-03,  1.8383975e-03,  1.8557036e-03,  1.8731802e-03,  1.8908291e-03,  1.9086524e-03,  1.9266522e-03,  1.9448304e-03,  1.9631893e-03,  1.9817307e-03,  2.0004569e-03,  2.0193696e-03,  2.0384711e-03,  2.0577633e-03,  2.0772482e-03,  2.0969280e-03,  2.1168047e-03,  2.1368804e-03,  2.1571573e-03,  2.1776374e-03,  2.1983232e-03,  2.2192168e-03,  2.2403206e-03,  2.2616369e-03,  2.2831681e-03,  2.3049166e-03,  2.3268847e-03,  2.3490749e-03,  2.3714898e-03,  2.3941319e-03,  2.4170038e-03,  2.4401085e-03,  2.4634487e-03,  2.4870273e-03,  2.5108472e-03,  2.5349115e-03,  2.5592232e-03,  2.5837854e-03,  2.6086013e-03,  2.6336742e-03,  2.6590074e-03,  2.6846040e-03,  2.7104672e-03,  2.7366004e-03,  2.7630066e-03,  2.7896891e-03,  2.8166512e-03,  2.8438960e-03,  2.8714270e-03,  2.8992474e-03,  2.9273606e-03,  2.9557701e-03,  2.9844797e-03,  3.0134929e-03,  3.0428135e-03,  3.0724450e-03,  3.1023914e-03,  3.1326564e-03,  3.1632442e-03,  3.1941588e-03,  3.2254045e-03,  3.2569857e-03,  3.2889069e-03,  3.3211729e-03,  3.3537882e-03,  3.3867579e-03,  3.4200867e-03,  3.4537796e-03,  3.4878417e-03,  3.5222778e-03,  3.5570930e-03,  3.5922921e-03,  3.6278802e-03,  3.6638623e-03,  3.7002434e-03,  3.7370286e-03,  3.7742233e-03,  3.8118331e-03,  3.8498634e-03,  3.8883200e-03,  3.9272085e-03,  3.9665348e-03,  4.0063051e-03,  4.0465255e-03,  4.0872027e-03,  4.1283434e-03,  4.1699547e-03,  4.2120436e-03,  4.2546177e-03,  4.2976843e-03,  4.3412509e-03,  4.3853250e-03,  4.4299141e-03,  4.4750256e-03,  4.5206671e-03,  4.5668462e-03,  4.6135707e-03,  4.6608488e-03,  4.7086888e-03,  4.7570989e-03,  4.8060877e-03,  4.8556641e-03,  4.9058374e-03,  4.9566172e-03,  5.0080137e-03,  5.0600372e-03,  5.1126983e-03,  5.1660081e-03,  5.2199777e-03,  5.2746184e-03,  5.3299413e-03,  5.3859577e-03,  5.4426789e-03,  5.5001163e-03,  5.5582819e-03,  5.6171881e-03,  5.6768473e-03,  5.7372726e-03,  5.7984776e-03,  5.8604766e-03,  5.9232848e-03,  5.9869177e-03,  6.0513913e-03,  6.1167221e-03,  6.1829266e-03,  6.2500214e-03,  6.3180231e-03,  6.3869488e-03,  6.4568164e-03,  6.5276442e-03,  6.5994509e-03,  6.6722559e-03,  6.7460800e-03,  6.8209454e-03,  6.8968754e-03,  6.9738946e-03,  7.0520273e-03,  7.1312978e-03,  7.2117305e-03,  7.2933506e-03,  7.3761846e-03,  7.4602603e-03,  7.5456069e-03,  7.6322558e-03,  7.7202405e-03,  7.8095960e-03,  7.9003577e-03,  7.9925612e-03,  8.0862427e-03,  8.1814407e-03,  8.2781961e-03,  8.3765521e-03,  8.4765555e-03,  8.5782562e-03,  8.6817060e-03,  8.7869569e-03,  8.8940625e-03,  9.0030800e-03,  9.1140712e-03,  9.2271043e-03,  9.3422531e-03,  9.4595944e-03,  9.5792056e-03,  9.7011666e-03,  9.8255651e-03,  9.9525003e-03,  1.0082083e-02,  1.0214432e-02,  1.0349666e-02,  1.0487915e-02,  1.0629323e-02,  1.0774048e-02,  1.0922261e-02,  1.1074151e-02,  1.1229941e-02,  1.1389881e-02,  1.1554242e-02,  1.1723325e-02,  1.1897467e-02,  1.2077050e-02,  1.2262528e-02,  1.2454462e-02,  1.2653548e-02,  1.2860661e-02,  1.3076870e-02,  1.3303490e-02,  1.3542116e-02,  1.3794900e-02,  1.4064882e-02,  1.4360136e-02,  1.4708924e-02,  1.5122538e-02,  1.5536153e-02,  1.5884941e-02,  1.6180195e-02,  1.6450177e-02,  1.6702961e-02,  1.6941586e-02,  1.7168207e-02,  1.7384416e-02,  1.7591529e-02,  1.7790615e-02,  1.7982549e-02,  1.8168027e-02,  1.8347610e-02,  1.8521752e-02,  1.8690835e-02,  1.8855196e-02,  1.9015136e-02,  1.9170926e-02,  1.9322815e-02,  1.9471028e-02,  1.9615754e-02,  1.9757162e-02,  1.9895411e-02,  2.0030645e-02,  2.0162993e-02,  2.0292576e-02,  2.0419512e-02,  2.0543910e-02,  2.0665871e-02,  2.0785482e-02,  2.0902824e-02,  2.1017972e-02,  2.1131005e-02,  2.1241997e-02,  2.1351014e-02,  2.1458120e-02,  2.1563371e-02,  2.1666821e-02,  2.1768521e-02,  2.1868525e-02,  2.1966881e-02,  2.2063636e-02,  2.2158834e-02,  2.2252516e-02,  2.2344719e-02,  2.2435481e-02,  2.2524836e-02,  2.2612821e-02,  2.2699470e-02,  2.2784816e-02,  2.2868892e-02,  2.2951726e-02,  2.3033346e-02,  2.3113779e-02,  2.3193049e-02,  2.3271182e-02,  2.3348201e-02,  2.3424131e-02,  2.3498997e-02,  2.3572821e-02,  2.3645626e-02,  2.3717433e-02,  2.3788260e-02,  2.3858128e-02,  2.3927054e-02,  2.3995055e-02,  2.4062150e-02,  2.4128355e-02,  2.4193685e-02,  2.4258159e-02,  2.4321792e-02,  2.4384600e-02,  2.4446599e-02,  2.4507804e-02,  2.4568229e-02,  2.4627889e-02,  2.4686795e-02,  2.4744960e-02,  2.4802398e-02,  2.4859119e-02,  2.4915135e-02,  2.4970458e-02,  2.5025099e-02,  2.5079069e-02,  2.5132378e-02,  2.5185040e-02,  2.5237063e-02,  2.5288459e-02,  2.5339239e-02,  2.5389413e-02,  2.5438989e-02,  2.5487978e-02,  2.5536388e-02,  2.5584228e-02,  2.5631506e-02,  2.5678231e-02,  2.5724410e-02,  2.5770051e-02,  2.5815163e-02,  2.5859752e-02,  2.5903826e-02,  2.5947392e-02,  2.5990459e-02,  2.6033033e-02,  2.6075122e-02,  2.6116733e-02,  2.6157874e-02,  2.6198551e-02,  2.6238772e-02,  2.6278542e-02,  2.6317868e-02,  2.6356757e-02,  2.6395213e-02,  2.6433244e-02,  2.6470853e-02,  2.6508048e-02,  2.6544833e-02,  2.6581214e-02,  2.6617196e-02,  2.6652785e-02,  2.6687984e-02,  2.6722799e-02,  2.6757235e-02,  2.6791297e-02,  2.6824990e-02,  2.6858319e-02,  2.6891288e-02,  2.6923904e-02,  2.6956170e-02,  2.6988091e-02,  2.7019672e-02,  2.7050918e-02,  2.7081833e-02,  2.7112420e-02,  2.7142685e-02,  2.7172632e-02,  2.7202263e-02,  2.7231584e-02,  2.7260597e-02,  2.7289307e-02,  2.7317716e-02,  2.7345829e-02,  2.7373650e-02,  2.7401181e-02,  2.7428426e-02,  2.7455388e-02,  2.7482070e-02,  2.7508476e-02,  2.7534609e-02,  2.7560473e-02,  2.7586069e-02,  2.7611403e-02,  2.7636475e-02,  2.7661291e-02,  2.7685854e-02,  2.7710165e-02,  2.7734229e-02,  2.7758049e-02,  2.7781628e-02,  2.7804968e-02,  2.7828073e-02,  2.7850945e-02,  2.7873587e-02,  2.7896002e-02,  2.7918192e-02,  2.7940160e-02,  2.7961909e-02,  2.7983440e-02,  2.8004756e-02,  2.8025860e-02,  2.8046754e-02,  2.8067439e-02,  2.8087919e-02,  2.8108196e-02,  2.8128272e-02,  2.8148149e-02,  2.8167829e-02,  2.8187313e-02,  2.8206606e-02,  2.8225707e-02,  2.8244620e-02,  2.8263346e-02,  2.8281887e-02,  2.8300246e-02,  2.8318425e-02,  2.8336424e-02,  2.8354248e-02,  2.8371897e-02,  2.8389373e-02,  2.8406679e-02,  2.8423817e-02,  2.8440788e-02,  2.8457595e-02,  2.8474239e-02,  2.8490723e-02,  2.8507047e-02,  2.8523214e-02,  2.8539226e-02,  2.8555084e-02,  2.8570789e-02,  2.8586344e-02,  2.8601750e-02,  2.8617009e-02,  2.8632122e-02,  2.8647090e-02,  2.8661915e-02,  2.8676598e-02,  2.8691142e-02,  2.8705546e-02,  2.8719813e-02,  2.8733945e-02,  2.8747942e-02,  2.8761805e-02,  2.8775537e-02,  2.8789138e-02,  2.8802610e-02,  2.8815954e-02,  2.8829171e-02,  2.8842262e-02,  2.8855229e-02,  2.8868073e-02,  2.8880795e-02,  2.8893397e-02,  2.8905879e-02,  2.8918243e-02,  2.8930490e-02,  2.8942622e-02,  2.8954639e-02,  2.8966543e-02,  2.8978335e-02,  2.8990016e-02,  2.9001588e-02,  2.9013052e-02,  2.9024409e-02,  2.9035660e-02,  2.9046806e-02,  2.9057849e-02,  2.9068788e-02,  2.9079627e-02,  2.9090365e-02,  2.9101004e-02,  2.9111544e-02,  2.9121987e-02,  2.9132333e-02,  2.9142584e-02,  2.9152741e-02,  2.9162804e-02,  2.9172774e-02,  2.9182653e-02,  2.9192440e-02,  2.9202137e-02,  2.9211745e-02,  2.9221265e-02,  2.9230697e-02,  2.9240042e-02,  2.9249301e-02,  2.9258475e-02,  2.9267565e-02,  2.9276571e-02,  2.9285495e-02,  2.9294337e-02,  2.9303097e-02,  2.9311777e-02,  2.9320377e-02,  2.9328898e-02,  2.9337341e-02,  2.9345706e-02,  2.9353994e-02,  2.9362206e-02,  2.9370343e-02,  2.9378405e-02,  2.9386393e-02,  2.9394307e-02,  2.9402149e-02,  2.9409919e-02,  2.9417618e-02,  2.9425247e-02,  2.9432806e-02,  2.9440296e-02,  2.9447718e-02,  2.9455073e-02,  2.9462361e-02,  2.9469582e-02,  2.9476739e-02,  2.9483830e-02,  2.9490858e-02,  2.9497823e-02,  2.9504724e-02,  2.9511564e-02,  2.9518342e-02,  2.9525059e-02,  2.9531716e-02,  2.9538314e-02,  2.9544852e-02,  2.9551332e-02,  2.9557754e-02,  2.9564119e-02,  2.9570427e-02,  2.9576678e-02,  2.9582874e-02,  2.9589015e-02,  2.9595101e-02,  2.9601132e-02,  2.9607110e-02,  2.9613034e-02,  2.9618905e-02,  2.9624724e-02,  2.9630491e-02,  2.9636207e-02,  2.9641871e-02,  2.9647486e-02,  2.9653049e-02,  2.9658564e-02,  2.9664029e-02,  2.9669445e-02,  2.9674814e-02,  2.9680134e-02,  2.9685406e-02,  2.9690632e-02,  2.9695811e-02,  2.9700944e-02,  2.9706030e-02,  2.9711072e-02,  2.9716068e-02,  2.9721019e-02,  2.9725926e-02,  2.9730790e-02,  2.9735609e-02,  2.9740386e-02,  2.9745119e-02,  2.9749811e-02,  2.9754460e-02,  2.9759068e-02,  2.9763634e-02,  2.9768160e-02,  2.9772646e-02,  2.9777091e-02,  2.9781497e-02,  2.9785864e-02,  2.9790192e-02,  2.9794482e-02,  2.9798733e-02,  2.9802948e-02,  2.9807125e-02,  2.9811265e-02,  2.9815369e-02,  2.9819437e-02,  2.9823469e-02,  2.9827466e-02,  2.9831428e-02,  2.9835355e-02,  2.9839248e-02,  2.9843107e-02,  2.9846933e-02,  2.9850725e-02,  2.9854485e-02,  2.9858212e-02,  2.9861906e-02,  2.9865569e-02,  2.9869199e-02,  2.9872799e-02,  2.9876367e-02,  2.9879905e-02,  2.9883412e-02,  2.9886888e-02,  2.9890335e-02,  2.9893752e-02,  2.9897139e-02,  2.9900497e-02,  2.9903826e-02,  2.9907127e-02,  2.9910398e-02,  2.9913642e-02,  2.9916857e-02,  2.9920045e-02,  2.9923204e-02,  2.9926337e-02,  2.9929443e-02,  2.9932521e-02,  2.9935573e-02,  2.9938599e-02,  2.9941598e-02,  2.9944572e-02,  2.9947520e-02,  2.9950442e-02,  2.9953339e-02,  2.9956211e-02,  2.9959058e-02,  2.9961881e-02,  2.9964678e-02,  2.9967452e-02,  2.9970201e-02,  2.9972927e-02,  2.9975629e-02,  2.9978307e-02,  2.9980962e-02,  2.9983594e-02,  2.9986203e-02,  2.9988789e-02,  2.9991352e-02,  2.9993894e-02,  2.9996413e-02,  2.9998910e-02,  3.0001385e-02,  3.0003839e-02,  3.0006271e-02,  3.0008683e-02,  3.0011073e-02,  3.0013443e-02,  3.0015792e-02,  3.0018120e-02,  3.0020429e-02,  3.0022718e-02,  3.0024987e-02,  3.0027236e-02,  3.0029467e-02,  3.0031678e-02,  3.0033870e-02,  3.0036044e-02,  3.0038199e-02,  3.0040336e-02,  3.0042455e-02,  3.0044555e-02,  3.0046639e-02,  3.0048704e-02,  3.0050752e-02,  3.0052783e-02,  3.0054797e-02,  3.0056794e-02,  3.0058774e-02,  3.0060738e-02,  3.0062685e-02,  3.0064617e-02,  3.0066532e-02,  3.0068431e-02,  3.0070314e-02,  3.0072182e-02,  3.0074035e-02,  3.0075872e-02,  3.0077694e-02,  3.0079500e-02,  3.0081292e-02,  3.0083070e-02,  3.0084832e-02,  3.0086580e-02,  3.0088313e-02,  3.0090032e-02,  3.0091737e-02,  3.0093428e-02,  3.0095105e-02,  3.0096768e-02,  3.0098417e-02,  3.0100053e-02,  3.0101675e-02,  3.0103283e-02,  3.0104878e-02,  3.0106460e-02,  3.0108029e-02,  3.0109585e-02,  3.0111128e-02,  3.0112658e-02,  3.0114175e-02,  3.0115680e-02,  3.0117172e-02,  3.0118652e-02,  3.0120119e-02,  3.0121575e-02,  3.0123018e-02,  3.0124449e-02,  3.0125869e-02,  3.0127276e-02,  3.0128672e-02,  3.0130056e-02,  3.0131429e-02,  3.0132790e-02,  3.0134139e-02,  3.0135478e-02,  3.0136805e-02,  3.0138120e-02,  3.0139425e-02,  3.0140719e-02,  3.0142002e-02,  3.0143274e-02,  3.0144535e-02,  3.0145785e-02,  3.0147025e-02,  3.0148255e-02,  3.0149474e-02,  3.0150682e-02,  3.0151881e-02,  3.0153069e-02,  3.0154247e-02,  3.0155415e-02,  3.0156574e-02,  3.0157722e-02,  3.0158861e-02,  3.0159990e-02,  3.0161110e-02,  3.0162220e-02,  3.0163321e-02,  3.0164413e-02,  3.0165495e-02,  3.0166569e-02,  3.0167634e-02,  3.0168690e-02,  3.0169737e-02,  3.0170775e-02,  3.0171805e-02,  3.0172827e-02,  3.0173840e-02,  3.0174845e-02,  3.0175842e-02,  3.0176831e-02,  3.0177811e-02,  3.0178784e-02,  3.0179749e-02,  3.0180706e-02,  3.0181656e-02,  3.0182597e-02,  3.0183532e-02,  3.0184459e-02,  3.0185378e-02,  3.0186291e-02,  3.0187196e-02,  3.0188094e-02,  3.0188985e-02,  3.0189868e-02,  3.0190745e-02,  3.0191615e-02,  3.0192479e-02,  3.0193335e-02,  3.0194185e-02,  3.0195028e-02,  3.0195864e-02,  3.0196695e-02,  3.0197518e-02,  3.0198335e-02,  3.0199146e-02,  3.0199951e-02,  3.0200749e-02,  3.0201541e-02,  3.0202327e-02,  3.0203106e-02,  3.0203880e-02,  3.0204648e-02,  3.0205409e-02,  3.0206165e-02,  3.0206914e-02,  3.0207658e-02,  3.0208396e-02,  3.0209128e-02,  3.0209855e-02,  3.0210575e-02,  3.0211290e-02,  3.0211999e-02,  3.0212703e-02,  3.0213401e-02,  3.0214093e-02,  3.0214780e-02,  3.0215462e-02,  3.0216138e-02,  3.0216809e-02,  3.0217474e-02,  3.0218134e-02,  3.0218789e-02,  3.0219438e-02,  3.0220083e-02,  3.0220722e-02,  3.0221356e-02,  3.0221985e-02,  3.0222609e-02,  3.0223228e-02,  3.0223842e-02,  3.0224451e-02,  3.0225055e-02,  3.0225654e-02,  3.0226249e-02,  3.0226838e-02,  3.0227423e-02,  3.0228002e-02,  3.0228577e-02,  3.0229148e-02,  3.0229713e-02,  3.0230274e-02,  3.0230830e-02,  3.0231382e-02,  3.0231929e-02,  3.0232471e-02,  3.0233009e-02,  3.0233542e-02,  3.0234071e-02,  3.0234596e-02,  3.0235115e-02,  3.0235631e-02,  3.0236142e-02,  3.0236649e-02,  3.0237152e-02,  3.0237650e-02,  3.0238144e-02,  3.0238634e-02,  3.0239120e-02,  3.0239602e-02,  3.0240079e-02,  3.0240553e-02,  3.0241023e-02,  3.0241488e-02,  3.0241950e-02,  3.0242408e-02,  3.0242862e-02,  3.0243312e-02,  3.0243759e-02,  3.0244202e-02,  3.0244641e-02},
    continuous = true,
    nFuture = 700,
    nPast = 700);

  annotation (Icon(graphics={Text(
          extent={{-100,90},{100,60}},
          lineColor={0,0,0},
          textString="Good asphalt concrete")}), Documentation(info="<html>
<p>Filter to smooth the data just as a first order filter, based on a table interpolation and parameterized for a good asphalt concrete road. This is suitable e.g. for automotive comfort analysis.</p>
</html>"));
end ConreteAsphaltGood;