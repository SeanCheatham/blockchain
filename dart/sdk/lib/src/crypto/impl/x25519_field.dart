import 'dart:typed_data';

import 'ec.dart';
import 'package:fixnum/fixnum.dart';

/**
 * AMS 2021:
 * Curve point operations ported from BouncyCastle used in all EC primitives in crypto.primitives.eddsa
 * Licensing: https://www.bouncycastle.org/licence.html
 * Copyright (c) 2000 - 2021 The Legion of the Bouncy Castle Inc. (https://www.bouncycastle.org)
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
const SIZE = 10;
const M24 = 0x00ffffff;
const M25 = 0x01ffffff;
const M26 = 0x03ffffff;
final ROOT_NEG_ONE = Int32List.fromList([
  0x020ea0b0,
  0x0386c9d2,
  0x00478c4e,
  0x0035697f,
  0x005e8630,
  0x01fbd7a7,
  0x0340264f,
  0x01f0b2b4,
  0x00027e0e,
  0x00570649
]);

void add(Int32List x, Int32List y, Int32List z) {
  for (int i = 0; i < SIZE; i++) {
    z[i] = x[i] + y[i];
  }
}

void addOne1(Int32List z) {
  z[0] += 1;
}

void addOne2(Int32List z, int zOff) {
  z[zOff] += 1;
}

void apm(Int32List x, Int32List y, Int32List zp, Int32List zm) {
  for (int i = 0; i < SIZE; i++) {
    final xi = Int32(x[i]);
    final yi = Int32(y[i]);
    zp[i] = (xi + yi).toInt();
    zm[i] = (xi - yi).toInt();
  }
}

void carry(Int32List z) {
  var z0 = Int32(z[0]);
  var z1 = Int32(z[1]);
  var z2 = Int32(z[2]);
  var z3 = Int32(z[3]);
  var z4 = Int32(z[4]);
  var z5 = Int32(z[5]);
  var z6 = Int32(z[6]);
  var z7 = Int32(z[7]);
  var z8 = Int32(z[8]);
  var z9 = Int32(z[9]);
  z3 = (z3 + (z2 >> 25)).toInt32();
  z2 &= M25;
  z5 = (z5 + (z4 >> 25)).toInt32();
  z4 &= M25;
  z8 = (z8 + (z7 >> 25)).toInt32();
  z7 &= M25;
  z0 = (z0 + (z9 >> 25) * 38).toInt32();
  z9 &= M25;
  z1 = (z1 + (z0 >> 26)).toInt32();
  z0 &= M26;
  z6 = (z6 + (z5 >> 26)).toInt32();
  z5 &= M26;
  z2 = (z2 + (z1 >> 26)).toInt32();
  z1 &= M26;
  z4 = (z4 + (z3 >> 26)).toInt32();
  z3 &= M26;
  z7 = (z7 + (z6 >> 26)).toInt32();
  z6 &= M26;
  z9 = (z9 + (z8 >> 26)).toInt32();
  z8 &= M26;
  z[0] = z0.toInt();
  z[1] = z1.toInt();
  z[2] = z2.toInt();
  z[3] = z3.toInt();
  z[4] = z4.toInt();
  z[5] = z5.toInt();
  z[6] = z6.toInt();
  z[7] = z7.toInt();
  z[8] = z8.toInt();
  z[9] = z9.toInt();
}

void cmov(int cond, Int32List x, int xOff, Int32List z, int zOff) {
  for (int i = 0; i < SIZE; i++) {
    int z_i = z[zOff + i];
    final diff = z_i ^ x[xOff + i];
    z_i ^= (diff & cond);
    z[zOff + i] = z_i;
  }
}

void cnegate(Int32 negate, Int32List z) {
  final mask = (Int32.ZERO - negate).toInt32();
  for (int i = 0; i < SIZE; i++) {
    z[i] = ((Int32(z[i]) ^ mask) - mask).toInt32().toInt();
  }
}

void copy(Int32List x, int xOff, Int32List z, int zOff) {
  for (int i = 0; i < SIZE; i++) {
    z[zOff + i] = x[xOff + i];
  }
}

void cswap(Int32 swap, Int32List a, Int32List b) {
  final mask = Int32.ZERO - swap;
  for (int i = 0; i < SIZE; i++) {
    final ai = Int32(a[i]);
    final bi = Int32(b[i]);
    final dummy = mask & (ai ^ bi);
    a[i] = (ai ^ dummy).toInt();
    b[i] = (bi ^ dummy).toInt();
  }
}

Int32List get create => Int32List(SIZE);

void decode(Int8List x, int xOff, Int32List z) {
  decode128(x, xOff, z, 0);
  decode128(x, xOff + 16, z, 5);
  z[9] = (Int32(z[9]) & M24).toInt();
}

void decode128(Int8List bs, int off, Int32List z, zOff) {
  final t0 = decode32(bs, off + 0);
  final t1 = decode32(bs, off + 4);
  final t2 = decode32(bs, off + 8);
  final t3 = decode32(bs, off + 12);
  z[zOff + 0] = (t0 & M26).toInt32().toInt();
  z[zOff + 1] =
      (((t1 << 6) | (t0.shiftRightUnsigned(26))) & M26).toInt32().toInt();
  z[zOff + 2] =
      (((t2 << 12) | (t1.shiftRightUnsigned(20))) & M25).toInt32().toInt();
  z[zOff + 3] =
      (((t3 << 19) | (t2.shiftRightUnsigned(13))) & M26).toInt32().toInt();
  z[zOff + 4] = t3.shiftRightUnsigned(7).toInt32().toInt();
}

Int32 decode32(Int8List bs, int off) {
  var n = Int32(bs[off]) & 0xff;
  n |= (bs[off + 1] & 0xff) << 8;
  n |= (bs[off + 2] & 0xff) << 16;
  n |= (bs[off + 3] & 0xff) << 24;
  return n;
}

void encode(Int32List x, Int8List z, int zOff) {
  encode128(x, 0, z, zOff);
  encode128(x, 5, z, zOff + 16);
}

void encode128(Int32List x, int xOff, Int8List bs, int off) {
  final x0 = x[xOff + 0];
  final x1 = x[xOff + 1];
  final x2 = x[xOff + 2];
  final x3 = x[xOff + 3];
  final x4 = x[xOff + 4];
  final t0 = x0 | (x1 << 26);
  encode32(t0, bs, off + 0);
  final t1 = (x1 >>> 6) | (x2 << 20);
  encode32(t1, bs, off + 4);
  final t2 = (x2 >>> 12) | (x3 << 13);
  encode32(t2, bs, off + 8);
  final t3 = (x3 >>> 19) | (x4 << 7);
  encode32(t3, bs, off + 12);
}

void encode32(int n, Int8List bs, int off) {
  bs[off + 0] = n.toByte;
  bs[off + 1] = (n >>> 8).toByte;
  bs[off + 2] = (n >>> 16).toByte;
  bs[off + 3] = (n >>> 24).toByte;
}

void inv(Int32List x, Int32List z) {
  // (250 1s) (1 0s) (1 1s) (1 0s) (2 1s)
  // Addition chain: [1] [2] 3 5 10 15 25 50 75 125 [250]
  final x2 = create;
  final t = create;
  powPm5d8(x, x2, t);
  sqr2(t, 3, t);
  mul2(t, x2, z);
}

Int32 isZero(Int32List x) {
  Int32 d = Int32.ZERO;
  for (int i = 0; i < SIZE; i++) d |= x[i];
  d = (d.shiftRightUnsigned(1)) | (d & 1);
  return ((d - 1) >> 31).toInt32();
}

bool isZeroVar(Int32List x) => isZero(x) != Int32.ZERO;

void mul1(Int32List x, int y, Int32List z) {
  final x0 = x[0];
  final x1 = x[1];
  var x2 = x[2];
  final x3 = x[3];
  var x4 = x[4];
  final x5 = x[5];
  final x6 = x[6];
  var x7 = x[7];
  final x8 = x[8];
  var x9 = x[9];
  var c0 = Int64.ZERO;
  var c1 = Int64.ZERO;
  var c2 = Int64.ZERO;
  var c3 = Int64.ZERO;
  c0 = Int64(x2) * y;
  x2 = c0.toInt32().toInt() & M25;
  c0 >>= 25;
  c1 = Int64(x4) * y;
  x4 = c1.toInt32().toInt() & M25;
  c1 >>= 25;
  c2 = Int64(x7) * y;
  x7 = c2.toInt32().toInt() & M25;
  c2 >>= 25;
  c3 = Int64(x9) * y;
  x9 = c3.toInt32().toInt() & M25;
  c3 >>= 25;
  c3 *= 38;
  c3 += Int64(x0) * y;
  z[0] = c3.toInt32().toInt() & M26;
  c3 >>= 26;
  c1 += Int64(x5) * y;
  z[5] = c1.toInt32().toInt() & M26;
  c1 >>= 26;
  c3 += Int64(x1) * y;
  z[1] = c3.toInt32().toInt() & M26;
  c3 >>= 26;
  c0 += Int64(x3) * y;
  z[3] = c0.toInt32().toInt() & M26;
  c0 >>= 26;
  c1 += Int64(x6) * y;
  z[6] = c1.toInt32().toInt() & M26;
  c1 >>= 26;
  c2 += Int64(x8) * y;
  z[8] = c2.toInt32().toInt() & M26;
  c2 >>= 26;
  z[2] = x2 + c3.toInt32().toInt();
  z[4] = x4 + c0.toInt32().toInt();
  z[7] = x7 + c1.toInt32().toInt();
  z[9] = x9 + c2.toInt32().toInt();
}

void mul2(Int32List x, Int32List y, Int32List z) {
  var x0 = x[0];
  var y0 = y[0];
  var x1 = x[1];
  var y1 = y[1];
  var x2 = x[2];
  var y2 = y[2];
  var x3 = x[3];
  var y3 = y[3];
  var x4 = x[4];
  var y4 = y[4];
  final u0 = x[5];
  final v0 = y[5];
  final u1 = x[6];
  final v1 = y[6];
  final u2 = x[7];
  final v2 = y[7];
  final u3 = x[8];
  final v3 = y[8];
  final u4 = x[9];
  final v4 = y[9];
  var a0 = Int64(x0) * y0;
  var a1 = Int64(x0) * y1 + Int64(x1) * y0;
  var a2 = Int64(x0) * y2 + Int64(x1) * y1 + Int64(x2) * y0;
  var a3 = Int64(x1) * y2 + Int64(x2) * y1;
  a3 <<= 1;
  a3 += Int64(x0) * y3 + Int64(x3) * y0;
  var a4 = Int64(x2) * y2;
  a4 <<= 1;
  a4 += Int64(x0) * y4 + Int64(x1) * y3 + Int64(x3) * y1 + Int64(x4) * y0;
  var a5 = Int64(x1) * y4 + Int64(x2) * y3 + Int64(x3) * y2 + Int64(x4) * y1;
  a5 <<= 1;
  var a6 = Int64(x2) * y4 + Int64(x4) * y2;
  a6 <<= 1;
  a6 += Int64(x3) * y3;
  var a7 = Int64(x3) * y4 + Int64(x4) * y3;
  var a8 = Int64(x4) * y4;
  a8 <<= 1;
  final b0 = Int64(u0) * v0;
  final b1 = Int64(u0) * v1 + Int64(u1) * v0;
  final b2 = Int64(u0) * v2 + Int64(u1) * v1 + Int64(u2) * v0;
  var b3 = Int64(u1) * v2 + Int64(u2) * v1;
  b3 <<= 1;
  b3 += Int64(u0) * v3 + Int64(u3) * v0;
  var b4 = Int64(u2) * v2;
  b4 <<= 1;
  b4 += Int64(u0) * v4 + Int64(u1) * v3 + Int64(u3) * v1 + Int64(u4) * v0;
  final b5 = Int64(u1) * v4 + Int64(u2) * v3 + Int64(u3) * v2 + Int64(u4) * v1;
  var b6 = Int64(u2) * v4 + Int64(u4) * v2;
  b6 <<= 1;
  b6 += Int64(u3) * v3;
  final b7 = Int64(u3) * v4 + Int64(u4) * v3;
  final b8 = Int64(u4) * v4;
  a0 -= b5 * 76;
  a1 -= b6 * 38;
  a2 -= b7 * 38;
  a3 -= b8 * 76;
  a5 -= b0;
  a6 -= b1;
  a7 -= b2;
  a8 -= b3;
  x0 += u0;
  y0 += v0;
  x1 += u1;
  y1 += v1;
  x2 += u2;
  y2 += v2;
  x3 += u3;
  y3 += v3;
  x4 += u4;
  y4 += v4;
  final c0 = Int64(x0) * y0;
  final c1 = Int64(x0) * y1 + Int64(x1) * y0;
  final c2 = Int64(x0) * y2 + Int64(x1) * y1 + Int64(x2) * y0;
  var c3 = Int64(x1) * y2 + Int64(x2) * y1;
  c3 <<= 1;
  c3 += Int64(x0) * y3 + Int64(x3) * y0;
  var c4 = Int64(x2) * y2;
  c4 <<= 1;
  c4 += Int64(x0) * y4 + Int64(x1) * y3 + Int64(x3) * y1 + Int64(x4) * y0;
  var c5 = Int64(x1) * y4 + Int64(x2) * y3 + Int64(x3) * y2 + Int64(x4) * y1;
  c5 <<= 1;
  var c6 = Int64(x2) * y4 + Int64(x4) * y2;
  c6 <<= 1;
  c6 += Int64(x3) * y3;
  final c7 = Int64(x3) * y4 + Int64(x4) * y3;
  var c8 = Int64(x4) * y4;
  c8 <<= 1;
  var z8 = Int32.ZERO;
  var z9 = Int32.ZERO;
  var t = Int64(0);
  t = a8 + (c3 - a3);
  z8 = t.toInt32() & M26;
  t >>= 26;
  t += (c4 - a4) - b4;
  z9 = t.toInt32() & M25;
  t >>= 25;
  t = a0 + (t + c5 - a5) * 38;
  z[0] = (t.toInt32() & M26).toInt();
  t >>= 26;
  t += a1 + (c6 - a6) * 38;
  z[1] = (t.toInt32() & M26).toInt();
  t >>= 26;
  t += a2 + (c7 - a7) * 38;
  z[2] = (t.toInt32() & M25).toInt();
  t >>= 25;
  t += a3 + (c8 - a8) * 38;
  z[3] = (t.toInt32() & M26).toInt();
  t >>= 26;
  t += a4 + b4 * 38;
  z[4] = (t.toInt32() & M25).toInt();
  t >>= 25;
  t += a5 + (c0 - a0);
  z[5] = (t.toInt32() & M26).toInt();
  t >>= 26;
  t += a6 + (c1 - a1);
  z[6] = (t.toInt32() & M26).toInt();
  t >>= 26;
  t += a7 + (c2 - a2);
  z[7] = (t.toInt32() & M25).toInt();
  t >>= 25;
  t += z8;
  z[8] = (t.toInt32() & M26).toInt();
  t >>= 26;
  z[9] = (z9 + t).toInt32().toInt();
}

void negate(Int32List x, Int32List z) {
  for (int i = 0; i < SIZE; i++) z[i] = -x[i];
}

void normalize(Int32List z) {
  final x = Int32(z[9] >>> 23) & 1;
  reduce(z, x);
  reduce(z, -x);
}

void one(Int32List z) {
  z[0] = 1;
  for (int i = 1; i < SIZE; i++) z[i] = 0;
}

void powPm5d8(Int32List x, Int32List rx2, Int32List rz) {
  // (250 1s) (1 0s) (1 1s)
  // Addition chain: [1] 2 3 5 10 15 25 50 75 125 [250]
  final x2 = rx2;
  sqr(x, x2);
  mul2(x, x2, x2);
  final x3 = create;
  sqr(x2, x3);
  mul2(x, x3, x3);
  final x5 = x3;
  sqr2(x3, 2, x5);
  mul2(x2, x5, x5);
  final x10 = create;
  sqr2(x5, 5, x10);
  mul2(x5, x10, x10);
  final x15 = create;
  sqr2(x10, 5, x15);
  mul2(x5, x15, x15);
  final x25 = x5;
  sqr2(x15, 10, x25);
  mul2(x10, x25, x25);
  final x50 = x10;
  sqr2(x25, 25, x50);
  mul2(x25, x50, x50);
  final x75 = x15;
  sqr2(x50, 25, x75);
  mul2(x25, x75, x75);
  final x125 = x25;
  sqr2(x75, 50, x125);
  mul2(x50, x125, x125);
  final x250 = x50;
  sqr2(x125, 125, x250);
  mul2(x125, x250, x250);
  final t = x125;
  sqr2(x250, 2, t);
  mul2(t, x, rz);
}

void reduce(Int32List z, Int32 c) {
  var z9 = Int32(z[9]);
  var t = z9;
  z9 = (t & M24).toInt32();
  t >>= 24;
  t = (t + c).toInt32();
  t = (t * 19).toInt32();
  t = (t + z[0]).toInt32();
  z[0] = (t & M26).toInt();
  t >>= 26;
  t = (t + z[1]).toInt32();
  z[1] = (t & M26).toInt();
  t >>= 26;
  t = (t + z[2]).toInt32();
  z[2] = (t & M25).toInt();
  t >>= 25;
  t = (t + z[3]).toInt32();
  z[3] = (t & M26).toInt();
  t >>= 26;
  t = (t + z[4]).toInt32();
  z[4] = (t & M25).toInt();
  t >>= 25;
  t = (t + z[5]).toInt32();
  z[5] = (t & M26).toInt();
  t >>= 26;
  t = (t + z[6]).toInt32();
  z[6] = (t & M26).toInt();
  t >>= 26;
  t = (t + z[7]).toInt32();
  z[7] = (t & M25).toInt();
  t >>= 25;
  t = (t + z[8]).toInt32();
  z[8] = (t & M26).toInt();
  t >>= 26;
  t = (t + z9).toInt32();
  z[9] = t.toInt();
}

void sqr(Int32List x, Int32List z) {
  var x0 = x[0];
  var x1 = x[1];
  var x2 = x[2];
  var x3 = x[3];
  var x4 = x[4];
  final u0 = x[5];
  final u1 = x[6];
  final u2 = x[7];
  final u3 = x[8];
  final u4 = x[9];
  var x1_2 = x1 * 2;
  var x2_2 = x2 * 2;
  var x3_2 = x3 * 2;
  var x4_2 = x4 * 2;
  var a0 = Int64(x0) * x0;
  var a1 = Int64(x0) * x1_2;
  var a2 = Int64(x0) * x2_2 + Int64(x1) * x1;
  var a3 = Int64(x1_2) * x2_2 + Int64(x0) * x3_2;
  final a4 = Int64(x2) * x2_2 + Int64(x0) * x4_2 + Int64(x1) * x3_2;
  var a5 = Int64(x1_2) * x4_2 + Int64(x2_2) * x3_2;
  var a6 = Int64(x2_2) * x4_2 + Int64(x3) * x3;
  var a7 = Int64(x3) * x4_2;
  var a8 = Int64(x4) * x4_2;
  final u1_2 = u1 * 2;
  final u2_2 = u2 * 2;
  final u3_2 = u3 * 2;
  final u4_2 = u4 * 2;
  final b0 = Int64(u0) * u0;
  final b1 = Int64(u0) * u1_2;
  final b2 = Int64(u0) * u2_2 + Int64(u1) * u1;
  final b3 = Int64(u1_2) * u2_2 + Int64(u0) * u3_2;
  final b4 = Int64(u2) * u2_2 + Int64(u0) * u4_2 + Int64(u1) * u3_2;
  final b5 = Int64(u1_2) * u4_2 + Int64(u2_2) * u3_2;
  final b6 = Int64(u2_2) * u4_2 + Int64(u3) * u3;
  final b7 = Int64(u3) * u4_2;
  final b8 = Int64(u4) * u4_2;
  a0 -= b5 * 38;
  a1 -= b6 * 38;
  a2 -= b7 * 38;
  a3 -= b8 * 38;
  a5 -= b0;
  a6 -= b1;
  a7 -= b2;
  a8 -= b3;
  x0 += u0;
  x1 += u1;
  x2 += u2;
  x3 += u3;
  x4 += u4;
  x1_2 = x1 * 2;
  x2_2 = x2 * 2;
  x3_2 = x3 * 2;
  x4_2 = x4 * 2;
  final c0 = Int64(x0) * x0;
  final c1 = Int64(x0) * x1_2;
  final c2 = Int64(x0) * x2_2 + Int64(x1) * x1;
  final c3 = Int64(x1_2) * x2_2 + Int64(x0) * x3_2;
  final c4 = Int64(x2) * x2_2 + Int64(x0) * x4_2 + Int64(x1) * x3_2;
  final c5 = Int64(x1_2) * x4_2 + Int64(x2_2) * x3_2;
  final c6 = Int64(x2_2) * x4_2 + Int64(x3) * x3;
  final c7 = Int64(x3) * x4_2;
  final c8 = Int64(x4) * x4_2;
  var z8 = 0;
  var z9 = 0;
  var t = Int64(0);
  t = a8 + (c3 - a3);
  z8 = t.toInt32().toInt() & M26;
  t >>= 26;
  t += (c4 - a4) - b4;
  z9 = t.toInt32().toInt() & M25;
  t >>= 25;
  t = a0 + (t + c5 - a5) * 38;
  z[0] = t.toInt32().toInt() & M26;
  t >>= 26;
  t += a1 + (c6 - a6) * 38;
  z[1] = t.toInt32().toInt() & M26;
  t >>= 26;
  t += a2 + (c7 - a7) * 38;
  z[2] = t.toInt32().toInt() & M25;
  t >>= 25;
  t += a3 + (c8 - a8) * 38;
  z[3] = t.toInt32().toInt() & M26;
  t >>= 26;
  t += a4 + b4 * 38;
  z[4] = t.toInt32().toInt() & M25;
  t >>= 25;
  t += a5 + (c0 - a0);
  z[5] = t.toInt32().toInt() & M26;
  t >>= 26;
  t += a6 + (c1 - a1);
  z[6] = t.toInt32().toInt() & M26;
  t >>= 26;
  t += a7 + (c2 - a2);
  z[7] = t.toInt32().toInt() & M25;
  t >>= 25;
  t += z8;
  z[8] = t.toInt32().toInt() & M26;
  t >>= 26;
  z[9] = z9 + t.toInt32().toInt();
}

void sqr2(Int32List x, int n, Int32List z) {
  int nv = n;
  sqr(x, z);
  while (--nv > 0) {
    sqr(z, z);
  }
}

bool sqrtRatioVar(Int32List u, Int32List v, Int32List z) {
  final uv3 = create;
  final uv7 = create;
  mul2(u, v, uv3);
  sqr(v, uv7);
  mul2(uv3, uv7, uv3);
  sqr(uv7, uv7);
  mul2(uv7, uv3, uv7);
  final t = create;
  final x = create;
  powPm5d8(uv7, t, x);
  mul2(x, uv3, x);
  final vx2 = create;
  sqr(x, vx2);
  mul2(vx2, v, vx2);
  sub(vx2, u, t);
  normalize(t);
  if (isZeroVar(t)) {
    copy(x, 0, z, 0);
    return true;
  }
  add(vx2, u, t);
  normalize(t);
  if (isZeroVar(t)) {
    mul2(x, ROOT_NEG_ONE, z);
    return true;
  }
  return false;
}

void sub(Int32List x, Int32List y, Int32List z) {
  for (int i = 0; i < SIZE; i++) z[i] = x[i] - y[i];
}

void subOne(Int32List z) {
  z[0] -= 1;
}

void zero(Int32List z) {
  for (int i = 0; i < SIZE; i++) z[i] = 0;
}
