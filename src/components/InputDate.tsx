type InputDateProps = {
  value?: string;
  rounded?: boolean;
  placeholder?: string;
  change?: (value: string) => void;
};

const InputDate = (props: InputDateProps) => {
  const rounded = props.rounded === true ? "rounded" : "";
  return (
    <input
      type="date"
      onChange={(e) => props.change && props.change(e.target.value)}
      value={props.value}
      placeholder={`${props.placeholder}`}
      className={`input ${rounded}`}
    />
  );
};
export default InputDate;
