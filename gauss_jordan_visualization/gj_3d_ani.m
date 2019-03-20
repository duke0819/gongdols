function gj_3d_ani(before,after,x,y,xyz_ans)
[az,el]=view;
n_steps = 100;

diff = after-before;
% figure;
for i_step = 1:n_steps
    
    tempA = before+diff/n_steps*i_step;
    
    for i =1:3 % �� �� ���� ���� �׸�����.
        zs(1,:,:) = (tempA(1,4)-tempA(1,1)*x-tempA(1,2)*y)/(tempA(1,3)+eps);
        zs(2,:,:) = (tempA(2,4)-tempA(2,1)*x-tempA(2,2)*y)/(tempA(2,3)+eps);
        zs(3,:,:) = (tempA(3,4)-tempA(3,1)*x-tempA(3,2)*y)/(tempA(3,3)+eps);
    end
    
    surf(x,y,squeeze(zs(1,:,:)),'facecolor',[255 102 102]/255,'edgecolor','none')
    hold on;
    surf(x,y,squeeze(zs(2,:,:)),'facecolor',[51 204 51]/255,'edgecolor','none')
    surf(x,y,squeeze(zs(3,:,:)),'facecolor',[102 204 255]/255,'edgecolor','none')
    plot3(xyz_ans(1),xyz_ans(2),xyz_ans(3),'r.','markersize',50)
    xlim([-15 15])
    ylim([-15 15])
    zlim([-15 15])
    xlabel('x'); ylabel('y'); zlabel('z')
    
    % intersections
    for i = 1:3
        zdiff = squeeze(zs(i,:,:) - zs(rem(i,3)+1,:,:));
        C = contours(x, y, zdiff, [0 0]);
        % Extract the x- and y-locations from the contour matrix C.
        xL = C(1, 2:end);
        yL = C(2, 2:end);
        % Interpolate on the first surface to find z-locations for the intersection
        % line.
        zL = interp2(x, y, squeeze(zs(i,:,:)), xL, yL);
        % Visualize the line.
        line(xL, yL, zL, 'Color', 'k', 'LineWidth', 3);
    end
%     camlight
    hold off;
    view([az,el]);
    pause(0.01)
    
end