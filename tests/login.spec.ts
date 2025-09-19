import { test, expect } from '@playwright/test';

test('login admin', async ({ page }) => {
    await page.goto('https://nextraceweb.vercel.app/login');
    await page.fill('input[type="text"]', 'AdminDiogo');   // 👈 usuário correto
    await page.fill('input[type="password"]', 'D1090@f');  // 👈 senha correta
    await page.click('button[type="submit"]');
    await expect(page).toHaveURL(/.*admin/);
});