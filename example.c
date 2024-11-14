__attribute((nonvolatile_var)) int global_var_1 = 0;
__attribute((nonvolatile_var)) int global_var_2 = 0;

__attribute__((intermittent_task(0))) int task_init() {
  // transition to task_a
  return 1;
}

__attribute__((intermittent_task(1))) int task_a() {
  global_var_1++;
  // transition to task_b
  return 2;
}

__attribute__((intermittent_task(2))) int task_b() {
  global_var_2++;
  // transition to task_a
  return 1;
}
