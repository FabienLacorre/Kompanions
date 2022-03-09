type TextProps = {
  color?: string;
  children?: any;
};


const colorSelector = (c: string | undefined) => {
    let color = "";
  
    switch (c) {
      case "secondary":
        color = "secondary-background";
        break;
      default:
        color = "main-background";
        break;
    }
    return color;
  };
  
const Text = (props: TextProps) => {
  <span>{props.children}</span>;
};

export default Text;
