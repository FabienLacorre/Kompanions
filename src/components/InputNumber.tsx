type InputNumberProps = {
  value?: number;
  rounded?: boolean;
  placeholder?: string;
  change?: (value: number) => void;
};

const InputNumber = (props: InputNumberProps) => {
  const rounded = props.rounded === true ? "rounded" : "";
  return (
    <input
      type="number"
      onChange={(e: any) => props.change && props.change(e.target.value)}
      value={props.value}
      placeholder={`${props.placeholder}`}
      className={`input ${rounded}`}
    />
  );
};
export default InputNumber;
