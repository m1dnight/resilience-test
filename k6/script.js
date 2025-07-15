import http from 'k6/http';
import { sleep, check } from 'k6';

export const options = {
  vus: 500,
  duration: '30m'
};

export default function () {
  let res = http.get('http://34.51.220.94:4000');
  // let res = http.get('http://localhost:4000');
  check(res, { "status is 200": (res) => res.status === 200 });
}
