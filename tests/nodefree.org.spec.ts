import { expect, test } from '@playwright/test'
import axios from 'axios'
import * as fs from 'fs'

test('nodefree.org', async ({ page }) => {
  await page.goto('https://nodefree.org/f/freenode', {
    waitUntil: 'domcontentloaded',
  })

  const locator = await page.locator('.post-loop >> li >> nth=0 >> h2 >> a')
  const detailUrl = await locator.getAttribute('href')

  await expect(detailUrl).not.toBeNull()
  await page.goto(detailUrl, {
    waitUntil: 'domcontentloaded',
  })

  const postContent = await page.locator('.entry-content >> nth=0').innerText()

  const matchResult = postContent.match(
    /(https\:\/\/nodefree\.org\/[a-zA-Z-\/0-9]+.yaml)/,
  )
  if (!matchResult) {
    console.log(postContent)
  }

  await expect(matchResult).not.toBeNull()

  const url = matchResult[1]
  console.log(url)

  const response = await axios.get(url, {
    responseType: 'blob',
  })

  await expect(response.status).toEqual(200)

  fs.writeFileSync('./public/nodefreeorg.yaml', response.data)
})
