const fetch = require('node-fetch');

(async () => {
    const url='https://api.gbif.orgv1/species/match/';
    const addedParams='&verbose=true&kingdom=Plantae&name=Agathis%20montana';
    const uri=url+addedParams;
    const response = await fetch(uri);
    const json = await response.json();
    console.log(json);
    console.log(uri);
})();