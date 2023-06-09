import assert from "node:assert";
import test from "node:test";

import { createApp } from "./app.js";

// TODO: create actual tests
test("createApp test", () => {
  const app = createApp({ port: 12 });
  assert.deepEqual(app, { port: 12 });
});
