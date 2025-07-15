import { Hono } from 'hono'
import { serve } from '@hono/node-server'

const app = new Hono()

app.all('*', (c) => {
    return c.json({ response: 'ok' })
})

serve({fetch: app.fetch, port: 4000});