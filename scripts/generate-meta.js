const all = require('./all.json');
const fs = require('fs');
all.forEach(e => {
  const { id } = e;
  delete e.id;
  fs.writeFileSync(`./metadata/${id}.json`, JSON.stringify(e));
})

