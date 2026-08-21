const luaparse = require('C:/Users/Administrator/.workbuddy/binaries/node/workspace/node_modules/luaparse');
const fs = require('fs');
const path = require('path');

const files = process.argv.slice(2);
let failed = 0;
for (const f of files) {
  const code = fs.readFileSync(f, 'utf8');
  try {
    luaparse.parse(code, { comments: true, luaVersion: '5.1' });
    console.log('OK   ' + path.basename(f));
  } catch (e) {
    failed++;
    console.log('FAIL ' + path.basename(f) + ' -> ' + e.message);
  }
}
process.exit(failed ? 1 : 0);
