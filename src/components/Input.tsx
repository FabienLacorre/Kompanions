type InputProps = {
  value?: string;
  rounded?: boolean;
  placeholder?: string;
  change?: (value: string) => void;
};

const Input = (props: InputProps) => {
  const rounded = props.rounded === true ? "rounded" : "";
  return (
    <input
      type="text"
      onChange={(e) => props.change && props.change(e.target.value)}
      value={props.value}
      placeholder={`${props.placeholder}`}
      className={`input ${rounded}`}
    />
  );
};
export default Input;
