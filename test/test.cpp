#include <assert.h>
#include "../src/calculator.h"
#include <cifuzz/cifuzz.h>
#include <fuzzer/FuzzedDataProvider.h>
#include <cstdint>
#include <cstddef>
#include <string>

FUZZ_TEST_SETUP() {
  // Perform any one-time setup required by the FUZZ_TEST function.
}

FUZZ_TEST(const uint8_t *data, size_t size) {
  /*Your code here*/
  FuzzedDataProvider fuzzed_data(data, size);
  
  float a = fuzzed_data.ConsumeFloatingPoint<float>();
  float b = fuzzed_data.ConsumeFloatingPoint<float>();
  char op = static_cast<char>(fuzzed_data.ConsumeIntegral<uint8_t>());
  
  calculator(a, op, b);
}
