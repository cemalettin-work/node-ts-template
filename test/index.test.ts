import assert from "node:assert";
import test from "node:test";
import { add } from "./testUtils.js";

test("basic test", () => {
  assert.strictEqual(1, 1);
});

test("add utility should add correctly", () => {
  assert.strictEqual(add(1, 2), 3);
});
