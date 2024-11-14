module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<i16, dense<16> : vector<2xi32>>, #dlti.dl_entry<i8, dense<8> : vector<2xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<i128, dense<128> : vector<2xi32>>, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>>, llvm.data_layout = "e-m:o-i64:64-i128:128-n32:64-S128", llvm.target_triple = "arm64-apple-macosx15.0.0", "polygeist.target-cpu" = "apple-m1", "polygeist.target-features" = "+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz"} {
  memref.global @global_var_2 : memref<1xi32> = dense<0> {intermittent.nonvolatile}
  memref.global @global_var_1 : memref<1xi32> = dense<0> {intermittent.nonvolatile}
  func.func @task_init() -> i32 attributes {intermittent.task = 0 : i32, llvm.linkage = #llvm.linkage<external>} {
    %c1_i32 = arith.constant 1 : i32
    return %c1_i32 : i32
  }
  func.func @task_a() -> i32 attributes {intermittent.task = 1 : i32, llvm.linkage = #llvm.linkage<external>} {
    %c2_i32 = arith.constant 2 : i32
    %c1_i32 = arith.constant 1 : i32
    %0 = memref.get_global @global_var_1 : memref<1xi32>
    %1 = affine.load %0[0] : memref<1xi32>
    %2 = arith.addi %1, %c1_i32 : i32
    affine.store %2, %0[0] : memref<1xi32>
    return %c2_i32 : i32
  }
  func.func @task_b() -> i32 attributes {intermittent.task = 2 : i32, llvm.linkage = #llvm.linkage<external>} {
    %c1_i32 = arith.constant 1 : i32
    %0 = memref.get_global @global_var_2 : memref<1xi32>
    %1 = affine.load %0[0] : memref<1xi32>
    %2 = arith.addi %1, %c1_i32 : i32
    affine.store %2, %0[0] : memref<1xi32>
    return %c1_i32 : i32
  }
}
