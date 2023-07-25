# Checkout UI Reproduction Repo

This app was generated using the shopify cli and the default (and at the time, latest) ruby template. Then a checkout ui extension was added and set up that a button saves reserved namespace metafields.

## Please list the package(s) involved in the issue, and include the version you are using

@shopify/cli: 3.47.5
@shopify/app: 3.47.5
@shopify/checkout-ui-extensions-react: 0.26.0
react: 17.0.2

## Describe the bug

Using `applyMetafieldChange` or the react `useApplyMetafieldsChange` hook when referencing a reserved namespace (`$app:`) causes an order made from the checkout flow to not save on completion - it doesn't appear in the store's admin orders list when you see the confirmation page.

## Steps to reproduce the behavior:

1. Run `pnpm run dev` and visit the /extensions/dev-console page
2. Follow the preview `checkout ui extension` link
3. Click on the break order button during the process (before you submit payment)
4. Finish the order
5. Visit the store's admin page and try and find that order in the list - it doesn't exist...

## Expected behavior

I would expect an order made with the metafields set to show up in my list of orders (and running the reproduction steps without clicking the button does that).

## Additional context

I am building a survey tool so need to tag an order with a key so that I can associate it back to a survey response from the thank you page. reserved namespace metafields seem like the most logical way to link an order to a survey response using a random key - but setting the metafield silently breaks any order made.
