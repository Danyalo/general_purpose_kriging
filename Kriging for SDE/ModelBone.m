sol = dde23(@exam1f,[3,3,3],[855;10;260],[0 500]);

plot(sol.x,sol.y(1,:), 'red');
hold on
plot(sol.x,sol.y(2,:), 'black');
hold on
plot(sol.x,sol.y(3,:), 'blue');
grid on

legend('I(t)','Ia(t)','G(t)')

title("The dynamics of blood sugar levels. Hyperinsulin case. h = 3")
xlabel("time t (hours)");
ylabel("y(t)");