# Increment the state:
x; # swap to access state
    s/$/_/; # mimick an external carry to trigger incrementation

        # Looping the carry till there is anything to carry:
        :carry
        /_/ {
            s/0_/10/;
            s/1_/20/;
            s/2_/30/;
            s/3_/40/;
            s/4_/50/;
            s/5_/60/;
            s/6_/70/;
            s/7_/80/;
            s/8_/90/;
            s/9_/_0/;

            s/^_/10/;

            b carry;
        }

    s/0$//; # remove the effect of the initially mimicked external carry
x; # swap back from state

# Get the state and use it for representing enumeration:
G;
s/\(.*\)\n\(.*\)/\2\t\1/;
