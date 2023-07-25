import React from "react";
import {
  useExtensionApi,
  render,
  // useTranslate,
  Button,
} from "@shopify/checkout-ui-extensions-react";

render("Checkout::Actions::RenderBefore", () => <App />);

function App() {
  const { extensionPoint, applyMetafieldChange } = useExtensionApi();
  // const translate = useTranslate();
  return (
    <Button
      onPress={async () => {
        console.log(
          "Applying metafield change, this breaks the order when it's using a $app namespace"
        );
        await applyMetafieldChange({
          key: "break-order",
          namespace: "$app:checkout",
          value: "clicking this button will break the order",
          type: "updateMetafield",
          valueType: "string",
        });
      }}
    >
      Break order
    </Button>
  );
}
