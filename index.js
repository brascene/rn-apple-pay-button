import * as React from "react";
import { NativeModules, requireNativeComponent } from "react-native";

const APButtonComponent = requireNativeComponent("APButton");

export class ApplePayButton extends React.Component {
  static defaultProps = {
    buttonStyle: "black",
    buttonType: "plain",
    height: 44
  };

  render() {
    return (
      <APButtonComponent
        buttonStyle={this.props.buttonStyle}
        buttonType={this.props.type}
        onPress={this.props.onPress}
        width={this.props.width}
        height={this.props.height}
      />
    );
  }
}