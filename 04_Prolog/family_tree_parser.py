def sanitize(atom):
    """Convert text into a valid Prolog atom."""
    return atom.strip().lower().replace(" ", "_")


def convert_to_prolog(input_file, output_file):
    with open(input_file, "r", encoding="utf-8") as f_in, \
         open(output_file, "w", encoding="utf-8") as f_out:

        for line in f_in:
            line = line.strip()
            if not line:
                continue

            parts = [p.strip() for p in line.split(",")]
            if len(parts) != 4:
                print(f"Skipping malformed line: {line}")
                continue

            name, surname, pesel, parent_pesel = parts

            person_id = f"{sanitize(name)}_{sanitize(surname)}"

            # person fact
            f_out.write(f"person({person_id}, '{pesel}').\n")

            # parent relation (if exists)
            if parent_pesel and parent_pesel != "-":
                f_out.write(f"parent('{parent_pesel}', '{pesel}').\n")

    print(f"Converted data saved to {output_file}")


if __name__ == "__main__":
    convert_to_prolog("family-tree.txt", "family-tree.pl")