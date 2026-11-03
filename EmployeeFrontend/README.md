# Northstar Employee Directory

A responsive Angular 18 employee directory with live search, department filtering, employee status, and summary statistics.

## Run locally

1. Start the employee API at `http://localhost:51234`.
2. Install packages with `npm install`.
3. Start the app with `npm start` and open `http://localhost:4200`.

The Angular development server proxies `/api` requests to the local API. The directory uses `GET /api/employees`; the proxy is configured in `proxy.conf.json`.

## Build

Run `npm run build` to create a production build in `dist/employee-directory`.
