const csrfToken = () => document.querySelector("meta[name=csrf-token]").content;

const fetchWithToken = (url, options) => {
  options.headers = {
    "X-CSRF-Token": csrfToken(),
    ...options.headers
  };

  return fetch(url, options)
}

global.csrfToken      = csrfToken
global.fetchWithToken = fetchWithToken
