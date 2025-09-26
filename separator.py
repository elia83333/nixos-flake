def nixos_flake_header(text, width=80):
    left = "╞"
    right = "╡"
    text = f" {text} "
    line_len = width - len(text) - 4  # subtract for borders and spaces
    left_len = line_len // 2
    right_len = line_len - left_len
    return f"# {left}{'═' * left_len}{right}{text}{left}{'═' * right_len}{right}"
input = input("Text? ")
print(nixos_flake_header(input))
