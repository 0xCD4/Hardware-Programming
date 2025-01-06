# Verilog Örnekleri

Bu repository, temel Verilog modüllerinin implementasyonlarını içerir.

## Modüller

### 1. Adder (Toplayıcılar)
- **Half Adder**: 2 bitlik toplama yapan basit toplayıcı
- **Full Adder**: Elde biti ile 3 bitlik toplama yapan tam toplayıcı
- **Ripple Carry Adder**: 4-bitlik sayıları toplayan kademeli toplayıcı

### 2. Parity
- **Parity Checker**: Verilen giriş bitlerinin tek/çift paritesini kontrol eden modül

### 3. Flip Flops
- **T Flip-Flop**: Toggle flip-flop (asenkron ve senkron reset versiyonları)
- **D Flip-Flop**: Data flip-flop

### 4. ALU (Arithmetic Logic Unit)
- Temel aritmetik ve mantık işlemleri:
  - ADD (Toplama)
  - LESS (Küçüktür karşılaştırması)
  - EQ (Eşitlik karşılaştırması)
  - OR (Mantıksal OR)
  - AND (Mantıksal AND)
  - NOT (Mantıksal NOT)

### 5. Encoder/Decoder
- **4-to-2 Encoder**: 4 bit girişi 2 bite kodlar
- **2-to-4 Decoder**: 2 bit girişi 4 bite çözer

### 6. Multiplexer (MUX)
- **2:1 MUX**: 2 giriş, 1 çıkış
- **4:1 MUX**: 4 giriş, 1 çıkış
- **8:1 MUX**: 8 giriş, 1 çıkış

## Kullanım

Her modül için test bench dosyaları mevcuttur. Simülasyon için:

```bash
# Derleme
iverilog -o testbench_name module.v testbench.v

# Çalıştırma
vvp testbench_name

# Dalga görüntüleyici (GTKWave)
gtkwave waveform.vcd
```

## Dizin Yapısı
```
verilog/
├── adder/
│   ├── half_adder.v
│   ├── full_adder.v
│   └── ripple_carry_adder.v
├── parity/
│   └── parity.v
├── flip_flop/
│   ├── t_flipflop.v
│   └── d_flipflop.v
├── alu/
│   └── alu.v
├── encoder_decoder/
│   ├── encoder_4to2.v
│   └── decoder_2to4.v
└── mux/
    ├── mux_2to1.v
    ├── mux_4to1.v
    └── mux_8to1.v
```
